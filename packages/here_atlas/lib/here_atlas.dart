import 'dart:async';

import 'package:flutter/services.dart';

class HereAtlas {
  static const MethodChannel _channel =
      const MethodChannel('here_atlas');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
