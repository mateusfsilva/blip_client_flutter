import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'account.dart';
import 'auth_config.dart';
import 'connection_data_config.dart';
import 'model_mixin.dart';

export 'account.dart';
export 'auth_config.dart';
export 'connection_data_config.dart';

/// Options object to customize the BlipChat
@immutable
class Options extends Equatable with ModelMixin {
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
    required this.sendHiddenMessage,
    this.hiddenMessage,
    required this.sendChatState,
    this.chatState,
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

  /// Send a hidden message when opening the chat
  final bool sendHiddenMessage;

  /// Hidden message to send on opening the chat
  final String? hiddenMessage;

  /// Send a chat state when opening the chat
  final bool sendChatState;

  /// State to send on opening chat
  final String? chatState;

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
    bool? sendHiddenMessage,
    String? hiddenMessage,
    bool? sendChatState,
    String? chatState,
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
        sendHiddenMessage: sendHiddenMessage ?? this.sendHiddenMessage,
        hiddenMessage: hiddenMessage ?? this.hiddenMessage,
        sendChatState: sendChatState ?? this.sendChatState,
        chatState: chatState ?? this.chatState,
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
        'sendHiddenMessage': sendHiddenMessage,
        'hiddenMessage': hiddenMessage,
        'sendChatState': sendChatState,
        'chatState': chatState,
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
        sendHiddenMessage,
        hiddenMessage,
        sendChatState,
        chatState,
        customMessageMetadata,
        appBarBackgroundColor,
        appBarForegroundColor,
      ];

  @override
  List<String> get propsNames => [
        'authConfig',
        'account',
        'connectionDataConfig',
        'customCommonUrl',
        'customWidgetUrl',
        'windowTitle',
        'sendMessage',
        'initialMessage',
        'sendHiddenMessage',
        'hiddenMessage',
        'sendChatState',
        'chatState',
        'customMessageMetadata',
        'appBarBackgroundColor',
        'appBarForegroundColor',
      ];
}
