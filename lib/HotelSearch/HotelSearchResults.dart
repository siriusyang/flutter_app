import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/HotelSearch/HoteIInfo.dart';
import 'package:flutter_app/HotelSearch/HotelSearchResultsItem.dart';

class HotelSearchResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "IHG",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HotelSearchResultPage(title: "Hotel Search Results"));
  }
}

class HotelSearchResultPage extends StatefulWidget {
  final String title;

  HotelSearchResultPage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BuildHotelSearchResultState();
  }
}

class BuildHotelSearchResultState extends State<HotelSearchResultPage>
    with WidgetsBindingObserver {
  int count;
  List<HotelInfo> _list = [];
  int length = 0;
  AppLifecycleState _notification;

  //构造方法 -> initState -> didChangeDependencies -> build
  //在 State 对象被插入视图树的时候调用。这个函数在 State 的生命周期中只会被调用一次
  @override
  void initState() {
    myprint("initState");
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadData();
  }

  //处理 State 对象依赖关系变化，会在 initState() 调用结束后，被 Flutter 调用。
  @override
  void didChangeDependencies() {
    myprint("didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    myprint("build");
    return Container(
        child: Scaffold(
            appBar: AppBar(title: Text(widget.title)), body: getBody()));
  }

  @override
  void deactivate() {
    super.deactivate();
    myprint("deactivate");
  }

  @override
  void dispose() {
    myprint("dispose");
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _notification = state;
    myprint("$state");
  }

  showLoadingDialog() {
    if (_list.length == 0) {
      return true;
    }
    return false;
  }

  getBody() {
    if (showLoadingDialog()) {
      return Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
          itemCount: _list.length,
          itemBuilder: (BuildContext context, int position) {
            return HotelSearchResultsItem(_list[position]);
          });
    }
  }

  _loadData() async {
    //接口地址
    const url = "https://jsonplaceholder.typicode.com/posts";

    //定义httpClient
    HttpClient client = new HttpClient();
    //定义request
    HttpClientRequest request = await client.getUrl(Uri.parse(url));
    //定义reponse
    HttpClientResponse response = await request.close();
    //respinse返回的数据，是字符串
    String responseBody = await response.transform(utf8.decoder).join();
    //关闭httpClient
    client.close();
    //字符串需要转化为JSON
    List jsonList = jsonDecode(responseBody);
//    myprint(jsonList);
    setState(() {
      jsonList.forEach((f) {
        _list.add(HotelInfo.fromJson(f));
      });
//      _list = [
//        HotelInfo(
//            hotelName: "Hotel Name",
//            logoImageUrl:
//                "https://www.ihg.com.cn/resources/global/find-hotels/dist/assets/svg/brand-logos/round/ex.svg",
//            backgroundImageUrl:
//                "https://ihg.scene7.com/is/image/ihg/holiday-inn-express-shanghai-5809704445-4x3?wid=540&fit=constrain",
//            distance: 10),
//        HotelInfo(
//            hotelName: "Hotel Name2",
//            logoImageUrl:
//                "https://www.ihg.com.cn/resources/global/find-hotels/dist/assets/svg/brand-logos/round/cp.svg",
//            backgroundImageUrl:
//                "https://ihg.scene7.com/is/image/ihg/crowne-plaza-shanghai-4707023678-4x3?wid=540&fit=constrain",
//            distance: 10)
//      ];
    });
  }

  void myprint(Object log) {
    print("LOG-PRINT:${log}");
  }
}
