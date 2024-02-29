import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_personal_coach/constants.dart';
import 'package:smart_personal_coach/screens/signin_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
    try {
      await FirebaseAuth.instance.signOut();
      if (!mounted) return;
      // Show snack bar with 'Signed out' message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signed out!')),
      );
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  void _showSignOutDialog() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: kAppThemeColor,
          title: const Text(
            'Are you sure?',
            style: TextStyle(color: kWhiteThemeColor),
          ),
          content: const Text(
            'Are you sure you want to sign out?',
            style: TextStyle(color: kWhiteThemeColor),
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

  /// Update username
  Future<void> updateUserName(String userName) async {
    try {
      // Get a reference to the document
      DocumentReference documentRef = FirebaseFirestore.instance
          .collection('users')
          .doc(loggedInUser.email);

      // Update the user name field
      await documentRef.update({
        'userName': userName,
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

  /// Update weight
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
        'birthDay': userBirthDay,
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

  /// Updating profile picture
  File? _imageFile;
  final picker = ImagePicker();

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      _uploadImage();
    }
  }

  Future<void> _uploadImage() async {
    if (_imageFile == null) return;

    final storage = FirebaseStorage.instance;
    final Reference storageReference = storage
        .ref()
        .child('profile_pictures/${loggedInUser.email}/profile-picture.jpg');
    final UploadTask uploadTask = storageReference.putFile(_imageFile!);
    await uploadTask.whenComplete(() => null);

    final imageUrl = await storageReference.getDownloadURL();
    final userId = loggedInUser.email;

    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'profilePicture': imageUrl,
    });
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
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(loggedInUser.email)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          }

          if (!snapshot.hasData) {
            return const Text('No data available');
          }

          // Access the data from the snapshot
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          // Declaring a variable to store the user's birth day
          Timestamp userBirthDay = data['birthDay'];

          // Create text controllers for the user name text field and the height and weight text fields
          final userNameController = TextEditingController();
          final userWeightController = TextEditingController();
          final userHeightController = TextEditingController();
          userHeightController.text = data['height'].toString();
          userNameController.text = data['userName'];
          userWeightController.text = data['weight'].toString();

          String imageUrl = data['profilePicture'];

          return ListView(
            padding: const EdgeInsets.all(kPadding16),
            primary: false,
            children: [
              /// Profile picture
              Container(
                alignment: Alignment.center,
                // Wrapping the profile picture holder with a gesture detector
                // to tap the profile picture holder
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          content: SizedBox(
                            height: 120.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Updating the profile picture with an image in the gallery
                                ElevatedButton.icon(
                                  onPressed: () async {
                                    final status =
                                        await Permission.storage.request();
                                    if (status.isGranted) {
                                      _getImage(ImageSource.gallery);
                                      if (!context.mounted) return;
                                      Navigator.pop(context);
                                    } else {
                                      if (!context.mounted) return;
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          title:
                                              const Text('Permission Denied'),
                                          content: const Text(
                                              'You have denied access to photos. Please enable photos access in device settings.'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  },
                                  label: const Text("Gallery"),
                                  icon: const Icon(
                                      Icons.add_photo_alternate_rounded),
                                ),
                                // Updating the profile picture with an image captured by the device camera
                                ElevatedButton.icon(
                                  onPressed: () async {
                                    final status =
                                        await Permission.camera.request();
                                    if (status.isGranted) {
                                      _getImage(ImageSource.camera);
                                      if (!context.mounted) return;
                                      Navigator.pop(context);
                                    } else {
                                      if (!context.mounted) return;
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          title:
                                              const Text('Permission Denied'),
                                          content: const Text(
                                              'You have denied access to the camera. Please enable camera access in device settings.'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  },
                                  label: const Text("Camera"),
                                  icon: const Icon(Icons.add_a_photo_rounded),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  // Profile picture holder
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    imageBuilder: (context, imageProvider) => CircleAvatar(
                      backgroundImage: imageProvider,
                    ),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Container(
                      decoration: const BoxDecoration(
                        color: kGreyThemeColor02,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person_rounded,
                        size: 100,
                        color: kAppThemeColor,
                      ),
                    ),
                    width: 200.0,
                    height: 200.0,
                  ),
                ),
              ),

              /// User name
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Container(
                  alignment: Alignment.center,
                  child: Text(
                    data['userName'],
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
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
                                updateUserName(
                                    userNameController.text.trim().isNotEmpty
                                        ? userNameController.text.trim()
                                        : data['userName']);
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
              const Divider(),

              /// Email
              ListTile(
                leading: const Icon(
                  Icons.email_rounded,
                  color: kAppThemeColor,
                ),
                title: const Text("Email"),
                subtitle: Text(data['email']),
                titleTextStyle: const TextStyle(
                  color: kAppThemeColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                subtitleTextStyle: const TextStyle(
                  color: kGreyThemeColor,
                  fontWeight: FontWeight.w500,
                ),
              ),

              /// Gender
              ListTile(
                leading: Icon(
                  data['gender'] == "Male"
                      ? Icons.male_rounded
                      : Icons.female_rounded,
                  color: data['gender'] == "Male"
                      ? kAppThemeColor
                      : kPinkThemeColor,
                ),
                title: const Text("Gender"),
                subtitle: Text(data['gender']),
                titleTextStyle: TextStyle(
                  color: data['gender'] == "Male"
                      ? kAppThemeColor
                      : kPinkThemeColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                subtitleTextStyle: const TextStyle(
                  color: kGreyThemeColor,
                  fontWeight: FontWeight.w500,
                ),
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
                                backgroundColor: data['gender'] == "Male"
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
                                backgroundColor: data['gender'] == "Female"
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
                leading: const Icon(
                  Icons.calendar_month_rounded,
                  color: kAppThemeColor,
                ),
                title: const Text("Birth Day"),
                subtitle: Text("${userBirthDay.toDate()}".split(' ')[0]),
                titleTextStyle: const TextStyle(
                  color: kAppThemeColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                subtitleTextStyle: const TextStyle(
                  color: kGreyThemeColor,
                  fontWeight: FontWeight.w500,
                ),
                onTap: () {
                  _selectUserBirthDay(context, userBirthDay.toDate());
                },
              ),

              /// Height
              ListTile(
                leading: const Icon(
                  Icons.height_rounded,
                  color: kAppThemeColor,
                ),
                title: const Text("Height"),
                subtitle: Text("${data['height'].toString()} cm"),
                titleTextStyle: const TextStyle(
                  color: kAppThemeColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                subtitleTextStyle: const TextStyle(
                  color: kGreyThemeColor,
                  fontWeight: FontWeight.w500,
                ),
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
                                updateHeight(
                                    userHeightController.text.trim().isNotEmpty
                                        ? int.parse(
                                            userHeightController.text.trim())
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
                leading: const Icon(
                  Icons.balance_rounded,
                  color: kAppThemeColor,
                ),
                title: const Text("Weight"),
                subtitle: Text("${data['weight'].toString()} kg"),
                titleTextStyle: const TextStyle(
                  color: kAppThemeColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                subtitleTextStyle: const TextStyle(
                  color: kGreyThemeColor,
                  fontWeight: FontWeight.w500,
                ),
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
                                updateWeight(
                                    userWeightController.text.trim().isNotEmpty
                                        ? int.parse(
                                            userWeightController.text.trim())
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

              /// Main goal
              ListTile(
                leading: const Icon(
                  Icons.arrow_circle_right_rounded,
                  color: kAppThemeColor,
                ),
                title: const Text("Main Goal"),
                subtitle: Text(data['mainGoal']),
                titleTextStyle: const TextStyle(
                  color: kAppThemeColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                subtitleTextStyle: const TextStyle(
                  color: kGreyThemeColor,
                  fontWeight: FontWeight.w500,
                ),
              ),

              /// Level
              ListTile(
                leading: const Icon(
                  Icons.health_and_safety_rounded,
                  color: kAppThemeColor,
                ),
                title: const Text("Level"),
                subtitle: Text(data['level']),
                titleTextStyle: const TextStyle(
                  color: kAppThemeColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                subtitleTextStyle: const TextStyle(
                  color: kGreyThemeColor,
                  fontWeight: FontWeight.w500,
                ),
              ),

              /// Weekly goal
              ListTile(
                leading: const Icon(
                  Icons.access_time_filled_rounded,
                  color: kAppThemeColor,
                ),
                title: const Text("Weekly Goal"),
                subtitle: data['weeklyGoal'] > 1
                    ? Text("${data['weeklyGoal'].toString()} Days")
                    : Text("${data['weeklyGoal'].toString()} Day"),
                titleTextStyle: const TextStyle(
                  color: kAppThemeColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                subtitleTextStyle: const TextStyle(
                  color: kGreyThemeColor,
                  fontWeight: FontWeight.w500,
                ),
              ),

              /// Focused body areas
              ListTile(
                leading: const Icon(
                  Icons.boy_rounded,
                  color: kAppThemeColor,
                ),
                title: const Text("Focused Body Areas"),
                subtitle: Text(data['focusedBodyAreas']
                    .toString()
                    .split("[")
                    .last
                    .split("]")
                    .first),
                titleTextStyle: const TextStyle(
                  color: kAppThemeColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                subtitleTextStyle: const TextStyle(
                  color: kGreyThemeColor,
                  fontWeight: FontWeight.w500,
                ),
              ),

              /// Sign out button
              ElevatedButton.icon(
                onPressed: () {
                  _showSignOutDialog();
                },
                label: const Text("Sign out"),
                icon: const Icon(
                  Icons.logout_rounded,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
