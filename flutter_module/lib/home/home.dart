import 'package:flutter/material.dart';
import 'package:flutter_module/home/homeDetail.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            //移除上部间距，listview默认顶部是有间距的
            removeTop: true,
            //context 当前上下文
            context: context,
            child: new ListView.builder(
              //将列表的默认内间距设置成0
              padding: EdgeInsets.only(left: 0.0,top: 88.0,right: 0.0,bottom: 0.0),
              itemCount: 10,
//              itemExtent: 50,
              itemBuilder: (context,index){
                return cell(context);
              },
            ),
          ),
        ],
      )
    );
  }
  Widget cell(BuildContext context){
    return new GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context){
          return HomeDetailVC();
        }));
        print('cell被点击');
      },
      child: new Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 10),
        child: new Row(
          children: <Widget>[
            new Image.asset(
              ''
            ),
            new Container(
              padding: EdgeInsets.only(left: 20),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text('四川成阿',style: new TextStyle(backgroundColor: Colors.blue),),
                  new Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: new Row(
                      children: <Widget>[
                          new Container(
                            height: 17,
                            width: 60,
                            child: new Text('线索数 6',
                              style: new TextStyle(
                                  color: Color.fromRGBO( 55, 174, 226,1),
                                  fontSize: 11
                              ),
                              textAlign: TextAlign.center,
                            ),
                            decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color.fromRGBO(88, 137, 236,0.07),
                            ),
                          ),
                          new Container(
                            height: 17,
                            width: 70,
                            margin: EdgeInsets.only(left: 10),
                            child: new Text('最高分 4.8',
                                style: new TextStyle(
                                    color:  Color.fromRGBO(248, 128, 63, 1),
                                    fontSize: 11,
                                ),
                                textAlign: TextAlign.center,
                            ),
                            decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color.fromRGBO(243, 110, 39, 0.07)
                            ),
                          ),
                      ],
                    ),
                  ),
                  new Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: new Row(
                        children: <Widget>[
                          new Padding(
                              padding: EdgeInsets.only(right: 10),
                            child: new Text(
                              '区域',
                              style: new TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(178, 178, 178, 1)
                              ),
                            ),
                          ),
                          new Text(
                            '四川 成都',
                            style: new TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(117, 115, 118, 1),
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          new Padding(
                              padding: EdgeInsets.only(left: 80,right: 10),
                            child: new Text(
                              '一般财政',
                              style: new TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(178, 178, 178, 1)
                              ),
                            ),
                          ),
                          new Text(
                            '80亿',
                            style: new TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(117, 115, 118, 1),
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                  ),
                  new Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: new Row(
                      children: <Widget>[
                        new Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: new Text(
                            '级别',
                            style: new TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(178, 178, 178, 1)
                            ),
                          ),
                        ),
                        new Text(
                          '市级',
                          style: new TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(117, 115, 118, 1),
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        new Padding(
                          padding: EdgeInsets.only(left: 80,right: 10),
                          child: new Text(
                            '总资产',
                            style: new TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(178, 178, 178, 1)
                            ),
                          ),
                        ),
                        new Text(
                          '200亿',
                          style: new TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(117, 115, 118, 1),
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: new Row(
                      children: <Widget>[
                        new Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: new Text(
                            '评级',
                            style: new TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(178, 178, 178, 1)
                            ),
                          ),
                        ),
                        new Text(
                          'AA+',
                          style: new TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(117, 115, 118, 1),
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        new Padding(
                          padding: EdgeInsets.only(left: 80,right: 10),
                          child: new Text(
                            '发债',
                            style: new TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(178, 178, 178, 1)
                            ),
                          ),
                        ),
                        new Text(
                          '公募债',
                          style: new TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(117, 115, 118, 1),
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )
      )
    );
  }
}