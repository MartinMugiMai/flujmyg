import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flujmyg/countermodel.dart';
import 'package:flujmyg/secondpage.dart';
import 'package:flujmyg/historySerPage.dart';
import 'package:flujmyg/serTimePage.dart';
import 'package:flujmyg/HttpDio.dart';
import 'dart:convert';
import 'package:flujmyg/sessionStrmodel.dart';
import 'package:flujmyg/ygInfoModel.dart';
import 'package:flujmyg/localRealNameModel.dart';
import 'package:flujmyg/localDeptNameModel.dart';

import 'package:x5_webview/x5_webview.dart';
import 'package:x5_webview/x5_sdk.dart';
import 'package:flutter/src/foundation/platform.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {




//class FirstPage extends StatelessWidget {
  
  YgInfoModel ygInfo = YgInfoModel();
  
  String localRealName = '666';
  String localDeptName = '666';
  int wangStateCode = 1;
  //String heresessionStr = Provider.of<SessionStr>(context, listen: false).sessionStr;

  
  @override
  void initState() { 
    super.initState();
    // dengFunc3(Provider.of<SessionStr>(context, listen: false).sessionStr);
  }

  

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
      Provider.of<LocalRealName>(context, listen: false).addLocalRealName(localRealName);
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
    String hereRealName = Provider.of<LocalRealName>(context, listen: true).localRealName;
    String hereDeptName = Provider.of<LocalDeptName>(context, listen: true).localDeptName;
    String dengPageButtonTitle = '去登录';
    // if (heresessionStr != '') {
    //   dengPageButtonTitle = '切换账号';
    //   wangStateCode = 0;

    // }else if(heresessionStr == 'null') {
    //   wangStateCode = 1;
    // }else{
    //   wangStateCode = 1;
    // }
    switch (heresessionStr) {
      case '': 
        wangStateCode = 1;
        break;
      case 'null': 
        wangStateCode = 1;
        break;
      default:
      dengPageButtonTitle = '切换账号';
      wangStateCode = 0;
    }

    //dengFunc3(heresessionStr);
    if (wangStateCode == 0) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('flutter实现的江门义工时查询'),
          actions: <Widget>[
            FlatButton(
                child: Text(dengPageButtonTitle),
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
              Text("${wangStateCode}"),
              //Text("${Provider.of<Counter>(context, listen: true).count}"),
              
              Text("${Provider.of<SessionStr>(context, listen: true).sessionStr}"),
              Text('志愿者姓名：${hereRealName}'),
              Text('所属组织：${hereDeptName}'),
              
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
                //'http://113.107.136.252/Mobile/Member/activityList.do?type=3&sessionStr=${Provider.of<SessionStr>(context, listen: true).sessionStr}'
                if(defaultTargetPlatform == TargetPlatform.android){
                  //X5Sdk.openWebActivity("https://www.baidu.com",title: "web页面")
                  X5Sdk.openWebActivity('http://113.107.136.252/Mobile/Member/activityList.do?type=3&sessionStr=${Provider.of<SessionStr>(context, listen: false).sessionStr}',title: "历史活动")
                }else{
                  Navigator.push(context, MaterialPageRoute(builder: (context) {return HistorySerPage();}))
                }
                }
              ),

              CupertinoButton(
              //按钮控件布局
              child: Text('服务时长'),
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
                if(defaultTargetPlatform == TargetPlatform.android){
                //X5Sdk.openWebActivity("https://www.baidu.com",title: "web页面")
                X5Sdk.openWebActivity('http://113.107.136.252/Mobile/Member/serviceTotal.do?sessionStr=${Provider.of<SessionStr>(context, listen: false).sessionStr}',title: "服务时长")
                }else{
                //Navigator.push(context, MaterialPageRoute(builder: (context) {return SerTimePage();}))
                Navigator.push(context, MaterialPageRoute(builder: (context) {return SerTimePage();}))
                }
                
                }//onPressed
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
      
    }else{
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('flutter实现的江门义工时查询'),
          actions: <Widget>[
            FlatButton(
                child: Text(dengPageButtonTitle),
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
              Text("${wangStateCode}"),
              //Text("${Provider.of<Counter>(context, listen: true).count}"),
              
              //Text("${Provider.of<SessionStr>(context, listen: true).sessionStr}"),
              Text('请先登录'),
              Text('志愿者姓名：${hereRealName}'),
              Text('所属组织：${hereDeptName}'),
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
    }// if else
  }
}