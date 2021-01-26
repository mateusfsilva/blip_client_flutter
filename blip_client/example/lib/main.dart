import 'package:blip_client/blip_client.dart';
import 'package:flutter/material.dart';

/// API key to use the Blip.
const String apiKey =
    'Ymx1MToyYzUwNGQ3YS0xMDRmLTRiYTAtYjM0Yi05ODZmNGZlNjNhMGU=';

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
        home: SafeArea(
          child: Scaffold(
            backgroundColor: Color(0xFFF9F9FA),
            appBar: AppBar(
              title: Text('Blip Client Flutter'),
            ),
            body: Column(
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
      windowTitle: 'Blip Flutter Client - Help',
    );

    blipClient = BlipClient(
      apiKey: apiKey,
      options: options,
    );

    blipClient.openBlipChat();
  }

  void _openAuthenticatedUser() {
    //
  }
}
