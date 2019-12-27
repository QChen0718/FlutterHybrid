import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginPageState();
  }

}
class LoginPageState extends State<LoginPage>{
  //全局key用来获取Form 表单组件
  GlobalKey<FormState> loginkey = new GlobalKey<FormState>();
  //用户名
  String userName;
  //密码
  String password;

  void login(){
    //读取当前的Form状态
    var loginForm = loginkey.currentState;

    //验证表单
    if(loginForm.validate()){
      loginForm.save();
      print('userName:'+userName+'password:'+password);
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Container(
        padding: EdgeInsets.only(top: 88),
        child: new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.all(16.0),
              child: new Form(
                  key: loginkey,
                  child: new Column(
                    children: <Widget>[
                      new TextFormField(
                        decoration: new InputDecoration(
                            labelText: '请输入用户名'
                        ),
                        onSaved: (value){
                          userName = value;
                        },
                        onFieldSubmitted: (value){

                        },
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: '请输入密码',
                        ),
                        obscureText: true,
                        //验证表单方法
                        validator: (value){
                          return value.length < 6 ? "密码长度不够6位" : null;
                        },
                        onSaved: (value){
                          password = value;
                        },
                      )
                    ],
                  )
              ),
            ),
            new SizedBox(
              width: 340,
              height: 42,
              child: new RaisedButton(
                onPressed: login,
                child: new Text('登录',style: new TextStyle(fontSize: 18),),
              ),
            )
          ],
        ),
      ),
    );
  }

}