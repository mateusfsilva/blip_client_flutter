import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'model_mixin.dart';

/// Connection data configuration for customization
@immutable
class ConnectionDataConfig extends Equatable with ModelMixin {
  /// Constructor
  const ConnectionDataConfig({
    required this.domain,
    required this.hostName,
    required this.port,
  });

  factory ConnectionDataConfig.fromMap(Map<String, dynamic> map) =>
      ConnectionDataConfig(
        domain: map['domain'] as String,
        hostName: map['hostName'] as String,
        port: map['port'] as String,
      );

  factory ConnectionDataConfig.fromJson(String source) =>
      ConnectionDataConfig.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  /// Domain name.
  final String domain;

  /// Host name.
  final String hostName;

  /// Server port.
  final String port;

  /// Return a Map representing the object.
  Map<String, dynamic> toMap() => {
        'domain': domain,
        'hostName': hostName,
        'port': port,
      };

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [
        domain,
        hostName,
        port,
      ];

  @override
  List<String> get propsNames => [
        'domain',
        'hostName',
        'port',
      ];
}
