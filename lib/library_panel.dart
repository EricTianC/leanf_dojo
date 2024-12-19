import 'package:flutter/material.dart';
// import 'package:desktop_webview_window/desktop_webview_window.dart';
// import 'package:Webview_flutter/Webview_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:leanf_dojo/models/theorem.dart';

/// 提供一个到 moogle.ai 的 Webview
class LibraryPanel extends StatelessWidget {
  const LibraryPanel({
    super.key,
  });
  // TODO: Add WebView
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: Text('Library Panel'),
    );
  }
}
