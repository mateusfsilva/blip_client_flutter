import 'package:blip_client/blip_client.dart';
import 'package:flutter/material.dart';

/// API key to use the Blip.
const String apiKey =
    'Ymx1MToyYzUwNGQ3YS0xMDRmLTRiYTAtYjM0Yi05ODZmNGZlNjNhMGU=';
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
    const authConfig = AuthConfig(
      authType: AuthType.guest,
    );

    var account = const Account();
    account = account.copyWith(encryptMessageContent: true);
    account = account.copyWith(
      extras: {
        'screen': 'signUp',
      },
    );

    final options = Options(
      authConfig: authConfig,
      account: account,
      customCommonUrl: 'https://chat.blip.ai/',
      windowTitle: 'Blip Flutter Client - Anonymous',
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
    const authConfig = AuthConfig(
      authType: AuthType.dev,
      userIdentity: 'deab09a4-d414-48be-952c-51732a4f2ad1',
      userPassword: '6D071901727AEC1BA6D8E2497EF5B709',
    );

    var account = const Account();
    account = account.copyWith(
      fullName: 'Blu by BS2',
    );
    account = account.copyWith(
      address: 'Av. Raja Gabaglia, 1143, 15˚ andar, '
          'bairro Luxemburgo, MG – CEP 30380-403',
    );
    account = account.copyWith(city: 'Belo Horizonte');
    account = account.copyWith(email: 'user@blubybs2.com');
    account = account.copyWith(phoneNumber: '0800 545 5252');
    account = account.copyWith(
      photoUri: Uri.parse(
        'https://blubybs2.com/wp-content/uploads/2019/12/logo-blu-150x150.png',
      ),
    );
    account = account.copyWith(cellPhoneNumber: '+55 (31) 9 1234-5678');
    account = account.copyWith(gender: Gender.male);
    account = account.copyWith(timezone: -3);
    account = account.copyWith(culture: 'pt_BR');
    account = account.copyWith(
      extras: {
        'screen': 'signUp',
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
      appBarBackgroundColor: appBarBackgroundColor,
      appBarForegroundColor: appBarForegroundColor,
    );

    blipClient = BlipClient(
      apiKey: apiKey,
      options: options,
    );

    blipClient.openBlipChat();
  }
}
