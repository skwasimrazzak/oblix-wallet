import 'package:flutter/material.dart';
import 'package:oblix_wallet/wallet_provider.dart';
import 'package:oblix_wallet/welcome_screen.dart';
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
    return MaterialApp(
      title: 'Oblix Wallet',
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
