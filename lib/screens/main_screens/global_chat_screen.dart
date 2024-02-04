import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';

class GlobalChatScreen extends StatefulWidget {
  const GlobalChatScreen({super.key});

  @override
  State<GlobalChatScreen> createState() => _GlobalChatScreenState();
}

class _GlobalChatScreenState extends State<GlobalChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GLOBAL CHAT',
          style: kAppBarTextStyle,
        ),
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text('Global Chat'),
      ),
    );
  }
}
