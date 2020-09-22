import 'package:flujmyg/denglumodel.dart';
import 'package:flujmyg/firstpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flujmyg/countermodel.dart';
import 'package:provider/provider.dart';
import 'package:flujmyg/HttpDio.dart';
import 'dart:convert';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:flujmyg/sessionStrmodel.dart';

class DengLuView extends StatefulWidget {
  @override
  _DengLuViewState createState() => _DengLuViewState();
}

class _DengLuViewState extends State<DengLuView> {

  DengModel dengModel = DengModel();
  
  int dengStateCode = 1;


  @override
  void initState() { 
    super.initState();
    //dengFunc();
  }

  void dengFunc() async{
    var url = 'http://113.107.136.252/Mobile/Service/login.do';
    Map<String, dynamic> formData = {'UserId':'wyu3116003219','Password':'maijunjie123'};
    dengModel.userId = 'wyu3116003219';
    dengModel.password = 'maijunjie123';
    print(dengModel.toJson());
    await request(url,formData: formData).then((value){
      var data = json.decode(value.toString());
      print(data.toString());
      dengModel = DengModel.fromJson(data);//将返回的json数据传入dengModel实例
      print(dengModel.resultCode);
      dengStateCode = dengModel.resultCode;

      //将返回的sessionStr的数据通过provider状态管理回传给其他有需要用到的页面
      Provider.of<SessionStr>(context, listen: false).addSessionStr(dengModel.sessionStr);
      if (dengStateCode == 1) {
          print('登录失败');
          SVProgressHUD.showError('登录失败');
          SVProgressHUD.dismissWithDelay(1500);
          dengStateCode = 1;
      }else if(dengStateCode == 0){
          print('登录成功');
          SVProgressHUD.showSuccess('登录成功');
          SVProgressHUD.dismissWithDelay(1500);
          
          dengStateCode = 1;
          // Provider.of<SessionStr>(context, listen: false).addSessionStr(dengModel.sessionStr);

          Navigator.pop(context, MaterialPageRoute(builder: (context) {return FirstPage();})); //成功的话就返回上一页
      }
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:<Widget>[
          Text("${Provider.of<Counter>(context, listen: true).count}"),
          CupertinoTextField(
            placeholder: '义工账号一般为wyu+学号',
            prefix: Text("用户名:"),
          ),
          CupertinoTextField(
            placeholder: '密码',
            prefix: Text("义工账户的密码:"),
            obscureText: true, //密码隐藏
          ),
          CupertinoButton(
            //按钮控件布局
            child: Text('登入'),
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
              //加入登录函数
              dengFunc(),
              
              }
            ),
        ]
      ),
    );
  }
}