import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flujmyg/countermodel.dart';
import 'package:provider/provider.dart';
class DengLuView extends StatefulWidget {
  @override
  _DengLuViewState createState() => _DengLuViewState();
}

class _DengLuViewState extends State<DengLuView> {
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
              }
            ),
        ]
      ),
    );
  }
}