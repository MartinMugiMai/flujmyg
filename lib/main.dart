import 'package:flutter/material.dart';
import 'package:flujmyg/firstpage.dart';
import 'package:provider/provider.dart';
import 'package:flujmyg/countermodel.dart';
import 'package:flujmyg/sessionStrmodel.dart';
import 'package:flujmyg/localRealNameModel.dart';
import 'package:flujmyg/localDeptNameModel.dart';
import 'dart:io';
import 'package:flutter/services.dart';
void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarBrightness: Brightness.light);
        
   SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);


  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<Counter>(create:(context) => Counter(),),
      ChangeNotifierProvider<SessionStr>(create:(context) => SessionStr(),),
      ChangeNotifierProvider<LocalRealName>(create:(context) => LocalRealName(),),
      ChangeNotifierProvider<LocalDeptName>(create:(context) => LocalDeptName(),),
    ],
    child: MaterialApp(
      title: "江门义工查询",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
      ),
      home: FirstPage(),
    ),
    
    );
  }
}
