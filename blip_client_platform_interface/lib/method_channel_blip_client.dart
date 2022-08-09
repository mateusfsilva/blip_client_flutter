import 'dart:convert';

import 'package:flutter/services.dart';

import 'blip_client_platform_interface.dart';

export 'model_mixin.dart';
export 'options.dart';

const MethodChannel _channel = MethodChannel(
  'plugins.blu.bs2.com/blip-client',
);

/// An implementation of [BlipClientPlatform] that uses method channels.
class MethodChannelBlipClient extends BlipClientPlatform {
  ///
  @override
  Future<void> openBlipChat({
    required String apiKey,
    required Options options,
  }) {
    final data = json.encode(
      <String, dynamic>{
        'appKey': apiKey,
        'options': options.toMap(),
      },
    );

    return _channel.invokeMethod('openBlipChat', data);
  }

  ///
  @override
  Future<void> closeBlipChat() {
    return _channel.invokeMethod('closeBlipChat');
  }

  ///
  @override
  Future<String> getPlatformVersion() {
    return _channel.invokeMethod('getPlatformVersion').then(
          (version) => version as String,
        );
  }
}
