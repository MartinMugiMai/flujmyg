import 'package:flutter/material.dart';
import 'package:flujmyg/firstpage.dart';
import 'package:provider/provider.dart';
import 'package:flujmyg/countermodel.dart';
import 'package:flujmyg/sessionStrmodel.dart';
import 'package:flujmyg/localRealNameModel.dart';
import 'package:flujmyg/localDeptNameModel.dart';
void main() {
  runApp(MyApp());
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
      title: "provider实例",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
      ),
      home: FirstPage(),
    ),
    );
  }
}
