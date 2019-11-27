package com.flutter.flutter_app

import android.os.Bundle
import android.util.Log
import android.widget.Button
import com.baidu.mapapi.map.BaiduMap
import com.baidu.mapapi.map.MapView
import com.flutter.flutter_app.view.baidumapview.MapRegistrant
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity : FlutterActivity() {
    lateinit var mapView: MapView
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
        Log.d(com.flutter.flutter_app.view.baidumapview.TAG, "MainActivity->create")
        //调用方法通到
        val methodChannel = MethodChannel(flutterView, "com.flutter.flutter_app")
        methodChannel.setMethodCallHandler(MethodCallHandlerImpl())
        mapView = MapView(this)
        //调用View通道
        MapRegistrant.registerWith(this,this, mapView)

    }

    override fun onResume() {
        Log.d(com.flutter.flutter_app.view.baidumapview.TAG, "MainActivity->onResume")
        super.onResume()
        mapView.onResume()
    }

    override fun onDestroy() {
        Log.d(com.flutter.flutter_app.view.baidumapview.TAG, "MainActivity->onDestroy")
        mapView.onDestroy()
        super.onDestroy()
    }

    inner class MethodCallHandlerImpl : MethodCallHandler {
        override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
            when (call.method) {
                "click" -> {
                    result.success(call.argument<Int>("a")?.plus(call.argument<Int>("b") ?: 0))
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }
}


