import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class WebController {
  final TickerProvider vsync;
  WebController(this.vsync);

  late final WebViewController c;
  late final AnimationController a;
  bool loading = true;
  bool online = true;

  Future<void> init(VoidCallback update) async {
    a = AnimationController(vsync: vsync, duration: const Duration(seconds: 1))..repeat();

    await [
      Permission.locationWhenInUse,
      Permission.nearbyWifiDevices,
      Permission.camera,
      Permission.microphone,
    ].request();

    c = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (_) { loading = true; update(); },
        onPageFinished: (_) { loading = false; update(); },
      ))
      ..loadRequest(Uri.parse('http://jasurlive.uz'));

    if (c.platform is AndroidWebViewController) {
      (c.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }

    Connectivity().onConnectivityChanged.listen((r) {
      final o = r != ConnectivityResult.none;
      online = o;
      update();
      if (o) c.reload();
    });
  }

  void dispose() => a.dispose();
}