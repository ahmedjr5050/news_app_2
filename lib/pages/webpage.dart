import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  final String? url;

  WebPage({Key? key, this.url}) : super(key: key);

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  late final WebViewController webPageController;

  @override
  void initState() {
    webPageController = WebViewController()
      ..loadRequest(Uri.parse(widget.url!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        backgroundColor: Color(0xffab49fb),
      ),
      body: WebViewWidget(
        controller: webPageController,
      ),
    );
  }
}
