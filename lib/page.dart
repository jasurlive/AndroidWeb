import 'package:flutter/material.dart';
import 'controller.dart';
import 'view.dart';

class WebPage extends StatefulWidget {
  const WebPage({super.key});
  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> with SingleTickerProviderStateMixin {
  late final WebController w;

  @override
  void initState() {
    super.initState();
    w = WebController(this)..init(() => setState(() {}));
  }

  @override
  void dispose() {
    w.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: WebViewStack(w: w)),
    );
  }
}