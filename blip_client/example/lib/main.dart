import 'package:blip_client/blip_client.dart';
import 'package:flutter/material.dart';

/// API key to use the Blip.
const String apiKey = 'MyBlipKey=';

void main() {
  runApp(MyApp());
}

///
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  BlipClient blipClient;

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          backgroundColor: Color(0xFFF9F9FA),
          appBar: AppBar(
            backgroundColor: Color(0xFF3333CC),
            title: Text('Blip Client Flutter'),
          ),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FlatButton(
                  child: Text('Open chat as anonymous user'),
                  onPressed: _openAnonymousUser,
                ),
                SizedBox(height: 16.0),
                FlatButton(
                  child: Text('Open chat as authenticated user'),
                  onPressed: _openAuthenticatedUser,
                ),
              ],
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
      );

  void _openAnonymousUser() {
    final authConfig = AuthConfig(
      authType: AuthType.guest,
    );

    var account = Account();
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
      appBarBackgroundColor: '#3333CCFF',
      appBarForegroundColor: '#FFFFFFFF',
    );

    blipClient = BlipClient(
      apiKey: apiKey,
      options: options,
    );

    blipClient.openBlipChat();
  }

  void _openAuthenticatedUser() {
    final authConfig = AuthConfig(
      authType: AuthType.dev,
      userIdentity: '9dd03fe2-35d8-4f6f-8139-a03b4317c1f9',
      userPassword: 'b95acc5d1d037edb68d96a7bfe825cad',
    );

    var account = Account();
    account = account.copyWith(
      fullName: 'Blu by BS2',
    );
    account = account.copyWith(
      address: 'Av. Raja Gabaglia, 1143, 15˚ andar, '
          'bairro Luxemburgo, MG – CEP 30380-403',
    );
    account = account.copyWith(city: 'Belo Horizonte');
    account = account.copyWith(email: 'meajuda@blubybs2.com.com');
    account = account.copyWith(phoneNumber: '0800 545 5252');
    account = account.copyWith(
      photoUri: Uri.parse(
        'https://blubybs2.com/wp-content/uploads/2019/12/logo-blu-150x150.png',
      ),
    );
    account = account.copyWith(cellPhoneNumber: '+55 (31) 9 9630-0244');
    account = account.copyWith(gender: Gender.male);
    account = account.copyWith(timezone: -3);
    account = account.copyWith(culture: 'pt_BR');
    account = account.copyWith(
      extras: {
        'screen': 'signUp',
      },
    );
    account = account.copyWith(isTemporary: false);
    account = account.copyWith(password: '6d071901727aec1ba6d8e2497ef5b709');
    account = account.copyWith(oldPassword: '4297f44b13955235245b2497399d7a93');
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
      appBarBackgroundColor: '#3333CCFF',
      appBarForegroundColor: '#FFFFFFFF',
    );

    blipClient = BlipClient(
      apiKey: apiKey,
      options: options,
    );

    blipClient.openBlipChat();
  }
}
