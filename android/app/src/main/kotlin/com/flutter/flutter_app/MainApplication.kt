package com.flutter.flutter_app

import com.baidu.mapapi.CoordType
import com.baidu.mapapi.SDKInitializer
import io.flutter.app.FlutterApplication

class MainApplication : FlutterApplication() {
    override fun onCreate() {
        super.onCreate()
        // 初始化百度地图 SDK
        SDKInitializer.initialize(this)
        SDKInitializer.setHttpsEnable(true)
        SDKInitializer.setCoordType(CoordType.BD09LL)

    }
}