package com.flutter.flutter_app

import android.os.Bundle
import android.util.Log
import com.flutter.flutter_app.view.baidumapview.MapRegistrant
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
        Log.d(com.flutter.flutter_app.view.baidumapview.TAG, "MainActivity->create")
        //调用方法通到
        val methodChannel = MethodChannel(flutterView, "com.flutter.flutter_app")
        methodChannel.setMethodCallHandler(MethodCallHandlerImpl())

        //调用View通道
        MapRegistrant.registerWith(this,this, null)

    }

    override fun onResume() {
        Log.d(com.flutter.flutter_app.view.baidumapview.TAG, "MainActivity->onResume")
        super.onResume()
    }

    override fun onDestroy() {
        Log.d(com.flutter.flutter_app.view.baidumapview.TAG, "MainActivity->onDestroy")
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


