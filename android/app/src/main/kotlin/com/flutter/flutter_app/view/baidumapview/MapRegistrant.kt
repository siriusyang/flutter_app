package com.flutter.flutter_app.view.baidumapview

import android.content.Context
import com.baidu.mapapi.map.MapView
import io.flutter.plugin.common.PluginRegistry

class MapRegistrant {
    companion object {
        fun registerWith(context: Context, registry: PluginRegistry, mapView: MapView? = null) {
            val key = MapRegistrant::class.java.canonicalName
            if (registry.hasPlugin(key)) {
                return
            }
            //注册
            val registrar = registry.registrarFor(key)
            //返回百度地图api
            registrar.platformViewRegistry().registerViewFactory("baidumapview", PlatformViewFactoryImpl(context, registrar.messenger(), mapView))
        }
    }
}