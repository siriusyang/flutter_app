import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/HotelDetail/Cake.dart';

class HotelDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        title: "IHG",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HotelDetailBody());
  }
}

class HotelDetailBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HotelDetailState();
  }
}

class HotelDetailState extends State<HotelDetailBody> {
  ScrollController _controller; //ListView控制器
  bool isToTop = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.offset > 200) {
        setState(() {
          isToTop = true;
        });
      } else if (_controller.offset < 200) {
        setState(() {
          isToTop = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
          scrollDirection: Axis.vertical,
          controller: _controller,
          slivers: <Widget>[
            SliverAppBar(
              title: Text('CustomScrollView Demo'),
              //标题
              floating: false,
              //设置悬浮样式
              flexibleSpace: Image.network(
                  "https://ihg.scene7.com/is/image/ihg/holiday-inn-express-shanghai-5809704445-4x3?wid=540&fit=constrain",
                  fit: BoxFit.cover),
              //设置悬浮头图背景
              expandedHeight: 200, //头图控件高度
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                switch (index) {
                  case 0:
                    return Center(child: Cake(width: 200.0, height: 200.0));
                    break;
                  case 1:
                    return _buildRawGestureDetector();
                    break;
                  case 2:
                    return _buildExpansionTile("Item #$index");
                    break;
                  default:
                    return ListTile(title: Text('Item #$index'));
                    break;
                }
              },
              //列表项创建方法
              childCount: 100, //列表元素个数
            )),
          ]),
      floatingActionButton: isToTop
          ? FloatingActionButton.extended(
              onPressed: isToTop
                  ? () {
                      _controller.animateTo(.0,
                          duration: Duration(microseconds: 200),
                          curve: Curves.ease);
                    }
                  : null,
              icon: Icon(Icons.arrow_upward),
              label: Text("Top"))
          : null,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _last = "AAA";

  RawGestureDetector _buildRawGestureDetector() {
    return RawGestureDetector(
      gestures: <Type, GestureRecognizerFactory>{
        TapGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
          () => TapGestureRecognizer(),
          (TapGestureRecognizer instance) {
            instance
              ..onTapDown = (TapDownDetails details) {
                setState(() {
                  _last = 'down';
                });
              }
              ..onTapUp = (TapUpDetails details) {
                setState(() {
                  _last = 'up';
                });
              }
              ..onTap = () {
                setState(() {
                  _last = 'tap';
                });
              }
              ..onTapCancel = () {
                setState(() {
                  _last = 'cancel';
                });
              };
          },
        ),
      },
      child: Container(
          width: 300.0,
          height: 300.0,
          color: Colors.yellow,
          child: Center(
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _last = "${_last}_child_tap";
                    });
                  },
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.pink,
                    child: Text(_last),
                  )))),
    );
  }

  ExpansionTile _buildExpansionTile(final String _title) {
    return ExpansionTile(
        title: Text(_title),
        leading: Icon(Icons.add),
        backgroundColor: Colors.indigo,
        children: <Widget>[Text("1"), Text("2")]);
  }
}
