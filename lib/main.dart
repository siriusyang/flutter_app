import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/FileRedAndWrite/FileRedAndWrite.dart';
import 'package:flutter_app/HotelDetail/HotelDetail.dart';
import 'package:flutter_app/HotelSearch/HotelSearchResults.dart';
import 'package:flutter_app/Multithreading/MultithreadingPage.dart';

import 'NativeInteractive/NativeInteractive.dart';
import 'NativeView/NativeView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      //注册路由
      routes: {
        "hotel_list": (context) =>
            HotelSearchResultPage(title: "Hotel Search Results"),
        "hotel_detail": (context) => HotelDetailPage(),
        "MultithreadingPage": (context) => MultithreadingPage(),
        "FileRedAndWrite": (context) => FileRedAndWritePage(),
        "NativeView": (context) => NativeViewPage(),
        "NativeInteractive": (context) => NativeInteractivePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, "hotel_list");
              },
              child: Text("Hotel list"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, "hotel_detail");
              },
              child: Text("Hotel detail"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, "MultithreadingPage");
              },
              child: Text("MultithreadingPage"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, "NativeInteractive");
              },
              child: Text("NativeInteractive"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, "NativeView");
              },
              child: Text("NativeView"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, "FileRedAndWrite");
              },
              child: Text("FileRedAndWrite"),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
