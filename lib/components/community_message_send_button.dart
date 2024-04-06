import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';

class CommunityMessageSendButton extends StatelessWidget {
  const CommunityMessageSendButton({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: kAppThemeColor,
      ),
      child: const Icon(Icons.send_rounded),
    );
  }
}
