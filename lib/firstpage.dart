import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flujmyg/countermodel.dart';
import 'package:flujmyg/secondpage.dart';
import 'package:flujmyg/historySerPage.dart';
import 'package:flujmyg/HttpDio.dart';
import 'dart:convert';
import 'package:flujmyg/sessionStrmodel.dart';
import 'package:flujmyg/ygInfoModel.dart';
import 'package:flujmyg/localRealNameModel.dart';

class FirstPage extends StatelessWidget {
  
  YgInfoModel ygInfo = YgInfoModel();
  //Data ygInfoData = Data();
  String localRealName = '666';
  String localDeptName = '666';
  int wangStateCode = 1;

  void dengFunc3(String gotSessionStr) async{
    var url = 'http://113.107.136.252/Mobile/Service/userinfo.do';
    Map<String, dynamic> formData = {'sessionStr': gotSessionStr };
    //dengModel.userId = 'wyu3116003219';
    //dengModel.password = 'maijunjie123';
    //print(dengModel.toJson());
    await request(url,formData: formData).then((value){
      var data = json.decode(value.toString());
      //print(data.toString());
      //dengModel = DengModel.fromJson(data);
      ygInfo = YgInfoModel.fromJson(data);
      print('bbbbbbbbbbbbbbb');
      print(ygInfo.msg);
      print(ygInfo.data[0].RealName);
      localRealName = ygInfo.data[0].RealName;
      Provider.of<SessionStr>(context, listen: false).addSessionStr(localRealName);
      print(localRealName);
      print(ygInfo.data[0].DeptName);
      localDeptName = ygInfo.data[0].DeptName;
      print(localDeptName);
      //print(dengModel.resultCode);
      //dengStateCode = dengModel.resultCode;

      
    });
    
  }
  
  @override
  Widget build(BuildContext context) {
    String heresessionStr = "${Provider.of<SessionStr>(context, listen: true).sessionStr}";
    dengFunc3(heresessionStr);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('第一个页面'),
        actions: <Widget>[
          FlatButton(
              child: Text('登录江门义工'),
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
            Text('志愿者姓名：${localRealName}'),
            Text('所属组织：${localDeptName}'),
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