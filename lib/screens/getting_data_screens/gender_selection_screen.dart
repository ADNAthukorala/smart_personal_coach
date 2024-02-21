import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/app_bar_title.dart';
import 'package:smart_personal_coach/constants.dart';
import 'package:smart_personal_coach/components/next_button.dart';
import 'package:smart_personal_coach/components/title_and_description_holder.dart';
import 'package:smart_personal_coach/components/top_image.dart';
import 'package:smart_personal_coach/screens/getting_data_screens/birthday_height_weight_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Screen to get the user's gender
class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({super.key});

  @override
  State<GenderSelectionScreen> createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  // Creating an instances of FirebaseAuth and FirebaseFirestore
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  // Creating an user variable to store logged in user
  late User loggedInUser;

  // Variable to store the user's gender
  String _userGender = "Not Selected";

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

  /// Deleting a document from database
  void _deleteDocument() async {
    try {
      // Get a reference to the document you want to delete
      DocumentReference documentReference =
          _firestore.collection('users').doc(loggedInUser.email);

      // Delete the document
      await documentReference.delete();

      print('Document deleted successfully');
    } catch (e) {
      print('Error deleting document: $e');
    }
  }

  // Default profile picture url
  final String defaultProfilePicture = "https://firebasestorage.googleapis.com/v0/b/smartpersonalcoach.appspot.com/o/profile_pictures%2Fdefault_profile_picture.jpg?alt=media&token=0cddd010-118c-47ce-ba0a-fad1e54b479b";

  /// Adding data to the database (User gender)
  void addData() {
    _firestore
        .collection("users")
        .doc(loggedInUser.email)
        .set({'gender': _userGender, 'user_name': "user", 'email': loggedInUser.email, 'profile_picture': defaultProfilePicture}, SetOptions(merge: true)).onError(
            (error, stackTrace) => print("Error: $error"));
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

  void _showBackDialog() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: kBlueThemeColor,
          title: const Text(
            'Are you sure?',
            style: TextStyle(color: kWhiteThemeColor),
          ),
          content: const Text(
            'Are you sure you want to leave this page?',
            style: TextStyle(color: kWhiteThemeColor),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text(
                'No',
                style: TextStyle(color: kBlueThemeColor),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: const Text(
                'Yes',
                style: TextStyle(color: kBlueThemeColor),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                _deleteDocument();
                _signOut();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    getLoggedIntUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        _showBackDialog();
      },
      child: Scaffold(
        /// App Bar
        appBar: AppBar(
          backgroundColor: kWhiteThemeColor,
          scrolledUnderElevation: 0,
          centerTitle: true,

          /// Show which screen the user is on
          title: const AppBarTitle(
            screenId: 1,
          ),
        ),

        /// Body of the screen
        body: Padding(
          // Add padding around the body of the screen
          padding: const EdgeInsets.only(
            left: kPadding16,
            right: kPadding16,
            bottom: kPadding16,
          ),
          child: Column(
            children: [
              /// Top of the screen
              /// The title and the description
              const Padding(
                padding: EdgeInsets.only(
                  bottom: kPadding8,
                ),
                child: TitleAndDescriptionHolder(
                  title: "What's your gender?",
                  description: '',
                ),
              ),

              /// Middle of the screen
              /// The image and the gender selection buttons holder
              Expanded(
                child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(
                      top: kPadding8,
                      bottom: kPadding8,
                    ),
                    primary: false,
                    children: [
                      /// Image of gender selection screen
                      const SizedBox(
                        height: 210.0,
                        child: TopImage(
                            imageUrl:
                                'images/gender_selection_screen_image.jpg'),
                      ),

                      /// Add space between the image and the gender selection buttons holder
                      const SizedBox(height: 10.0),

                      /// Gender selection buttons holder
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          /// Male button
                          _buildMaleButton(),

                          /// Female button
                          _buildFemaleButton(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              /// Bottom of the screen
              /// Next button
              Padding(
                padding: const EdgeInsets.only(
                  top: kPadding8,
                ),
                child: NextButton(
                  onPressed: _userGender == "Not Selected"
                      ? null // Disable the next button
                      : () {
                          // Calling the addData method to add data to the database
                          addData();
                          // When the button is clicked, navigate to the age, height, weight screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const BirthDayHeightWeightScreen(),
                            ),
                          );
                        },
                  style: kNextButtonStyle.copyWith(
                      backgroundColor: MaterialStatePropertyAll(
                          _userGender == "Not Selected"
                              ? kGreyThemeColor02
                              : kBlueThemeColor)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Female button
  ElevatedButton _buildFemaleButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          // If the male button is clicked, selected gender = Female
          _userGender = "Female";
        });
      },
      style: kGenderSelectionButtonStyle.copyWith(
        backgroundColor: MaterialStatePropertyAll(
            _userGender == "Female" ? kPinkThemeColor : kWhiteThemeColor),
      ),
      child: Text(
        'Female',
        style: kLargeBlackTitleTextStyle.copyWith(
            color:
                _userGender == "Female" ? kWhiteThemeColor : kPinkThemeColor),
      ),
    );
  }

  /// Male button
  ElevatedButton _buildMaleButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          // If the male button is clicked, selected gender = Male
          _userGender = "Male";
        });
      },
      style: kGenderSelectionButtonStyle.copyWith(
        backgroundColor: MaterialStatePropertyAll(
            _userGender == "Male" ? kBlueThemeColor : kWhiteThemeColor),
      ),
      child: Text(
        'Male',
        style: kLargeBlackTitleTextStyle.copyWith(
            color: _userGender == "Male" ? kWhiteThemeColor : kBlueThemeColor),
      ),
    );
  }
}
