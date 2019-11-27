import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/HotelSearch/HoteIInfo.dart';

class HotelSearchResultsItem extends StatelessWidget {
  HotelInfo _hotelInfo;

  HotelSearchResultsItem(this._hotelInfo);

  @override
  Widget build(BuildContext context) {
    TextStyle blackStyle = TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 20,
        color: Colors.black); //黑色样式
    TextStyle redStyle =
        TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red);
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(children: <Widget>[
            Image(
                filterQuality: FilterQuality.high,
                image: NetworkImage(_hotelInfo.backgroundImageUrl),
                fit: BoxFit.cover,
                width: 400,
                height: 100,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes
                          : null,
                    ),
                  );
                }),
            Positioned(
              left: 10,
              top: 10,
              child: Text(
                _hotelInfo.hotelName,
                style: new TextStyle(
                    color: Colors.grey[500], backgroundColor: Colors.black),
              ),
            ),
            Positioned(
                right: 10,
                bottom: 10,
                child: Text(
                  "距离你现在的位置${_hotelInfo.distance}公里",
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                )),
          ]),
          Text(
            "距离你现在的位置${_hotelInfo.distance}公里",
            style: new TextStyle(
              color: Colors.black,
            ),
          ),
          Text.rich(TextSpan(children: <TextSpan>[
            TextSpan(text: '文本是视图系统中常见的控件，它用来显示一段特定样式的字符串，类似', style: redStyle),
            //第1个片段，红色样式
            TextSpan(text: 'Android', style: blackStyle),
            //第1个片段，黑色样式
            TextSpan(text: '中的', style: redStyle),
            //第1个片段，红色样式
            TextSpan(text: 'TextView', style: blackStyle)
            //第1个片段，黑色样式
          ]))
        ],
      ),
    );
  }
}
