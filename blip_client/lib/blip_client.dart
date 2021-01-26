import 'dart:async';

import 'package:blip_client_platform_interface/method_channel_blip_client.dart';
import 'package:flutter/services.dart';

export 'package:blip_client_platform_interface/options.dart';

///
class BlipClient {
  ///
  const BlipClient({
    this.apiKey,
    this.options,
  });

  ///
  final String apiKey;

  ///
  final Options options;

  ///
  static const MethodChannel _channel = MethodChannel('blip_client');

  ///
  static Future<String> get platformVersion async {
    final version = await _channel.invokeMethod('getPlatformVersion');

    return version;
  }

  ///
  Future<void> openBlipChat() async {
    return await MethodChannelBlipClient().openBlipChat(
      apiKey: apiKey,
      options: options,
    );
  }

  ///
  Future<void> closeBlipChat() async {
    return await MethodChannelBlipClient().closeBlipChat();
  }

  ///
  Future<String> getPlatformVersion() async {
    return await MethodChannelBlipClient().getPlatformVersion();
  }
}
