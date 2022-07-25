import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWeb extends StatelessWidget {

  final String url;
  const ArticleWeb({required this.url, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
