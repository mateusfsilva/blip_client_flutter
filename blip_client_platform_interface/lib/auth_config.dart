import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

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
class AuthConfig extends Equatable {
  /// Constructor
  const AuthConfig({
    @required this.authType,
    this.userIdentity,
    this.userPassword,
  });

  /// Authentication type.
  final AuthType authType;

  /// User id.
  final String userIdentity;

  /// User password.
  final String userPassword;

  /// Return a Map representing the object.
  Map<String, dynamic> toMap() => {
        'authType': authType.index,
        'userIdentity': userIdentity,
        'userPassword': userPassword,
      };

  @override
  List<Object> get props => [
        authType,
        userIdentity,
        userPassword,
      ];

  @override
  bool get stringify => true;
}
