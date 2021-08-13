import 'package:flutter/material.dart';
class SellerHomePage extends StatefulWidget {
  const SellerHomePage({Key? key}) : super(key: key);

  @override
  _SellerHomePageState createState() => _SellerHomePageState();
}

class _SellerHomePageState extends State<SellerHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
          child: Container(
            child: Text("seller homepage"),
          ),
        ));
  }
}
