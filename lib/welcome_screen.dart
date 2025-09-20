import 'package:flutter/material.dart';
import 'package:oblix_wallet/wallet_provider.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Oblix Wallet'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final mnemonic = walletProvider.generateMnemonic();
                final privateKey = await walletProvider.getPrivateKey(mnemonic);
                final publicKey = await walletProvider.getPublicKey(privateKey);

                print('Mnemonic: $mnemonic');
                print('Private Key: $privateKey');
                print('Public Key: $publicKey');
              },
              child: Text('Create Wallet'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                //Action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
              child: Text('Import from Seed'),
            ),
          ],
        ),
      ),
    );
  }
}
