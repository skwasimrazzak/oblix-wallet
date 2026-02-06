import 'package:flutter/material.dart';
import 'package:oblix_wallet/login_screen.dart';
import 'package:oblix_wallet/wallet_provider.dart';
import 'package:oblix_wallet/welcome_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  WalletProvider walletProvider = WalletProvider();
  await walletProvider.loadPrivateKey();
  // runApp(OblixWallet());
  runApp(
    ChangeNotifierProvider<WalletProvider>.value(
      value: walletProvider,
      child: OblixWallet(),
    ),
  );
}

class OblixWallet extends StatelessWidget {
  const OblixWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginScreen.id,
      routes: {LoginScreen.id: (context) => LoginScreen()},
      debugShowCheckedModeBanner: false,
    );
  }
}
