import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_personal_coach/constants.dart';
import 'package:smart_personal_coach/screens/signin_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Creating an instance of FirebaseAuth
  final _auth = FirebaseAuth.instance;

  // Creating an user variable to store logged in user
  late User loggedInUser;

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

  /// Sign out method
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    if (!mounted) return;
    // Show snack bar with 'Signed out' message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Signed out!')),
    );
  }

  void _showSignOutDialog() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Are you sure?',
          ),
          content: const Text(
            'Are you sure you want to sign out?',
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text(
                'No',
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: const Text(
                'Yes',
              ),
              onPressed: () {
                _signOut();
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  // Create a text controller for the user name text field
  final _userNameController = TextEditingController();

  /// Update user name
  Future<void> updateUserName() async {
    try {
      // Get a reference to the document
      DocumentReference documentRef = FirebaseFirestore.instance
          .collection('users')
          .doc(loggedInUser.email);

      // Update the user name field
      await documentRef.update({
        'user_name': _userNameController.text.isNotEmpty
            ? _userNameController.text.trim()
            : "user",
      });

      print('Document updated successfully.');
    } catch (e) {
      print('Error updating document: $e');
    }
  }

  @override
  void dispose() {
    _userNameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    getLoggedIntUser();
    super.initState();
  }

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
              primary: false,
              children: snapshot.data!.docs
                  .map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;

                    // Declaring a variable to store the user's birth day
                    Timestamp userBirthDay = data['birth_day'];

                    return Column(
                      children: [
                        /// Profile picture
                        CircleAvatar(
                          backgroundImage: const AssetImage(
                              "images/welcome_screen_image.jpg"),
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
                        ListTile(
                          title: Container(
                            alignment: Alignment.center,
                            child: Text(
                              data['user_name'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0,
                              ),
                            ),
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                // Changing the user name
                                return AlertDialog(
                                  title: const Text("Change username?"),
                                  content: TextField(
                                    controller: _userNameController,
                                    decoration: const InputDecoration(
                                        hintText: "Enter a new username"),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Cancel")),
                                    ElevatedButton(
                                        onPressed: () {
                                          updateUserName();
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Change")),
                                  ],
                                );
                              },
                            );
                          },
                        ),

                        /// Email
                        ListTile(
                          title: const Text("Email"),
                          subtitle: Text(data['email']),
                        ),

                        /// Gender
                        ListTile(
                          title: const Text("Gender"),
                          subtitle: Text(data['gender']),
                        ),

                        /// Birth day
                        ListTile(
                          title: const Text("Birth Day"),
                          subtitle:
                              Text("${userBirthDay.toDate()}".split(' ')[0]),
                        ),

                        /// Height
                        ListTile(
                          title: const Text("Height"),
                          subtitle: Text("${data['height'].toString()} cm"),
                        ),

                        /// Weight
                        ListTile(
                          title: const Text("Weight"),
                          subtitle: Text("${data['weight'].toString()} kg"),
                        ),

                        /// Sign out button
                        ElevatedButton.icon(
                          onPressed: () {
                            _showSignOutDialog();
                          },
                          label: const Text("Sign out"),
                          icon: const Icon(
                            FontAwesomeIcons.arrowRightFromBracket,
                            size: 20.0,
                          ),
                        ),
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
