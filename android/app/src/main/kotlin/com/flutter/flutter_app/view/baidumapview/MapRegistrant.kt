package com.flutter.flutter_app.view.baidumapview

import android.view.View
import io.flutter.plugin.common.PluginRegistry

class MapRegistrant {
    companion object {
        fun registerWith(registry: PluginRegistry, mapView: View) {
            val key = this.javaClass.canonicalName

            if (registry.hasPlugin(key)) return
            //注册
            val registrar = registry.registrarFor(key)
            //返回百度地图api
            registrar.platformViewRegistry().registerViewFactory("baidumapview", new MapViewFactory (new StandardMessageCodec (), mapView));
        }
    }
}