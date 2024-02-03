import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/components/signin_signup_button.dart';
import 'package:smart_personal_coach/components/title_and_description_holder.dart';
import 'package:smart_personal_coach/components/top_image.dart';
import 'package:smart_personal_coach/components/social_media_buttons_container.dart';
import 'package:smart_personal_coach/screens/terms_and_conditions_screen.dart';

/// Sign-Up Screen
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
          /// Top of the screen (Top image)
          MediaQuery.of(context).viewInsets.bottom == 0
              ? const Expanded(
                  flex: 2,
                  child: TopImage(imageUrl: 'images/signup_screen_image.jpg'),
                )
              : const SizedBox(),

          /// Bottom components holder (Middle and bottom of the screen)
          Expanded(
            flex: MediaQuery.of(context).size.height > 800 ? 4 : 8,
            // Add padding around the bottom components
            child: Padding(
              padding: const EdgeInsets.only(
                left: kPadding16,
                right: kPadding16,
                bottom: kPadding16,
              ),
              // Adding all the components at the bottom to a column
              child: Column(
                mainAxisAlignment: MediaQuery.of(context).viewInsets.bottom == 0
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                children: [
                  /// Middle of the screen (Title, user input fields and check box)
                  /// User inputs container and title and description container
                  Column(
                    children: [
                      /// The Title and the description holder
                      const TitleAndDescriptionHolder(
                        title: 'Sign Up',
                        description: 'Create your account here',
                      ),

                      /// Add space
                      const SizedBox(height: 12.0),

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
                        obscureText: _isVisibilityButtonClicked ? false : true,
                        enableSuggestions: false,
                        autofocus: false,
                      ),

                      /// Add space
                      const SizedBox(height: 12.0),

                      /// Confirm the password
                      TextFormField(
                        decoration:
                            kSignInSignUpTextFormFieldDecorations.copyWith(
                          hintText: 'Confirm Password',
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
                        obscureText: _isVisibilityButtonClicked ? false : true,
                        enableSuggestions: false,
                        autofocus: false,
                      ),

                      /// Add space
                      const SizedBox(height: 8.0),

                      /// Check whether agree with the terms and conditions
                      Row(
                        children: [
                          Checkbox(
                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value;
                              });
                            },
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            activeColor: kBlueThemeColor,
                            checkColor: kWhiteThemeColor,
                          ),
                          TextButton(
                            onPressed: () {
                              // When the button is clicked, navigate to the terms and conditions screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TermsAndConditionsScreen(),
                                ),
                              );
                            },
                            style: kTextButtonStyle,
                            child: const Text(
                              'I agree Terms & Conditions',
                              style: kTextButtonTextStyle,
                            ),
                          ),
                        ],
                      ),

                      /// Add space
                      const SizedBox(height: 8.0),

                      /// Sign up button
                      SignInSignUpButton(
                        onPressed: () {},
                        buttonText: 'Sign Up',
                      ),
                    ],
                  ),

                  /// Bottom of the screen (Sign-in button, social media buttons)
                  MediaQuery.of(context).viewInsets.bottom == 0
                      ? Column(
                          children: [
                            /// Social media buttons container
                            SocialMediaButtonsContainer(
                              onPressedFacebook: () {},
                              onPressedGoogle: () {},
                            ),

                            /// Add space
                            const SizedBox(
                              height: 12.0,
                            ),

                            /// Sign in text button container
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Already have an account?",
                                  style: kSmallGreyColorDescriptionTextStyle,
                                ),

                                /// Sign In text button
                                TextButton(
                                  onPressed: () {
                                    // Navigate to the sign-in screen
                                    Navigator.pop(context);
                                  },
                                  style: kTextButtonStyle,
                                  child: const Text(
                                    'Sign In',
                                    style: kTextButtonTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
