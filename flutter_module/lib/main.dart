import 'package:flutter/material.dart';
import 'package:flutter_module/home/home.dart';
import 'package:flutter_module/home/homeDetail.dart';
import 'dart:ui' as ui; // 调用window拿到route判断跳转哪个界面

import 'home/myhome.dart';
import 'home/test.dart';

void main() => runApp(_widgetForRoute(ui.window.defaultRouteName));

// 根据iOS端传来的route跳转不同界面
Widget _widgetForRoute(String route) {
  switch (route) {
    case 'myApp':
      return new MyApp();
    case 'home':
      return new HomeDetailVC();
    case 'test':
      return new TestPage();
    default:
      return new MyApp();
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      //设置路由，根据路由跳转对应页面
      routes: <String, WidgetBuilder> {
        "/home":(BuildContext context) => new HomeDetailVC(),
        "/test":(BuildContext context) => new TestPage()
      },
      home: MyHomePage(title: 'Flutter Demo Home Page',),
    );

  }
}

