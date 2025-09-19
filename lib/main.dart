import 'package:flutter/material.dart';

void main() {
  runApp(OblixWallet());
}

class OblixWallet extends StatelessWidget {
  const OblixWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oblix Wallet',
      home: Scaffold(
        appBar: AppBar(title: Text('Oblix Wallet'), centerTitle: true),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  //Action
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
