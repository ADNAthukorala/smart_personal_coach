import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  // Creating the stream
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  /// Update username
  Future<void> updateUserName(String userName) async {
    try {
      // Get a reference to the document
      DocumentReference documentRef = FirebaseFirestore.instance
          .collection('users')
          .doc(loggedInUser.email);

      // Update the user name field
      await documentRef.update({
        'user_name': userName,
      });

      print('Document updated successfully.');
    } catch (e) {
      print('Error updating document: $e');
    }
  }

  /// Update gender
  Future<void> updateGender(String updatedGender) async {
    try {
      // Get a reference to the document
      DocumentReference documentRef = FirebaseFirestore.instance
          .collection('users')
          .doc(loggedInUser.email);

      // Update the user name field
      await documentRef.update({
        'gender': updatedGender,
      });

      print('Document updated successfully.');
    } catch (e) {
      print('Error updating document: $e');
    }
  }

  /// Update height
  Future<void> updateHeight(int height) async {
    try {
      // Get a reference to the document
      DocumentReference documentRef = FirebaseFirestore.instance
          .collection('users')
          .doc(loggedInUser.email);

      // Update the user name field
      await documentRef.update({
        'height': height,
      });

      print('Document updated successfully.');
    } catch (e) {
      print('Error updating document: $e');
    }
  }

  /// Update height
  Future<void> updateWeight(int weight) async {
    try {
      // Get a reference to the document
      DocumentReference documentRef = FirebaseFirestore.instance
          .collection('users')
          .doc(loggedInUser.email);

      // Update the user name field
      await documentRef.update({
        'weight': weight,
      });

      print('Document updated successfully.');
    } catch (e) {
      print('Error updating document: $e');
    }
  }

  /// Update birth day
  Future<void> updateBirthDay(DateTime userBirthDay) async {
    try {
      // Get a reference to the document
      DocumentReference documentRef = FirebaseFirestore.instance
          .collection('users')
          .doc(loggedInUser.email);

      // Update the user name field
      await documentRef.update({
        'birth_day': userBirthDay,
      });

      print('Document updated successfully.');
    } catch (e) {
      print('Error updating document: $e');
    }
  }

  /// Getting and updating user birthday
  Future<void> _selectUserBirthDay(
      BuildContext context, DateTime userBirthDay) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: userBirthDay,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != userBirthDay) {
      userBirthDay = picked;
      updateBirthDay(userBirthDay);
    }
  }

  @override
  void dispose() {
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

                    // Create text controllers for the user name text field and the height and weight text fields
                    final userNameController = TextEditingController();
                    final userWeightController = TextEditingController();
                    final userHeightController = TextEditingController();
                    userHeightController.text = data['height'].toString();
                    userNameController.text = data['user_name'];
                    userWeightController.text = data['weight'].toString();

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
                              style: IconButton.styleFrom(
                                backgroundColor: kGreyThemeColor02,
                              ),
                              color: kBlueThemeColor,
                              icon: const Icon(Icons.edit),
                              onPressed: () {},
                            ),
                          ),
                        ),

                        /// User name
                        ListTile(
                          contentPadding: EdgeInsets.zero,
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
                                // Changing the username
                                return AlertDialog(
                                  title: const Text("Enter your username"),
                                  content: TextField(
                                    controller: userNameController,
                                    decoration: const InputDecoration(
                                        hintText: "Enter your username"),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Cancel")),
                                    ElevatedButton(
                                        onPressed: () {
                                          updateUserName(userNameController.text
                                                  .trim()
                                                  .isNotEmpty
                                              ? userNameController.text.trim()
                                              : data['user_name']);
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Save")),
                                  ],
                                );
                              },
                            );
                          },
                        ),

                        /// Divider
                        const Divider(height: 0.0),

                        /// Email
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(Icons.email),
                          title: const Text("Email"),
                          subtitle: Text(data['email']),
                          subtitleTextStyle:
                              const TextStyle(color: kGreyThemeColor),
                        ),

                        /// Gender
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(data['gender'] == "Male"
                              ? Icons.male
                              : Icons.female),
                          title: const Text("Gender"),
                          subtitle: Text(data['gender']),
                          subtitleTextStyle:
                              const TextStyle(color: kGreyThemeColor),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                // Changing the gender
                                return AlertDialog(
                                  title: const Text("Select your gender"),
                                  actions: [
                                    // Male button
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        updateGender("Male");
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              data['gender'] == "Male"
                                                  ? kBlueThemeColor
                                                  : kWhiteThemeColor),
                                      child: Text(
                                        "Male",
                                        style: TextStyle(
                                            color: data['gender'] == "Male"
                                                ? kWhiteThemeColor
                                                : kBlueThemeColor),
                                      ),
                                    ),
                                    // Female button
                                    ElevatedButton(
                                      onPressed: () {
                                        updateGender("Female");
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              data['gender'] == "Female"
                                                  ? kPinkThemeColor
                                                  : kWhiteThemeColor),
                                      child: Text(
                                        "Female",
                                        style: TextStyle(
                                            color: data['gender'] == "Female"
                                                ? kWhiteThemeColor
                                                : kPinkThemeColor),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),

                        /// Birth day
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(Icons.calendar_month),
                          title: const Text("Birth Day"),
                          subtitle:
                              Text("${userBirthDay.toDate()}".split(' ')[0]),
                          subtitleTextStyle:
                              const TextStyle(color: kGreyThemeColor),
                          onTap: () {
                            _selectUserBirthDay(context, userBirthDay.toDate());
                          },
                        ),

                        /// Height
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(Icons.height),
                          title: const Text("Height"),
                          subtitle: Text("${data['height'].toString()} cm"),
                          subtitleTextStyle:
                              const TextStyle(color: kGreyThemeColor),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                // Changing the username
                                return AlertDialog(
                                  title: const Text("Enter your height"),
                                  content: TextFormField(
                                    controller: userHeightController,
                                    decoration: const InputDecoration(
                                      hintText: "Enter your height",
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Cancel")),
                                    ElevatedButton(
                                        onPressed: () {
                                          updateHeight(userHeightController.text
                                                  .trim()
                                                  .isNotEmpty
                                              ? int.parse(userHeightController
                                                  .text
                                                  .trim())
                                              : data['height']);
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Save")),
                                  ],
                                );
                              },
                            );
                          },
                        ),

                        /// Weight
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(Icons.balance),
                          title: const Text("Weight"),
                          subtitle: Text("${data['weight'].toString()} kg"),
                          subtitleTextStyle:
                              const TextStyle(color: kGreyThemeColor),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                // Changing the username
                                return AlertDialog(
                                  title: const Text("Enter your weight"),
                                  content: TextFormField(
                                    controller: userWeightController,
                                    decoration: const InputDecoration(
                                      hintText: "Enter your weight",
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Cancel")),
                                    ElevatedButton(
                                        onPressed: () {
                                          updateWeight(userWeightController.text
                                                  .trim()
                                                  .isNotEmpty
                                              ? int.parse(userWeightController
                                                  .text
                                                  .trim())
                                              : data['weight']);
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Save")),
                                  ],
                                );
                              },
                            );
                          },
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
