import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'account.dart';
import 'auth_config.dart';
import 'connection_data_config.dart';

export 'account.dart';
export 'auth_config.dart';
export 'connection_data_config.dart';

/// Options object to customize the BlipChat
@immutable
class Options extends Equatable {
  /// Constructor
  const Options({
    @required this.authConfig,
    this.account,
    this.connectionDataConfig,
    this.customCommonUrl,
    this.customWidgetUrl,
    this.windowTitle,
    this.appBarBackgroundColor,
    this.appBarForegroundColor,
  });

  /// AuthType for BlipChat
  final AuthConfig authConfig;

  /// Account data for user
  final Account account;

  /// Custom connection data configuration
  final ConnectionDataConfig connectionDataConfig;

  /// Custom url to be used on blip chat common
  final String customCommonUrl;

  /// Custom url to fetch blip chat widget lib
  final String customWidgetUrl;

  /// Title for BlipChat controller
  final String windowTitle;

  /// Color of the AppBar
  /// Format hex #FFFFFF
  final String appBarBackgroundColor;

  /// Color of the AppBar Title
  /// Format hex #FFFFFF
  final String appBarForegroundColor;

  /// Return a Map representing the object.
  Map<String, dynamic> toMap() => {
        'authConfig': authConfig.toMap(),
        'account': account?.toMap(),
        'connectionDataConfig': connectionDataConfig?.toMap(),
        'customCommonUrl': customCommonUrl,
        'customWidgetUrl': customWidgetUrl,
        'windowTitle': windowTitle,
        'appBarBackgroundColor': appBarBackgroundColor,
        'appBarForegroundColor': appBarForegroundColor,
      };

  @override
  List<Object> get props => [
        authConfig,
        account,
        connectionDataConfig,
        customCommonUrl,
        customWidgetUrl,
        windowTitle,
        appBarBackgroundColor,
        appBarForegroundColor,
      ];

  @override
  bool get stringify => true;
}
