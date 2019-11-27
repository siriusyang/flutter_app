class HotelInfo {
  String hotelName;
  String logoImageUrl;
  String backgroundImageUrl;
  bool isShowRate;
  double distance;

  HotelInfo(
      {this.hotelName,
      this.logoImageUrl,
      this.backgroundImageUrl,
      this.isShowRate,
      this.distance});

  HotelInfo.fromJson(Map<String, dynamic> json)
      : hotelName = json['title'],
        backgroundImageUrl =
            "https://ihg.scene7.com/is/image/ihg/holiday-inn-express-shanghai-5809704445-4x3?wid=540&fit=constrain",
        logoImageUrl =
            "https://ihg.scene7.com/is/image/ihg/holiday-inn-express-shanghai-5809704445-4x3?wid=540&fit=constrain",
        distance = 10;
}
