import 'package:flutter/material.dart';

class VerifyMnemonicScreen extends StatefulWidget {
  const VerifyMnemonicScreen({super.key});

  @override
  State<VerifyMnemonicScreen> createState() => _VerifyMnemonicScreenState();
}

class _VerifyMnemonicScreenState extends State<VerifyMnemonicScreen> {
  @override
  Widget build(BuildContext context) {
    String verificationText = '';
    void verifyMnemonics() {
      //Action
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
                verifyMnemonics();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
              child: Text('Verify'),
            ),
            SizedBox(height: 25.0),
            ElevatedButton(
              onPressed: () {
                //Action: Next
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
