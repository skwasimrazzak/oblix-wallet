import 'package:flutter/material.dart';

class NFTListPage extends StatefulWidget {
  const NFTListPage({super.key});

  @override
  State<NFTListPage> createState() => _NFTListPageState();
}

class _NFTListPageState extends State<NFTListPage> {
  List<dynamic> _nftList = [];

  @override
  void initState() {
    super.initState();
    _loadNFTList();
  }

  Future<void> _loadNFTList() async {}
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: []);
  }
}
