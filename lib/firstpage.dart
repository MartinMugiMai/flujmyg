import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flujmyg/countermodel.dart';
import 'package:flujmyg/secondpage.dart';
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
            
            Text("${Provider.of<Counter>(context, listen: true).count}")
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