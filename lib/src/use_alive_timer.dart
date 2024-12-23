import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

useAliveTimer(double interval, {required VoidCallback callback}) {
  return use(_AliveTimerHook(interval, callback: callback));
}

class _AliveTimerHook extends Hook<void> {
  const _AliveTimerHook(this.interval,{required this.callback});

  final VoidCallback callback;
  final double interval; // 时间间隔，单位秒

  @override
  HookState<void, Hook<void>> createState() => _AliveTimerHookState();
}

class _AliveTimerHookState extends HookState<void, _AliveTimerHook> {
  static final _timers = <double, Timer>{};
  static final _timerCallbacks = <double, List<_AliveTimerHookState>>{};

  static void _initTimerIfNeeded(_AliveTimerHookState state) {
    final key = state.hook.interval;
    var timer = _timers[key];
    timer ??= Timer.periodic(
      Duration(
        milliseconds: (state.hook.interval * 1000).round(),
      ),
          (timer) {
        print('timer = ${timer.hashCode}');
        _onTimer(key);
      },
    );
    _timers[state.hook.interval] = timer;

    var callbacks = _timerCallbacks[key];
    callbacks ??= [];
    callbacks = [
      ...callbacks,
      state,
    ];
    _timerCallbacks[key] = callbacks;
  }

  static void _onTimer(double key) {
    final callbacks = _timerCallbacks[key];
    if (callbacks?.isNotEmpty ?? false) {
      for (var callback in callbacks!) {
        callback._onTimerScheduled();
      }
    } else {
      _clearTimer(key);
    }
  }

  static void _clearTimer(double key) {
    final timer = _timers[key];
    if (timer != null) {
      timer.cancel();
      _timers.remove(key);
    }
    _timerCallbacks.remove(key);
  }

  static void _autoClearTimer(double key, _AliveTimerHookState state) {
    final callbacks = _timerCallbacks[key];
    if (callbacks == null) {
      return;
    }

    callbacks.remove(state);
    if (callbacks.isEmpty) {
      _clearTimer(key);
    }
  }

  void _onTimerScheduled() => hook.callback();

  @override
  void initHook() {
    super.initHook();
    _initTimerIfNeeded(this);
  }

  @override
  void didUpdateHook(_AliveTimerHook oldHook) {
    if (oldHook.interval != hook.interval) {
      _autoClearTimer(oldHook.interval, this);
      _initTimerIfNeeded(this);
    }
    super.didUpdateHook(oldHook);
  }

  @override
  void build(BuildContext context) {}

  @override
  void dispose() {
    _autoClearTimer(hook.interval, this);
    super.dispose();
  }

  @override
  String get debugLabel => 'useAliveTimer';
}