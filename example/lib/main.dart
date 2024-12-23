import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_use/flutter_use.dart';

import 'entity/GoodsEntity.dart';
import 'goods_item.dart';

const jsonPath = 'assets/json/test.json';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      child: const MyHomePage(),
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: child,
        );
      },
    );
  }
}

class MyHomePage extends HookWidget {
  const MyHomePage({super.key});

  Future<List<GoodsEntity>> _getLocalJson() async {
    var data = <GoodsEntity>[];
    try {
      final contentString = await rootBundle.loadString(jsonPath);
      final list = json.decode(contentString);
      data.addAll(getGoodsEntityList(list));
    } finally {}

    return data;
  }

  @override
  Widget build(BuildContext context) {
    final data = useState(<GoodsEntity>[]);
    useEffect(() {
      _getLocalJson().then((list) {
        data.value = list;
      });
      return null;
    }, const []);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('flutter_hooks demo'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => GoodsItem(
          goods: data.value[index],
        ),
        itemCount: data.value.length,
      ),
    );
  }
}
