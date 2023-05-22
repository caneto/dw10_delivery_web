
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

mixin HistoryBackListner<T extends StatefulWidget> on State<T> {
  final _location = const BrowserPlatformLocation();

  void onHistoryBack(Event event);

  @override
  void initState() {
    super.initState();
    _location.addPopStateListener((event) async {

    });
  }
}