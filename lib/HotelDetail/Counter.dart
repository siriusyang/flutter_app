import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/HotelDetail/CountContainer.dart';
import 'package:flutter_app/HotelDetail/CustomNotification.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CountContainer container = CountContainer.of(context);
    return FlatButton(
      onPressed: container.increment /*{
        container.increment;
        CustomNotification(2).dispatch(context);
      }*/,
      child: Text(
        "点击计数",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
