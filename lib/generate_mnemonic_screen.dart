import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oblix_wallet/wallet_provider.dart';
import 'package:provider/provider.dart';

class GenerateMnemonicScreen extends StatelessWidget {
  const GenerateMnemonicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);
    final mnemonic = walletProvider.generateMnemonic();
    final mnemonicWord = mnemonic.split(' ');
    void copyToClipboard() {
      Clipboard.setData(ClipboardData(text: mnemonic));
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Mnemonic Copied to Clipboard')));
    }

    return Scaffold(
      appBar: AppBar(title: Text('Generate Seed Phrase')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Please Store the following Seed phrase safely:'),
            Column(
              children: List.generate(
                mnemonicWord.length,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    '${index + 1}. ${mnemonicWord[index]}',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                copyToClipboard();
              },
              child: Text('Copy to Clipboard'),
            ),
          ],
        ),
      ),
    );
  }
}
