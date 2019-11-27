import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/NativeInteractive/NativeInteractiveBody.dart';

import '../main.dart';

//声明MethodChannel
const platform = MethodChannel('com.flutter.flutter_app');

class NativeInteractivePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NativeInteractiveState();
  }
}

class NativeInteractiveState extends State<NativeInteractivePage> {
  String message = "";

  setMessage(String msg) {
    setState(() {
      message = msg;
    });
  }

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NativeInteractive"),
      ),
      body: NativeInteractiveBody(
        data: message,
        clickCallBack: handleClick,
      ),
    );
  }

  handleClick() {
    calculate(2, 3);
  }

  calculate(int a, int b) async {
    try {
      var sum = await platform.invokeMethod("click", <String, int>{
        'a': a,
        'b': b,
      });
      setMessage(sum.toString());
    } catch (e) {
      setMessage("异常：${e.toString()}");
    }
  }

  String callByNative() {
    return "Flutter response data";
  }
}
