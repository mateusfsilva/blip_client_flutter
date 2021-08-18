import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'method_channel_blip_client.dart';
import 'options.dart';

/// The interface that implementations of blip_client must implement.
///
/// Platform implementations should extend this class rather than implement it
/// as `blip_client` does not consider newly added methods to be breaking
/// changes. Extending this class (using `extends`) ensures that the subclass
/// will get the default implementation, while platform implementations that
/// `implements` this interface will be broken by newly added
/// [BlipClientPlatform] methods.
abstract class BlipClientPlatform extends PlatformInterface {
  /// Constructs a BlipClientPlatform.
  BlipClientPlatform() : super(token: _token);

  static final Object _token = Object();

  static BlipClientPlatform _instance = MethodChannelBlipClient();

  /// The default instance of [BlipClientPlatform] to use.
  ///
  /// Defaults to [MethodChannelBlipClient].
  static BlipClientPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [BlipClientPlatform] when they register themselves.
  static set instance(BlipClientPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);

    _instance = instance;
  }

  ///
  Future<void> openBlipChat({
    required String apiKey,
    required Options options,
  }) {
    throw UnimplementedError('openBlipChat() has not been implemented.');
  }

  ///
  Future<void> closeBlipChat() {
    throw UnimplementedError('openBlipChat() has not been implemented.');
  }

  ///
  Future<String> getPlatformVersion() {
    throw UnimplementedError('getPlatformVersion() has not been implemented.');
  }
}
