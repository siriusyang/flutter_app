import 'package:flutter/widgets.dart';
import 'package:flutter_app/HotelDetail/HotelDetail.dart';

class CountContainer extends InheritedWidget {
  final HotelDetailState hotelDetailState;
  final Function() increment;

  static CountContainer of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CountContainer) as CountContainer;

  CountContainer(
      {Key key,
      @required this.hotelDetailState,
      @required this.increment,
      @required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(CountContainer oldWidget) {
    return hotelDetailState.count != oldWidget.hotelDetailState.count;
  }
}
