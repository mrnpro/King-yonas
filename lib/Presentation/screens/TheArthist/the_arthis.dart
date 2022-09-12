import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kingyonas/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TheArthist extends StatefulWidget {
  const TheArthist({Key? key}) : super(key: key);

  @override
  State<TheArthist> createState() => _TheArthistState();
}

class _TheArthistState extends State<TheArthist> {
  @override
  void initState() {
    // TODO: implement initState
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: const WebView(
        backgroundColor: kSecondaryWhite,
        initialUrl: 'https://kingyonasart.com/the-artist/',
      ),
    );
  }
}
