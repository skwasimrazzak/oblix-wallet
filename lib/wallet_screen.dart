import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wallet')),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Wallet Address',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                Text(
                  'walletAddress', //variable
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                Text(
                  'Balance',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                Text(
                  'balance', //variable
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  FloatingActionButton(
                    heroTag: 'sendButton',
                    onPressed: () {
                      //Action: Push to send token page
                    },
                    child: Icon(Icons.send),
                  ),
                  SizedBox(height: 8.0),
                  Text('Send'),
                ],
              ),
              Column(
                children: [
                  FloatingActionButton(
                    heroTag: 'refreshButton',
                    onPressed: () {
                      //Refresh the page
                    },
                    child: Icon(Icons.replay_outlined),
                  ),
                  SizedBox(height: 8.0),
                  Text('Refresh'),
                ],
              ),
            ],
          ),
          SizedBox(height: 30.0),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(text: 'Assets'),
                      Tab(text: 'NFTs'),
                      Tab(text: 'Options'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Column(children: [Card(), Text('')]),
                        SingleChildScrollView(),
                        Center(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
