import 'package:flutter/material.dart';

class AdnaLogoScreen extends StatefulWidget {
  const AdnaLogoScreen({super.key});

  @override
  State<AdnaLogoScreen> createState() => _AdnaLogoScreenState();
}

class _AdnaLogoScreenState extends State<AdnaLogoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("images/adna-opening-animation.gif"),
      ),
    );
  }
}
