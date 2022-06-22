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
    required this.authConfig,
    this.account,
    this.connectionDataConfig,
    this.customCommonUrl,
    this.customWidgetUrl,
    this.windowTitle,
    required this.sendMessage,
    this.initialMessage,
    this.customMessageMetadata,
    this.appBarBackgroundColor,
    this.appBarForegroundColor,
  });

  /// AuthType for BlipChat
  final AuthConfig authConfig;

  /// Account data for user
  final Account? account;

  /// Custom connection data configuration
  final ConnectionDataConfig? connectionDataConfig;

  /// Custom url to be used on blip chat common
  final String? customCommonUrl;

  /// Custom url to fetch blip chat widget lib
  final String? customWidgetUrl;

  /// Title for BlipChat controller
  final String? windowTitle;

  /// Send an initial message?
  final bool sendMessage;

  /// Initial message to send when opening the chat
  final String? initialMessage;

  /// Metadata to send on opening the chat
  final Map<String, String>? customMessageMetadata;

  /// Color of the AppBar
  /// Format hex #FFFFFF
  final String? appBarBackgroundColor;

  /// Color of the AppBar Title
  /// Format hex #FFFFFF
  final String? appBarForegroundColor;

  /// Create a copy of the object instance.
  Options copyWith({
    AuthConfig? authConfig,
    Account? account,
    ConnectionDataConfig? connectionDataConfig,
    String? customCommonUrl,
    String? customWidgetUrl,
    String? windowTitle,
    bool? sendMessage,
    String? initialMessage,
    Map<String, String>? customMessageMetadata,
    String? appBarBackgroundColor,
    String? appBarForegroundColor,
  }) =>
      Options(
        authConfig: authConfig ?? this.authConfig,
        account: account ?? this.account,
        connectionDataConfig: connectionDataConfig ?? this.connectionDataConfig,
        customCommonUrl: customCommonUrl ?? this.customCommonUrl,
        customWidgetUrl: customWidgetUrl ?? this.customWidgetUrl,
        windowTitle: windowTitle ?? this.windowTitle,
        sendMessage: sendMessage ?? this.sendMessage,
        initialMessage: initialMessage ?? this.initialMessage,
        customMessageMetadata:
            customMessageMetadata ?? this.customMessageMetadata,
        appBarBackgroundColor:
            appBarBackgroundColor ?? this.appBarBackgroundColor,
        appBarForegroundColor:
            appBarForegroundColor ?? this.appBarForegroundColor,
      );

  /// Return a Map representing the object.
  Map<String, dynamic> toMap() => {
        'authConfig': authConfig.toMap(),
        'account': account?.toMap(),
        'connectionDataConfig': connectionDataConfig?.toMap(),
        'customCommonUrl': customCommonUrl,
        'customWidgetUrl': customWidgetUrl,
        'windowTitle': windowTitle,
        'sendMessage': sendMessage,
        'initialMessage': initialMessage,
        'customMessageMetadata': customMessageMetadata,
        'appBarBackgroundColor': appBarBackgroundColor,
        'appBarForegroundColor': appBarForegroundColor,
      };

  @override
  List<Object?> get props => [
        authConfig,
        account,
        connectionDataConfig,
        customCommonUrl,
        customWidgetUrl,
        windowTitle,
        sendMessage,
        initialMessage,
        customMessageMetadata,
        appBarBackgroundColor,
        appBarForegroundColor,
      ];

  @override
  bool get stringify => true;
}
