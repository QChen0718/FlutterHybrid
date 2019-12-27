import 'package:flutter/material.dart';
import 'package:flutter_module/home/loging.dart';

class TestPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('测试'),
        ),
        body: new Builder(builder: (BuildContext context) {
         return new RaisedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return LoginPage();
                }));
              }, child: new Text('进入登录'));
          }
        )

      ),


    );
  }

}