import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wallet')),
      body: Column(
        children: [
          Container(),
          Row(),
          Column(),
          SizedBox(),
          Expanded(child: DefaultTabController(length: 3, child: Column())),
        ],
      ),
    );
  }
}
