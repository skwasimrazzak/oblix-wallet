import 'package:flutter/material.dart';
import 'package:oblix_wallet/wallet_provider.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(OblixWallet());
  runApp(
    ChangeNotifierProvider<WalletProvider>(
      create: (context) => WalletProvider(),
      child: OblixWallet(),
    ),
  );
}

class OblixWallet extends StatelessWidget {
  const OblixWallet({super.key});

  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);
    return MaterialApp(
      title: 'Oblix Wallet',
      home: Scaffold(
        appBar: AppBar(title: Text('Oblix Wallet'), centerTitle: true),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final mnemonic = walletProvider.generateMnemonic();
                  final privateKey = await walletProvider.getPrivateKey(
                    mnemonic,
                  );
                  final publicKey = await walletProvider.getPublicKey(
                    privateKey,
                  );

                  print('Mnemonic: $mnemonic');
                  print('Private Key: $privateKey');
                  print('Public Key: $publicKey');
                },
                child: Text('Generate Wallet'),
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
