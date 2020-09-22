import 'package:flutter/material.dart';
import 'package:flujmyg/sessionStrmodel.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flujmyg/HttpDio.dart';

class SerTimePage extends StatefulWidget {
  @override
  _SerTimePageState createState() => _SerTimePageState();
}

class _SerTimePageState extends State<SerTimePage> {
  //String newUrl = 'http://113.107.136.252/Mobile/Service/userinfo.do?sessionStr=${Provider.of<SessionStr>(context, listen: true).sessionStr}';
  //String hereSessionStr = Provider.of<SessionStr>(context, listen: true).sessionStr;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('历史服务'),
      ),
      body: WebView(
        initialUrl: 'http://113.107.136.252/Mobile/Member/serviceTotal.do?sessionStr=${Provider.of<SessionStr>(context, listen: true).sessionStr}',
        javascriptMode: JavascriptMode.unrestricted,      
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}