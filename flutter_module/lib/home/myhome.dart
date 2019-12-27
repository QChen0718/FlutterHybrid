import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module/home/home.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // 创建一个给native的channel (类似iOS的通知）
  static const methodChannel = const MethodChannel('com.pages.your/native_get');


  _iOSPushToVC() async {
    await methodChannel.invokeMethod('iOSFlutter', '参数');
  }

  _iOSPushToVC1() async {
    Map<String, dynamic> map = {"code": "200", "data":[1,2,3]};
    await methodChannel.invokeMethod('iOSFlutter1', map);
  }

  _iOSPushToVC2() async {
    dynamic result;
    try {
      result = await methodChannel.invokeMethod('iOSFlutter2');
    } on PlatformException {
      result = "error";
    }
    if (result is String) {
      print(result);
      Navigator.push(context, MaterialPageRoute(builder:(context) {
          return HomePage();
      }));
//      showModalBottomSheet(context: context, builder: (BuildContext context) {
//        return new Container(
//          child: new Center(
//            child: new Text(result, style: new TextStyle(color: Colors.brown), textAlign: TextAlign.center,),
//          ),
//          height: 40.0,
//        );
//      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new FlatButton(onPressed: () {
              _iOSPushToVC();
            }, child: new Text("跳转ios新界面，参数是字符串")),
            new FlatButton(onPressed: () {
              _iOSPushToVC1();
            }, child: new Text("传参，参数是map，看log")),
            new FlatButton(onPressed: () {
              _iOSPushToVC2();
            }, child: new Text("接收客户端相关内容")),
          ],
        ),
      ),
    );
  }
}
