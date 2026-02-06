import 'package:flutter/material.dart';
import 'package:oblix_wallet/create_or_import_screen.dart';
import 'package:oblix_wallet/wallet_provider.dart';
import 'package:oblix_wallet/wallet_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  static const id = 'login_screen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final walletProvider = context.watch<WalletProvider>();
    if (walletProvider.privateKey == null) {
      return const CreateOrImportScreen();
    } else {
      return WalletScreen();
    }
  }
}
