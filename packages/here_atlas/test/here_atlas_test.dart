import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:here_atlas/here_atlas.dart';

void main() {
  const MethodChannel channel = MethodChannel('here_atlas');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await HereAtlas.platformVersion, '42');
  });
}
