import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

/// Connection data configuration for customization
@immutable
class ConnectionDataConfig extends Equatable {
  /// Constructor
  const ConnectionDataConfig({
    @required this.domain,
    @required this.hostName,
    @required this.port,
  });

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

  @override
  List<Object> get props => [
        domain,
        hostName,
        port,
      ];

  @override
  bool get stringify => true;
}
