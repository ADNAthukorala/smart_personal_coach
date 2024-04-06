import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_personal_coach/components/community_message_bubble.dart';
import 'package:smart_personal_coach/constants.dart';

class CommunityMessageStream extends StatelessWidget {
  const CommunityMessageStream(
      {super.key,
      required this.communityMessageStream,
      required this.loggedInUser});

  final Stream<QuerySnapshot> communityMessageStream;
  final String? loggedInUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: communityMessageStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong"));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Text("Loading community..."));
        }

        if (!snapshot.hasData) {
          return const Center(child: Text("No data available"));
        }

        // Getting all the community messages
        final communityMessages = snapshot.data!.docs.reversed;

        // Create a list of community messages
        List<CommunityMessageBubble> communityMessageBubbles = [];

        // Populate community messages list with community messages
        for (var communityMessage in communityMessages) {
          final messageSender = communityMessage.get("sender");
          final communityMessageText =
              communityMessage.get("community_message");

          final communityMessageBubble = CommunityMessageBubble(
            sender: messageSender,
            message: communityMessageText,
            isMe: messageSender == loggedInUser,
          );

          // Add community message bubble to the community messages list
          communityMessageBubbles.add(communityMessageBubble);
        }
        return Expanded(
          child: ListView(
            primary: false,
            reverse: true,
            padding: const EdgeInsets.symmetric(
              vertical: kPadding16,
              horizontal: kPadding8,
            ),
            children: communityMessageBubbles,
          ),
        );
      },
    );
  }
}
