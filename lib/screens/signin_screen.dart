import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/components/signin_signup_button.dart';
import 'package:smart_personal_coach/components/title_and_description_holder.dart';
import 'package:smart_personal_coach/components/top_image.dart';
import 'package:smart_personal_coach/components/social_media_buttons_container.dart';
import 'package:smart_personal_coach/screens/get_data/gender_selection_screen.dart';
import 'package:smart_personal_coach/screens/signup_screen.dart';

/// Sign-In Screen
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  /// To check whether check box is checked or not.
  bool? _isChecked = false;

  /// To check whether visibility button is clicked or not.
  bool _isVisibilityButtonClicked = false;

  /// Visibility button click function
  void visibilityButtonClick() {
    if (_isVisibilityButtonClicked == false) {
      _isVisibilityButtonClicked = true;
    } else {
      _isVisibilityButtonClicked = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Body of the screen
      body: Column(
        children: [
          /// Top of the screen ( Top image, The title and the description)
          const Expanded(
            flex: 1,
            child: Column(
              children: [
                /// Top image container
                Expanded(
                  child: TopImage(imageUrl: 'images/signin_screen_image.jpg'),
                ),

                /// The Title and the description holder
                TitleAndDescriptionHolder(
                  title: 'Sign In',
                  description: 'Please enter email and password for login',
                ),
              ],
            ),
          ),

          /// Bottom components holder (Middle and bottom of the screen)
          Expanded(
            flex: MediaQuery.of(context).viewInsets.bottom == 0 ? 1 : 2,
            // Add padding around the bottom components
            child: Padding(
              padding: const EdgeInsets.only(
                top: kPadding8,
                left: kPadding16,
                right: kPadding16,
                bottom: kPadding16,
              ),
              //Adding all the components at the bottom to a column
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Middle of the screen (User input fields and check box)
                  /// User inputs container
                  Expanded(
                    // Center the list view inside the expanded widget
                    child: Center(
                      // Include all components in the list view and set padding around the components to 0
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        // If the viewport's max height is greater than 800 and the key board is hidden, the listview never scrolls, otherwise scrolls
                        physics:
                            (MediaQuery.of(context).viewInsets.bottom == 0 &&
                                    MediaQuery.of(context).size.height > 800)
                                ? const NeverScrollableScrollPhysics()
                                : const AlwaysScrollableScrollPhysics(),
                        children: [
                          /// Get the user's email
                          TextFormField(
                            decoration:
                                kSignInSignUpTextFormFieldDecorations.copyWith(
                              hintText: 'Email',
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                color: kGreyThemeColor,
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),

                          /// Add space
                          const SizedBox(height: 12.0),

                          /// Get the user's password
                          TextFormField(
                            decoration:
                                kSignInSignUpTextFormFieldDecorations.copyWith(
                              hintText: 'Password',
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: kGreyThemeColor,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    visibilityButtonClick();
                                  });
                                },
                                icon: _isVisibilityButtonClicked
                                    ? const Icon(Icons.visibility_outlined)
                                    : const Icon(Icons.visibility_off_outlined),
                              ),
                            ),
                            obscureText:
                                _isVisibilityButtonClicked ? false : true,
                            enableSuggestions: false,
                            autofocus: false,
                          ),

                          /// Add a check box to remember user details
                          CheckboxListTile(
                            title: const Text(
                              'Remember Me',
                              style: kSmallGreyColorDescriptionTextStyle,
                            ),
                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: kBlueThemeColor,
                            checkColor: kWhiteThemeColor,
                            contentPadding: const EdgeInsets.all(0),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// Bottom of the screen (Sign-up button, social media buttons, sign-in button)
                  Column(
                    children: [
                      /// Add space between the middle and the bottom of the screen
                      const SizedBox(height: 8.0),

                      /// Sign in button
                      SignInSignUpButton(
                        onPressed: () {
                          // Navigate to the gender selection screen screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const GenderSelectionScreen(),
                            ),
                          );
                        },
                        buttonText: 'Sign In',
                      ),

                      /// Add space
                      const SizedBox(height: 8.0),

                      /// Forget password button
                      Container(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {},
                          style: kTextButtonStyle,
                          child: Text(
                            'Forget Password',
                            style: kTextButtonTextStyle.copyWith(
                              color: kGreyThemeColor,
                            ),
                          ),
                        ),
                      ),

                      /// Social media buttons container
                      SocialMediaButtonsContainer(
                        onPressedFacebook: () {},
                        onPressedGoogle: () {},
                      ),

                      /// Add space
                      const SizedBox(height: 8.0),

                      /// Sign up text button container
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don’t have an account?",
                            style: kSmallGreyColorDescriptionTextStyle,
                          ),

                          /// Sign up text button
                          TextButton(
                            onPressed: () {
                              // Navigate to the sign-up screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpScreen(),
                                ),
                              );
                            },
                            style: kTextButtonStyle,
                            child: const Text(
                              'Sign Up',
                              style: kTextButtonTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
