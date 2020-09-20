import 'package:flutter/material.dart';
import 'package:flujmyg/firstpage.dart';
import 'package:provider/provider.dart';
import 'package:flujmyg/countermodel.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<Counter>(create:(context) => Counter(),),
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
