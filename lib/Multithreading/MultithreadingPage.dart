import 'dart:isolate';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class MultithreadingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MultithreadingState();
  }
}
getMsg(sendPort) => sendPort.send("Hello");
class _MultithreadingState extends State<MultithreadingPage> {
  String message = "";
  Isolate isolate;

  @override
  void initState() {
    super.initState();
    message = "initState";
  }



  start() async {
    ReceivePort receivePort = ReceivePort(); //创建管道
    //创建并发Isolate，并传入发送管道
    isolate = await Isolate.spawn(getMsg, receivePort.sendPort); //监听管道消息
    receivePort.listen((data) {
      setState(() {
        message = "async Data：$data";
      });
      print('Data：$data');
      receivePort.close(); //关闭管道
      isolate?.kill(priority: Isolate.immediate); //杀死并发Isolate
      isolate = null;
    });
  }

  pressed() {
    start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Multithreading Page")),
        body: Column(
          children: <Widget>[
            RaisedButton(onPressed: pressed, child: Text("Click")),
            Text(message)
          ],
        ));
  }
}
