import 'package:flutter/material.dart';
import 'package:webview_universal/webview_universal.dart';
// import 'package:desktop_webview_window/desktop_webview_window.dart';
// import 'package:Webview_flutter/Webview_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:leanf_dojo/models/theorem.dart';

/// 提供一个到 moogle.ai 的 Webview
class LibraryPanel extends StatefulWidget {
  const LibraryPanel({
    super.key,
  });

  @override
  State<LibraryPanel> createState() => _LibraryPanelState();
}

class _LibraryPanelState extends State<LibraryPanel> {
  WebViewController webViewController = WebViewController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> task() async {
    await webViewController.init(
        context: context,
        uri: Uri.parse('https://moogle.ai'),
        setState: (void Function() fn) {});
  }

  @override
  Widget build(BuildContext context) {
    return WebView(controller: webViewController);
  }
}
