import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flujmyg/countermodel.dart';
import 'package:flujmyg/secondpage.dart';
import 'package:flujmyg/historySerPage.dart';

import 'package:flujmyg/sessionStrmodel.dart';
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('第一个页面'),
        actions: <Widget>[
          FlatButton(
              child: Text('下一页'),
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return SecondPage();
                          }
                        )
                      )
                  ),
        ],
      ),
      body: GestureDetector(
        child: Column(
          children: <Widget>[
            
            Text("${Provider.of<Counter>(context, listen: true).count}"),
            Text("${Provider.of<SessionStr>(context, listen: true).sessionStr}"),
            CupertinoButton(
            //按钮控件布局
            child: Text('历史服务'),
            //内边距
            padding: EdgeInsets.all(10.0),
            //背景颜色
            color: Colors.blue,
            //onPress 为 null，禁用点击的背景颜色
            disabledColor: Colors.grey,
            //最小尺寸
            minSize: 44.0,
            //按下的透明度
            pressedOpacity: 0.1,
            //边框圆角
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            //点击事件
            onPressed: () => {
              print('点我干嘛'),
              //加入跳转函数
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return HistorySerPage();
                          }
                        )
                      )
              
              }
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<Counter>(context, listen: false).increment();
          print("${Provider.of<Counter>(context, listen: false).count}");
        },
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}