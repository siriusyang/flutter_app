import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class BaiduMapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(viewType: 'baidumapview');
    } else {
      //使用iOS平台的UIKitView，传入唯一标识符sampleView
      return UiKitView(viewType: 'baidumapview');
    }
  }
}
