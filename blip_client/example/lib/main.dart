import 'dart:math' show Random;

import 'package:blip_client/blip_client.dart';
import 'package:flutter/material.dart';

/// API key to use the Blip.
const String apiKey =
    'dGVzdGVtYXRldXM4OmNlMTc2MDE1LWQxMWUtNGVlZS04OTA0LTQ2ZDJmMmViMDg0Mg==';
const String appBarBackgroundColor = '#3333CCFF';
const String appBarForegroundColor = '#FFFFFFFF';

void main() {
  runApp(MyApp());
}

///
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late BlipClient blipClient;

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          backgroundColor: const Color(0xFFF9F9FA),
          appBar: AppBar(
            backgroundColor: const Color(0xFF3333CC),
            title: const Text('Blip Client Flutter'),
          ),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextButton(
                  onPressed: _openAnonymousUser,
                  child: const Text('Open chat as anonymous user'),
                ),
                const SizedBox(height: 16.0),
                TextButton(
                  onPressed: _openAuthenticatedUser,
                  child: const Text('Open chat as authenticated user'),
                ),
              ],
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
      );

  void _openAnonymousUser() {
    final screen = _randonScreen();

    const authConfig = AuthConfig(
      authType: AuthType.guest,
    );

    var account = const Account();
    account = account.copyWith(group: 'Grupo 02');
    account = account.copyWith(
      extras: {
        'firstName': 'John',
      },
    );
    account = account.copyWith(storeMessageContent: true);
    account = account.copyWith(encryptMessageContent: true);

    final options = Options(
      authConfig: authConfig,
      account: account,
      customCommonUrl: 'https://chat.blip.ai/',
      windowTitle: 'Blip Flutter Client - Anonymous',
      sendMessage: true,
      initialMessage: 'Preciso de ajuda (convidado)',
      sendHiddenMessage: true,
      hiddenMessage: 'Mensagem oculta',
      sendChatState: true,
      chatState: 'start',
      customMessageMetadata: {
        'screen': screen,
        '#message.replaceVariables': 'true',
      },
      appBarBackgroundColor: appBarBackgroundColor,
      appBarForegroundColor: appBarForegroundColor,
    );

    blipClient = BlipClient(
      apiKey: apiKey,
      options: options,
    );

    blipClient.openBlipChat();
  }

  void _openAuthenticatedUser() {
    final screen = _randonScreen();

    const authConfig = AuthConfig(
      authType: AuthType.dev,
      userIdentity: '0946e2b0-7b11-404d-a7da-ad377aa05601',
      userPassword: '03D1F2E5432A6E9D4E7A19E20960117F80E8B603CCA1719544FB048594'
          'C3905F',
    );

    var account = const Account();
    account = account.copyWith(
      fullName: 'John Doe',
    );
    account = account.copyWith(
      address: 'Av. Raja Gabaglia, 1143, 15º andar, '
          'Luxemburgo, MG, CEP 30380-403',
    );
    account = account.copyWith(city: 'Belo Horizonte');
    account = account.copyWith(email: 'john.doe@email.com');
    account = account.copyWith(phoneNumber: '0800 545 5252');
    account = account.copyWith(
      photoUri: Uri.parse(
        'https://blubybs2.com/wp-content/uploads/2019/12/logo-blu-150x150.png',
      ),
    );
    account = account.copyWith(cellPhoneNumber: '+55 (31) 9 1234-5678');
    account = account.copyWith(gender: Gender.male);
    account = account.copyWith(group: 'Grupo 01');
    account = account.copyWith(taxDocument: '335.323.830-12');
    account = account.copyWith(timezone: -3);
    account = account.copyWith(culture: 'pt-BR');
    account = account.copyWith(
      extras: {
        'firstName': 'John',
      },
    );
    account = account.copyWith(isTemporary: false);
    account = account.copyWith(inboxSize: 0);
    account = account.copyWith(allowGuestSender: false);
    account = account.copyWith(allowUnknownSender: false);
    account = account.copyWith(storeMessageContent: true);
    account = account.copyWith(encryptMessageContent: true);

    final options = Options(
      authConfig: authConfig,
      account: account,
      customCommonUrl: 'https://chat.blip.ai/',
      windowTitle: 'Blip Flutter Client - Authenticated',
      sendMessage: false,
      initialMessage: 'Preciso de ajuda (autenticado)',
      sendHiddenMessage: false,
      sendChatState: false,
      customMessageMetadata: {
        'screen': screen,
        'email': 'john.fucking.doe@email.com',
        'cellPhoneNumber': '+55 (31) 9 1234-5679',
        'hasSubscription': 'true',
        'plan': 'Plano Gratuito',
        'dependents': '2',
        'nickname': 'john.doe',
        'manufacturer': 'google',
        'model': 'Pixel 3',
        'os': 'Android 12 (API 31)',
        'appVersion': '2.0.5',
        'firstName': 'John',
        'group': 'Tutor',
        '#message.replaceVariables': 'true',
      },
      appBarBackgroundColor: appBarBackgroundColor,
      appBarForegroundColor: appBarForegroundColor,
    );

    blipClient = BlipClient(
      apiKey: apiKey,
      options: options,
    );

    blipClient.openBlipChat();
  }

  String _randonScreen() {
    final number = Random().nextInt(100);

    return 'Screen $number'.padLeft(2, '0');
  }
}
