package com.flutter.flutter_app.view.baidumapview

import android.content.Context
import android.util.Log
import android.view.View
import com.baidu.mapapi.map.MapView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

const val TAG = "PlatformView"

class PlatformViewFactoryImpl(val _context: Context?, val binaryMessenger: BinaryMessenger, val mapView: MapView?=null) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context?, id: Int, p2: Any?): PlatformView {
        Log.d(TAG, "PlatformViewFactoryImpl->create")
        return PlatformViewImpl(_context, id, mapView)
    }
}

class PlatformViewImpl(context: Context?, val id: Int, val mapView: MapView?) : PlatformView {
    var _mapView: MapView

    init {
        Log.d(TAG, "PlatformViewImpl->init")
        _mapView = MapView(context)
    }

    override fun getView(): View {
        Log.d(TAG, "getView")
        return _mapView
    }

    override fun dispose() {
        _mapView.onDestroy()
        Log.d(TAG, "dispose")
    }
}