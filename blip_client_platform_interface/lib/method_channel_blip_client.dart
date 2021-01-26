import 'package:flutter/services.dart';

import 'blip_client_platform_interface.dart';
import 'options.dart' show Options;

export 'options.dart';

const MethodChannel _channel = MethodChannel(
  'plugins.blubybs2.com/blip_client',
);

/// An implementation of [BlipClientPlatform] that uses method channels.
class MethodChannelBlipClient extends BlipClientPlatform {
  ///
  @override
  Future<void> openBlipChat({
    String apiKey,
    Options options,
  }) {
    return _channel.invokeMethod(
      'openBlipChat',
      <String, dynamic>{
        'appKey': apiKey,
        'options': options.toMap(),
      },
    );
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
          (version) => version,
        );
  }
}
