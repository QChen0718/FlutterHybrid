import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module/home/loging.dart';

class HomeDetailVC extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeDetailVC> {

  // 创建一个给native的channel (类似iOS的通知）
  static const methodChannel = const MethodChannel('com.pages.your/native_get');
  // 注册一个通知
//  static const EventChannel eventChannel = const EventChannel('com.pages.your/native_post');

  // 渲染前的操作，类似viewDidLoad
  jump() {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LoginPage();
    }));
  }
  back() {
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Material(
        child: new Scaffold(
          body: new Column(

              children: <Widget>[

                new Container(

                    padding: EdgeInsets.only(top: 100),
                   child: new RaisedButton(
                        onPressed: (){
                          jump();
                        }, child: new Text('进入登录'))
                ),
                new Container(

                    padding: EdgeInsets.only(top: 100,),
                    child: new RaisedButton(
                        onPressed: (){
                          back();
                        }, child: new Text('返回上一页'))
                )

              ],
            )
          ),
        ),
    );
  }
}