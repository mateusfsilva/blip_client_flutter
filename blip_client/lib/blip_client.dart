import 'dart:async';

import 'package:blip_client_platform_interface/method_channel_blip_client.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

export 'package:blip_client_platform_interface/options.dart';

///
class BlipClient extends Equatable {
  ///
  const BlipClient({
    required this.apiKey,
    required this.options,
  });

  ///
  final String apiKey;

  ///
  final Options options;

  ///
  static const MethodChannel _channel = MethodChannel('blip-client');

  ///
  static Future<String> get platformVersion async {
    final version = await _channel.invokeMethod('getPlatformVersion') as String;

    return version;
  }

  ///
  Future<void> openBlipChat() async {
    return MethodChannelBlipClient().openBlipChat(
      apiKey: apiKey,
      options: options,
    );
  }

  ///
  Future<void> closeBlipChat() async {
    return MethodChannelBlipClient().closeBlipChat();
  }

  ///
  Future<String> getPlatformVersion() async {
    return MethodChannelBlipClient().getPlatformVersion();
  }

  @override
  List<Object> get props => [apiKey, options];

  @override
  bool get stringify => true;
}
