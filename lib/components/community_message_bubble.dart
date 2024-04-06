import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';

class CommunityMessageBubble extends StatelessWidget {
  const CommunityMessageBubble(
      {super.key,
      required this.sender,
      required this.message,
      required this.isMe});

  final String sender;
  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kPadding8),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          /// Show sender's email address
          Text(
            isMe ? "You" : sender,
            style: kSmallGreyColorDescriptionTextStyle,
          ),

          /// The message
          Material(
            elevation: 5.0,
            color: isMe ? kAppThemeColor : kWhiteThemeColor,
            borderRadius: isMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(kRadius16),
                    bottomLeft: Radius.circular(kRadius16),
                    bottomRight: Radius.circular(kRadius16))
                : const BorderRadius.only(
                    topRight: Radius.circular(kRadius16),
                    bottomLeft: Radius.circular(kRadius16),
                    bottomRight: Radius.circular(kRadius16)),
            child: Padding(
              padding: const EdgeInsets.all(kPadding8),
              child: Text(
                message,
                style: isMe
                    ? const TextStyle(
                        color: kWhiteThemeColor,
                      )
                    : const TextStyle(color: kBlackThemeColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
