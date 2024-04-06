import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/community_message_send_button.dart';
import 'package:smart_personal_coach/components/community_message_stream.dart';
import 'package:smart_personal_coach/constants.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  // Creating an instances of FirebaseAuth and FirebaseFirestore
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  // Creating an user variable to store logged in user
  late User loggedInUser;

  // Community message
  late String? communityMessageText;

  // Text controller for community message text field
  final _communityMessageTextController = TextEditingController();

  // Community message send button able or disable
  bool isButtonDisabled = true;

  // Community messages stream
  final Stream<QuerySnapshot> _communityMessageStream = FirebaseFirestore
      .instance
      .collection("community_messages")
      .orderBy("time")
      .snapshots();

  /// Creating a method to get the logged in user
  void getLoggedIntUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      // Show snack bar with error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error has occurred!')),
      );
    }
  }

  @override
  void initState() {
    getLoggedIntUser();
    super.initState();
  }

  @override
  void dispose() {
    _communityMessageTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'COMMUNITY',
          style: kAppBarTextStyle,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: kPadding16,
          right: kPadding16,
          bottom: kPadding16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// Community messages
            CommunityMessageStream(
                communityMessageStream: _communityMessageStream,
                loggedInUser: loggedInUser.email),

            /// Add space between community messages and send button
            const SizedBox(height: 8.0),

            /// Send a community message
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _communityMessageTextController,
                    decoration: kCommunityMessageTextFormFieldDecoration,
                    onChanged: (value) {
                      communityMessageText = value;
                      setState(() {
                        _communityMessageTextController.text.isEmpty
                            ? isButtonDisabled = true
                            : isButtonDisabled = false;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 4.0,
                ),
                CommunityMessageSendButton(
                  onPressed: isButtonDisabled
                      ? null
                      : () {
                          final messagesRef =
                              _firestore.collection("community_messages");
                          messagesRef.add({
                            "sender": loggedInUser.email,
                            "community_message": communityMessageText,
                            "time": FieldValue.serverTimestamp(),
                          });
                          _communityMessageTextController.clear();
                          setState(() {
                            isButtonDisabled = true;
                          });
                        },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
