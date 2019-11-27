import 'package:flutter/material.dart';

class NativeInteractiveBody extends StatelessWidget {
  String data;
  Function clickCallBack;

  NativeInteractiveBody({Key key, this.data, this.clickCallBack})
      : super(key: key);

  TextStyle textStylePink = TextStyle(color: Colors.pink);
  TextStyle textStyleBlack = TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            RaisedButton(onPressed: clickCallBack, child: Text("调用原始数据"))
          ],
        ),
        Text.rich(TextSpan(children: <TextSpan>[
          TextSpan(text: "显示返回数据：", style: textStyleBlack),
          TextSpan(text: data, style: textStylePink),
        ]))
      ],
    );
  }
}
