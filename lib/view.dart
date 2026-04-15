import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'controller.dart';

class WebViewStack extends StatelessWidget {
  final WebController w;
  const WebViewStack({super.key, required this.w});

  @override
  Widget build(BuildContext context) {
    final p = MediaQuery.of(context).padding;

    return RefreshIndicator(
      onRefresh: () async => w.c.reload(),
      child: Stack(
        children: [
          if (w.online)
            Padding(
              padding: EdgeInsets.only(bottom: p.bottom),
              child: WebViewWidget(controller: w.c),
            ),
          if (!w.online)
            const Center(
              child: Icon(Icons.wifi_off, size: 72),
            ),
          if (w.loading && w.online)
            Positioned.fill(
              child: Container(
                alignment: Alignment.center,
                child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.8, end: 1.2),
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.easeInOut,
                  builder: (_, v, child) => Transform.scale(scale: v, child: child),
                  onEnd: () => w.a.repeat(),
                  child: RotationTransition(
                    turns: w.a,
                    child: const Icon(Icons.sync_rounded, size: 96),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}