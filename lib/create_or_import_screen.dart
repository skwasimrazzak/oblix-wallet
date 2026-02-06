import 'package:flutter/material.dart';
import 'package:oblix_wallet/generate_mnemonic_screen.dart';
import 'package:oblix_wallet/import_wallet_screen.dart';

class CreateOrImportScreen extends StatelessWidget {
  const CreateOrImportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Oblix Wallet'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GenerateMnemonicScreen(),
                  ),
                );
              },
              child: Text('Create Wallet'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImportWalletScreen()),
                );
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
