import 'package:flutter/material.dart';
import 'package:flutter_app/NativeView/BaiduMapView.dart';

class NativeViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NativeViewState();
  }
}

class NativeViewState extends State<NativeViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("NativeViewPage")),
      body: Center(child: BaiduMapView()),
    );
  }
}
