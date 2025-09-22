import 'package:flutter/material.dart';
import 'package:oblix_wallet/wallet_provider.dart';
import 'package:oblix_wallet/wallet_screen.dart';
import 'package:provider/provider.dart';

class VerifyMnemonicScreen extends StatefulWidget {
  final String mnemonic;
  const VerifyMnemonicScreen({super.key, required this.mnemonic});

  @override
  State<VerifyMnemonicScreen> createState() => _VerifyMnemonicScreenState();
}

class _VerifyMnemonicScreenState extends State<VerifyMnemonicScreen> {
  bool isVerified = false;
  String verificationText = '';
  void verifyMnemonics() {
    print('lets see');
    final walletProvider = Provider.of<WalletProvider>(context, listen: false);
    print('1.${verificationText}');
    print('2. ${widget.mnemonic.trim()}');
    if (verificationText.trim() == widget.mnemonic.trim()) {
      print('good going');
      walletProvider.getPrivateKey(widget.mnemonic).then((privateKey) {
        setState(() {
          isVerified = true;
        });
      });
      if (isVerified == true) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Verification Complete')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    void navigateToWallet() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WalletScreen()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Verify Mnemonic')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  verificationText = value;
                });
              },
              decoration: InputDecoration(labelText: 'Enter Mnemonic Phrase'),
            ),
            SizedBox(height: 100.0),
            ElevatedButton(
              onPressed: () {
                print(verificationText);
                verifyMnemonics();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
              child: Text('Verify'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                isVerified ? navigateToWallet() : print('nope');
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
