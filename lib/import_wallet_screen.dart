import 'package:flutter/material.dart';
import 'package:oblix_wallet/wallet_provider.dart';
import 'package:oblix_wallet/wallet_screen.dart';
import 'package:provider/provider.dart';

class ImportWalletScreen extends StatefulWidget {
  const ImportWalletScreen({super.key});

  @override
  State<ImportWalletScreen> createState() => _ImportWalletScreenState();
}

class _ImportWalletScreenState extends State<ImportWalletScreen> {
  String seedPhrase = '';
  void navigateToWallet() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WalletScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    void generatePrivateKey() async {
      WalletProvider walletProvider = context.read<WalletProvider>();
      await walletProvider.getPrivateKey(seedPhrase);

      navigateToWallet();
    }

    return Scaffold(
      appBar: AppBar(title: Text('Import Wallet From Seed')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  seedPhrase = value;
                });
              },
              decoration: InputDecoration(labelText: 'Enter Mnemonic Phrase'),
            ),
            SizedBox(height: 100.0),
            ElevatedButton(
              onPressed: generatePrivateKey,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
              child: Text('Import'),
            ),
          ],
        ),
      ),
    );
  }
}
