import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

/// User gender
enum Gender {
  /// Gender Male
  male,

  /// Gender Female
  female,
}

/// Represents an user account information.
@immutable
class Account extends Equatable {
  /// Create a new object.
  const Account({
    this.fullName,
    this.address,
    this.city,
    this.email,
    this.phoneNumber,
    this.photoUri,
    this.cellPhoneNumber,
    this.gender,
    this.group,
    this.taxDocument,
    this.timezone,
    this.culture,
    this.extras,
    this.isTemporary,
    this.password,
    this.oldPassword,
    this.inboxSize,
    this.allowGuestSender,
    this.allowUnknownSender,
    this.storeMessageContent,
    this.encryptMessageContent,
  });

  /// Create an Account object from a json.
  factory Account.fromMap(Map<String, dynamic> map) => Account(
        fullName: map['fullName'] as String,
        address: map['address'] as String,
        city: map['city'] as String,
        email: map['email'] as String,
        phoneNumber: map['phoneNumber'] as String,
        photoUri: Uri.tryParse(map['photoUri'] as String),
        cellPhoneNumber: map['cellPhoneNumber'] as String,
        gender:
            map['gender'] != null ? Gender.values[map['gender'] as int] : null,
        group: map['group'] as String,
        taxDocument: map['taxDocument'] as String,
        timezone: map['timezone'] as int,
        culture: map['culture'] as String,
        extras: Map<String, String>.from(map['extras'] as Map<String, dynamic>),
        isTemporary: map['isTemporary'] as bool,
        password: map['password'] as String,
        oldPassword: map['oldPassword'] as String,
        inboxSize: map['inboxSize'] as int,
        allowGuestSender: map['allowGuestSender'] as bool,
        allowUnknownSender: map['allowUnknownSender'] as bool,
        storeMessageContent: map['storeMessageContent'] as bool,
        encryptMessageContent: map['encryptMessageContent'] as bool,
      );

  /// The user full name.
  final String? fullName;

  /// The user address.
  final String? address;

  /// The user city name.
  final String? city;

  /// The user e-mail address.
  final String? email;

  /// The user phone number.
  final String? phoneNumber;

  /// The user photo URI.
  final Uri? photoUri;

  /// The user cellphone number.
  final String? cellPhoneNumber;

  /// The user gender (male/female).
  final Gender? gender;

  /// The description of a contact group.
  final String? group;

  /// The tax document number.
  final String? taxDocument;

  /// The user timezone relative to GMT.
  final int? timezone;

  /// The user culture info, in the IETF language tag format.
  final String? culture;

  /// A generic JSON property to store any key/value strings.
  final Map<String, String>? extras;

  /// Indicates that the account is temporary is valid only in the current
  /// session. The default value is false.
  final bool? isTemporary;

  /// Base64 representation of the account password.
  /// Only valid on set commands during the account creation or update.
  final String? password;

  /// Base64 representation of the account password.
  /// Only valid on set commands during the account password update.
  final String? oldPassword;

  /// Size of account inbox for storing offline messages.
  /// The default value is 0.
  final int? inboxSize;

  /// Indicates if this account allows receive messages from users with guest
  /// sessions.
  final bool? allowGuestSender;

  /// Indicates if this account allows receive messages from users that are not
  /// in the account contact list.
  final bool? allowUnknownSender;

  /// Indicates if the content of messages from this account should be stored
  /// in the server. Note that for offline messages, this will always happens.
  final bool? storeMessageContent;

  /// Indicates if the content of messages from this account should be
  /// encrypted in the server.
  final bool? encryptMessageContent;

  /// Return a Map representing the object.
  Map<String, dynamic> toMap() => {
        'fullName': fullName,
        'address': address,
        'city': city,
        'email': email,
        'phoneNumber': phoneNumber,
        'photoUri': photoUri?.toString(),
        'cellPhoneNumber': cellPhoneNumber,
        'gender': gender?.index,
        'group': group,
        'taxDocument': taxDocument,
        'timezone': timezone,
        'culture': culture,
        'extras': extras,
        'isTemporary': isTemporary,
        'password': password,
        'oldPassword': oldPassword,
        'inboxSize': inboxSize,
        'allowGuestSender': allowGuestSender,
        'allowUnknownSender': allowUnknownSender,
        'storeMessageContent': storeMessageContent,
        'encryptMessageContent': encryptMessageContent,
      };

  /// Create a copy of the object changing some preoperties.
  Account copyWith({
    String? fullName,
    String? address,
    String? city,
    String? email,
    String? phoneNumber,
    Uri? photoUri,
    String? cellPhoneNumber,
    Gender? gender,
    String? group,
    String? taxDocument,
    int? timezone,
    String? culture,
    Map<String, String>? extras,
    bool? isTemporary,
    String? password,
    String? oldPassword,
    int? inboxSize,
    bool? allowGuestSender,
    bool? allowUnknownSender,
    bool? storeMessageContent,
    bool? encryptMessageContent,
  }) =>
      Account(
        fullName: fullName ?? this.fullName,
        address: address ?? this.address,
        city: city ?? this.city,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        photoUri: photoUri ?? this.photoUri,
        cellPhoneNumber: cellPhoneNumber ?? this.cellPhoneNumber,
        gender: gender ?? this.gender,
        group: group ?? this.group,
        taxDocument: taxDocument ?? this.taxDocument,
        timezone: timezone ?? this.timezone,
        culture: culture ?? this.culture,
        extras: extras ?? this.extras,
        isTemporary: isTemporary ?? this.isTemporary,
        password: password ?? this.password,
        oldPassword: oldPassword ?? this.oldPassword,
        inboxSize: inboxSize ?? this.inboxSize,
        allowGuestSender: allowGuestSender ?? this.allowGuestSender,
        allowUnknownSender: allowUnknownSender ?? this.allowUnknownSender,
        storeMessageContent: storeMessageContent ?? this.storeMessageContent,
        encryptMessageContent:
            encryptMessageContent ?? this.encryptMessageContent,
      );

  @override
  List<Object?> get props => [
        fullName,
        address,
        city,
        email,
        phoneNumber,
        photoUri,
        cellPhoneNumber,
        gender,
        group,
        taxDocument,
        timezone,
        culture,
        extras,
        isTemporary,
        password,
        oldPassword,
        inboxSize,
        allowGuestSender,
        allowUnknownSender,
        storeMessageContent,
        encryptMessageContent,
      ];

  @override
  bool get stringify => true;
}
