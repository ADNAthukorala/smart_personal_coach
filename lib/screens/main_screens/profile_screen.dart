import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_personal_coach/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Creating an instances of FirebaseAuth and FirebaseFirestore
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar
      appBar: AppBar(
        title: const Text(
          'PROFILE',
          style: kAppBarTextStyle,
        ),
        automaticallyImplyLeading: false,
      ),

      /// Body of the screen
      body: Padding(
        padding: const EdgeInsets.all(kPadding16),
        child: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }

            return ListView(
              children: snapshot.data!.docs
                  .map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return Column(
                      children: [
                        /// Profile picture
                        CircleAvatar(
                          backgroundImage:
                              AssetImage("images/welcome_screen_image.jpg"),
                          radius: 60.0,
                          // Edit profile picture button
                          child: Container(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              color: kWhiteThemeColor,
                              iconSize: 20.0,
                              icon: const Icon(FontAwesomeIcons.pen),
                              onPressed: () {},
                            ),
                          ),
                        ),

                        /// User name
                        Text(data['user_name']),
                      ],
                    );
                  })
                  .toList()
                  .cast(),
            );
          },
        ),
      ),
    );
  }
}
