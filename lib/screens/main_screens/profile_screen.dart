import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_personal_coach/constants.dart';
import 'package:smart_personal_coach/screens/initial_screens/signin_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:smart_personal_coach/screens/updating_data_screens/update_body_areas_selection_screen.dart';
import 'package:smart_personal_coach/screens/updating_data_screens/update_main_goal_screen.dart';

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

  // Creating text controllers
  final _mainGoalEmailController = TextEditingController();
  final _levelEmailController = TextEditingController();
  final _weeklyGoalEmailController = TextEditingController();
  final _focusedBodyAreasEmailController = TextEditingController();

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

  /// Update profile picture
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

  /// Update username
  Future<void> updateUserName(String updatedUserName) async {
    try {
      // Get a reference to the document
      DocumentReference documentRef = FirebaseFirestore.instance
          .collection('users')
          .doc(loggedInUser.email);

      // Update the user name field
      await documentRef.update({
        'userName': updatedUserName,
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

      // Update the gender
      await documentRef.update({
        'gender': updatedGender,
      });

      print('Document updated successfully.');
    } catch (e) {
      print('Error updating document: $e');
    }
  }

  /// Update birth day
  Future<void> updateBirthDay(DateTime updatedUserBirthDay) async {
    try {
      // Get a reference to the document
      DocumentReference documentRef = FirebaseFirestore.instance
          .collection('users')
          .doc(loggedInUser.email);

      // Update the birth day
      await documentRef.update({
        'birthDay': updatedUserBirthDay,
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

  /// Update height
  Future<void> updateHeight(int updatedHeight) async {
    try {
      // Get a reference to the document
      DocumentReference documentRef = FirebaseFirestore.instance
          .collection('users')
          .doc(loggedInUser.email);

      // Update the height
      await documentRef.update({
        'height': updatedHeight,
      });

      print('Document updated successfully.');
    } catch (e) {
      print('Error updating document: $e');
    }
  }

  /// Update weight
  Future<void> updateWeight(int updatedWeight) async {
    try {
      // Get a reference to the document
      DocumentReference documentRef = FirebaseFirestore.instance
          .collection('users')
          .doc(loggedInUser.email);

      // Update the weight
      await documentRef.update({
        'weight': updatedWeight,
      });

      print('Document updated successfully.');
    } catch (e) {
      print('Error updating document: $e');
    }
  }

  /// Update level
  Future<void> updateLevel(String updatedLevel) async {
    try {
      // Get a reference to the document
      DocumentReference documentRef = FirebaseFirestore.instance
          .collection('users')
          .doc(loggedInUser.email);

      // Update the main goal
      await documentRef.update({
        'level': updatedLevel,
      });

      print('Document updated successfully.');
    } catch (e) {
      print('Error updating document: $e');
    }
  }

  /// Update weekly goal
  Future<void> updateWeeklyGoal(int updatedWeeklyGoal) async {
    try {
      // Get a reference to the document
      DocumentReference documentRef = FirebaseFirestore.instance
          .collection('users')
          .doc(loggedInUser.email);

      // Update the main goal
      await documentRef.update({
        'weeklyGoal': updatedWeeklyGoal,
      });

      print('Document updated successfully.');
    } catch (e) {
      print('Error updating document: $e');
    }
  }

  @override
  void initState() {
    getLoggedIntUser();
    super.initState();
  }

  @override
  void dispose() {
    _mainGoalEmailController.dispose();
    _levelEmailController.dispose();
    _weeklyGoalEmailController.dispose();
    _focusedBodyAreasEmailController.dispose();
    super.dispose();
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
            return const Center(child: Text("Something went wrong"));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("Loading profile..."));
          }

          if (!snapshot.hasData) {
            return const Center(child: Text("No data available"));
          }

          // Access the data from the snapshot
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          // Declaring a variable to store the user's birth day
          Timestamp userBirthDay = data['birthDay'];

          // Creating text controllers
          final userNameController = TextEditingController();
          final userWeightController = TextEditingController();
          final userHeightController = TextEditingController();
          // Assign initial values to text controllers (username, height, weight)
          userHeightController.text = data['height'].toString();
          userNameController.text = data['userName'];
          userWeightController.text = data['weight'].toString();

          String imageUrl = data['profilePicture'];

          List<dynamic> fBA = data["focusedBodyAreas"];

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
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: kGreyThemeColor02,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person_rounded,
                        size: 100,
                        color: kWhiteThemeColor,
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
                      fontWeight: FontWeight.w700,
                      fontSize: 26.0,
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
                  color: kBlackThemeColor,
                ),
                title: const Text("Email"),
                subtitle: Text(data['email']),
                titleTextStyle: kProfileTitleTextStyle,
                subtitleTextStyle: kSmallGreyColorDescriptionTextStyle.copyWith(
                  fontWeight: FontWeight.w400,
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
                titleTextStyle: kProfileTitleTextStyle,
                subtitleTextStyle: kSmallGreyColorDescriptionTextStyle.copyWith(
                  fontWeight: FontWeight.w400,
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
                  color: kBlackThemeColor,
                ),
                title: const Text("Birth Day"),
                subtitle: Text("${userBirthDay.toDate()}".split(' ')[0]),
                titleTextStyle: kProfileTitleTextStyle,
                subtitleTextStyle: kSmallGreyColorDescriptionTextStyle.copyWith(
                  fontWeight: FontWeight.w400,
                ),
                onTap: () {
                  // Changing the birth day
                  _selectUserBirthDay(context, userBirthDay.toDate());
                },
              ),

              /// Height
              ListTile(
                leading: const Icon(
                  Icons.height_rounded,
                  color: kBlackThemeColor,
                ),
                title: const Text("Height"),
                subtitle: Text("${data['height'].toString()} cm"),
                titleTextStyle: kProfileTitleTextStyle,
                subtitleTextStyle: kSmallGreyColorDescriptionTextStyle.copyWith(
                  fontWeight: FontWeight.w400,
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      // Changing the height
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
                  color: kBlackThemeColor,
                ),
                title: const Text("Weight"),
                subtitle: Text("${data['weight'].toString()} kg"),
                titleTextStyle: kProfileTitleTextStyle,
                subtitleTextStyle: kSmallGreyColorDescriptionTextStyle.copyWith(
                  fontWeight: FontWeight.w400,
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      // Changing the weight
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
                  color: kBlackThemeColor,
                ),
                title: const Text("Main Goal"),
                subtitle: Text(data['mainGoal']),
                titleTextStyle: kProfileTitleTextStyle,
                subtitleTextStyle: kSmallGreyColorDescriptionTextStyle.copyWith(
                  fontWeight: FontWeight.w400,
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      // Changing the main goal
                      return AlertDialog(
                        backgroundColor: kRedThemeColor,
                        icon: const Icon(
                          Icons.warning_rounded,
                          color: kWhiteThemeColor,
                        ),
                        title: const Text(
                          "Are you sure?",
                          style: TextStyle(color: kWhiteThemeColor),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "If you change your main goal, your workout plan will re-generate! If you want to continue, enter your email to confirm!",
                              style: TextStyle(color: kWhiteThemeColor),
                            ),
                            TextFormField(
                              controller: _mainGoalEmailController,
                              style: const TextStyle(color: kWhiteThemeColor),
                              cursorColor: kWhiteThemeColor,
                              decoration: kMlwfTextFormFieldDecorations,
                            ),
                          ],
                        ),
                        actions: [
                          /// Cancel button
                          ElevatedButton(
                            onPressed: () {
                              _mainGoalEmailController.clear();
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: kRedThemeColor),
                            ),
                          ),

                          /// Continue button
                          ElevatedButton(
                            onPressed: () {
                              if (_mainGoalEmailController.text.trim() ==
                                  loggedInUser.email) {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UpdateMainGoalScreen(
                                              userMainGoal: data["mainGoal"],
                                              loggedInUser: loggedInUser,
                                            )));
                                _mainGoalEmailController.clear();
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text("Wrong email!"),
                                      content: const Text(
                                          "The email entered doesn't match with your email address. Check back and try again!"),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Try again"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            child: const Text(
                              "Continue",
                              style: TextStyle(color: kRedThemeColor),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),

              /// Level
              ListTile(
                leading: const Icon(
                  Icons.health_and_safety_rounded,
                  color: kBlackThemeColor,
                ),
                title: const Text("Level"),
                subtitle: Text(data['level']),
                titleTextStyle: kProfileTitleTextStyle,
                subtitleTextStyle: kSmallGreyColorDescriptionTextStyle.copyWith(
                  fontWeight: FontWeight.w400,
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      // Changing the level
                      return buildAlertDialogChangeLevel(context, data);
                    },
                  );
                },
              ),

              /// Weekly goal
              ListTile(
                leading: const Icon(
                  Icons.access_time_filled_rounded,
                  color: kBlackThemeColor,
                ),
                title: const Text("Weekly Goal"),
                subtitle: data['weeklyGoal'] > 1
                    ? Text("${data['weeklyGoal'].toString()} Days")
                    : Text("${data['weeklyGoal'].toString()} Day"),
                titleTextStyle: kProfileTitleTextStyle,
                subtitleTextStyle: kSmallGreyColorDescriptionTextStyle.copyWith(
                  fontWeight: FontWeight.w400,
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      // Changing the weekly goal
                      return buildAlertDialogChangeWeeklyGoal(context, data);
                    },
                  );
                },
              ),

              /// Focused body areas
              ListTile(
                leading: const Icon(
                  Icons.boy_rounded,
                  color: kBlackThemeColor,
                ),
                title: const Text("Focused Body Areas"),
                subtitle: Text(fBA.toString().split("[").last.split("]").first),
                titleTextStyle: kProfileTitleTextStyle,
                subtitleTextStyle: kSmallGreyColorDescriptionTextStyle.copyWith(
                  fontWeight: FontWeight.w400,
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      // Changing the focused body areas
                      return AlertDialog(
                        backgroundColor: kRedThemeColor,
                        icon: const Icon(
                          Icons.warning_rounded,
                          color: kWhiteThemeColor,
                        ),
                        title: const Text(
                          "Are you sure?",
                          style: TextStyle(color: kWhiteThemeColor),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "If you change your focused body areas, your workout plan will re-generate! If you want to continue, enter your email to confirm!",
                              style: TextStyle(color: kWhiteThemeColor),
                            ),
                            TextFormField(
                              controller: _focusedBodyAreasEmailController,
                              style: const TextStyle(color: kWhiteThemeColor),
                              cursorColor: kWhiteThemeColor,
                              decoration: kMlwfTextFormFieldDecorations,
                            ),
                          ],
                        ),
                        actions: [
                          /// Cancel button
                          ElevatedButton(
                            onPressed: () {
                              _focusedBodyAreasEmailController.clear();
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: kRedThemeColor),
                            ),
                          ),

                          /// Continue button
                          ElevatedButton(
                            onPressed: () {
                              if (_focusedBodyAreasEmailController.text
                                      .trim() ==
                                  loggedInUser.email) {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          UpdateBodyAreasSelectionScreen(
                                        loggedInUser: loggedInUser,
                                        userSelectedBodyAreas: fBA
                                            .map(
                                                (element) => element.toString())
                                            .toList(),
                                      ),
                                    ));
                                _focusedBodyAreasEmailController.clear();
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text("Wrong email!"),
                                      content: const Text(
                                          "The email entered doesn't match with your email address. Check back and try again!"),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Try again"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            child: const Text(
                              "Continue",
                              style: TextStyle(color: kRedThemeColor),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),

              /// Adding space
              const SizedBox(height: 8.0),

              /// Sign out button
              ElevatedButton.icon(
                onPressed: () {
                  _showSignOutDialog();
                },
                style: kSignInSignUpSignOutResetPasswordButtonStyle,
                label: const Text(
                  "Sign out",
                  style: kSignInSignUpSignOutButtonResetPasswordTextStyle,
                ),
                icon: const Icon(
                  Icons.logout_rounded,
                  color: kWhiteThemeColor,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  /// Change the level
  AlertDialog buildAlertDialogChangeLevel(
      BuildContext context, Map<String, dynamic> data) {
    return AlertDialog(
      backgroundColor: kRedThemeColor,
      icon: const Icon(
        Icons.warning_rounded,
        color: kWhiteThemeColor,
      ),
      title: const Text(
        "Are you sure?",
        style: TextStyle(color: kWhiteThemeColor),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "If you change your level, your workout plan will re-generate! If you want to continue, enter your email to confirm!",
            style: TextStyle(color: kWhiteThemeColor),
          ),
          TextFormField(
            controller: _levelEmailController,
            style: const TextStyle(color: kWhiteThemeColor),
            cursorColor: kWhiteThemeColor,
            decoration: kMlwfTextFormFieldDecorations,
          ),
        ],
      ),
      actions: [
        /// Cancel button
        ElevatedButton(
          onPressed: () {
            _levelEmailController.clear();
            Navigator.pop(context);
          },
          child: const Text(
            "Cancel",
            style: TextStyle(color: kRedThemeColor),
          ),
        ),

        /// Ok button
        ElevatedButton(
          onPressed: () {},
          child: const Text(
            "Continue",
            style: TextStyle(color: kRedThemeColor),
          ),
        ),
      ],
    );
  }

  /// Change the weekly goal
  AlertDialog buildAlertDialogChangeWeeklyGoal(
      BuildContext context, Map<String, dynamic> data) {
    return AlertDialog(
      backgroundColor: kRedThemeColor,
      icon: const Icon(
        Icons.warning_rounded,
        color: kWhiteThemeColor,
      ),
      title: const Text(
        "Are you sure?",
        style: TextStyle(color: kWhiteThemeColor),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "If you change your weekly goal, your workout plan will re-generate! If you want to continue, enter your email to confirm!",
            style: TextStyle(color: kWhiteThemeColor),
          ),
          TextFormField(
            controller: _weeklyGoalEmailController,
            style: const TextStyle(color: kWhiteThemeColor),
            cursorColor: kWhiteThemeColor,
            decoration: kMlwfTextFormFieldDecorations,
          ),
        ],
      ),
      actions: [
        /// Cancel button
        ElevatedButton(
          onPressed: () {
            _weeklyGoalEmailController.clear();
            Navigator.pop(context);
          },
          child: const Text(
            "Cancel",
            style: TextStyle(color: kRedThemeColor),
          ),
        ),

        /// Ok button
        ElevatedButton(
          onPressed: () {
            if (_weeklyGoalEmailController.text.trim() == loggedInUser.email) {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Select your Weekly Goal"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        /// Option 01
                        ElevatedButton(
                          onPressed: data["weeklyGoal"] == 1
                              ? null
                              : () {
                                  updateWeeklyGoal(1);
                                  Navigator.pop(context);
                                },
                          child: const Text("1 Day"),
                        ),

                        /// Option 02
                        ElevatedButton(
                          onPressed: data["weeklyGoal"] == 2
                              ? null
                              : () {
                                  updateWeeklyGoal(2);
                                  Navigator.pop(context);
                                },
                          child: const Text("2 Days"),
                        ),

                        /// Option 03
                        ElevatedButton(
                          onPressed: data["weeklyGoal"] == 3
                              ? null
                              : () {
                                  updateWeeklyGoal(3);
                                  Navigator.pop(context);
                                },
                          child: const Text("3 Days"),
                        ),

                        /// Option 04
                        ElevatedButton(
                          onPressed: data["weeklyGoal"] == 4
                              ? null
                              : () {
                                  updateWeeklyGoal(4);
                                  Navigator.pop(context);
                                },
                          child: const Text("4 Days"),
                        ),

                        /// Option 05
                        ElevatedButton(
                          onPressed: data["weeklyGoal"] == 5
                              ? null
                              : () {
                                  updateWeeklyGoal(5);
                                  Navigator.pop(context);
                                },
                          child: const Text("5 Days"),
                        ),

                        /// Option 06
                        ElevatedButton(
                          onPressed: data["weeklyGoal"] == 6
                              ? null
                              : () {
                                  updateWeeklyGoal(6);
                                  Navigator.pop(context);
                                },
                          child: const Text("6 Days"),
                        ),

                        /// Option 07
                        ElevatedButton(
                          onPressed: data["weeklyGoal"] == 7
                              ? null
                              : () {
                                  updateWeeklyGoal(7);
                                  Navigator.pop(context);
                                },
                          child: const Text("7 Days"),
                        ),
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel"),
                      ),
                    ],
                  );
                },
              );
              _weeklyGoalEmailController.clear();
            } else {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Wrong email!"),
                    content: const Text(
                        "The email entered doesn't match with your email address. Check back and try again!"),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Try again"),
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: const Text(
            "Continue",
            style: TextStyle(color: kRedThemeColor),
          ),
        ),
      ],
    );
  }
}
