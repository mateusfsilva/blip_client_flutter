import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'model_mixin.dart';

/// Types of authentication for BlipChat users
/// [AuthType.guest]: Default type, user will not be identified
/// [AuthType.dev]: App developer is responsible for giving user data
enum AuthType {
  /// Default type, user will not be identified
  guest,

  /// App developer is responsible for giving user data
  dev,
}

/// Provider for AuthType
class AuthConfig extends Equatable with ModelMixin {
  /// Constructor
  const AuthConfig({
    required this.authType,
    this.userIdentity,
    this.userPassword,
  });

  factory AuthConfig.fromMap(Map<String, dynamic> map) => AuthConfig(
        authType: AuthType.values[map['authType'] as int],
        userIdentity: map['userIdentity'] as String,
        userPassword: map['userPassword'] as String,
      );

  factory AuthConfig.fromJson(String source) => AuthConfig.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  /// Authentication type.
  final AuthType authType;

  /// User id.
  final String? userIdentity;

  /// User password.
  final String? userPassword;

  /// Return a Map representing the object.
  Map<String, dynamic> toMap() => {
        'authType': authType.index,
        'userIdentity': userIdentity,
        'userPassword': userPassword,
      };

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [
        authType,
        userIdentity,
        userPassword,
      ];

  @override
  List<String> get propsNames => [
        'authType',
        'userIdentity',
        'userPassword',
      ];
}
