import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/components/signin_signup_button.dart';
import 'package:smart_personal_coach/components/title_and_description_holder.dart';
import 'package:smart_personal_coach/components/top_image.dart';
import 'package:smart_personal_coach/components/social_media_buttons_container.dart';

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
      resizeToAvoidBottomInset: false,

      /// Body of the screen
      body: Column(
        children: [
          /// Top image container
          const Expanded(
            flex: 1,
            child: TopImage(imageUrl: 'images/signup_screen_image.jpg'),
          ),

          /// The Title and the description holder
          const SizedBox(
            child: TitleAndDescriptionHolder(
              title: 'Sign Up',
              description: 'Create your account here',
            ),
          ),

          /// Bottom components holder
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(
                top: kPadding8,
                left: kPadding16,
                right: kPadding16,
                bottom: kPadding16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Get the user's full name
                  TextFormField(
                    decoration: kSignInSignUpTextFormFieldDecorations.copyWith(
                      hintText: 'Full Name',
                      prefixIcon: const Icon(
                        Icons.person_outlined,
                        color: kGreyThemeColor,
                      ),
                    ),
                  ),

                  /// Get the user's email
                  TextFormField(
                    decoration: kSignInSignUpTextFormFieldDecorations.copyWith(
                      hintText: 'Email',
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: kGreyThemeColor,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),

                  /// Get the user's phone number
                  TextFormField(
                    decoration: kSignInSignUpTextFormFieldDecorations.copyWith(
                      hintText: 'Phone Number',
                      prefixIcon: const Icon(
                        Icons.phone_outlined,
                        color: kGreyThemeColor,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  /// Get the user's password
                  TextFormField(
                    decoration: kSignInSignUpTextFormFieldDecorations.copyWith(
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
                            ? const Icon(Icons.visibility_off_outlined)
                            : const Icon(Icons.visibility_outlined),
                      ),
                    ),
                    obscureText: _isVisibilityButtonClicked ? false : true,
                    enableSuggestions: false,
                    autofocus: false,
                  ),

                  /// Confirm the password
                  TextFormField(
                    decoration: kSignInSignUpTextFormFieldDecorations.copyWith(
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
                            ? const Icon(Icons.visibility_off_outlined)
                            : const Icon(Icons.visibility_outlined),
                      ),
                    ),
                    obscureText: _isVisibilityButtonClicked ? false : true,
                    enableSuggestions: false,
                    autofocus: false,
                  ),

                  /// Check whether agree with the terms and conditions
                  CheckboxListTile(
                    title: const Text(
                      'I agree Terms & Conditions',
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

                  /// Sign up button
                  SignInSignUpButton(
                    onPressed: () {},
                    buttonText: 'Sign Up',
                  ),

                  /// Social media buttons container
                  SocialMediaButtonsContainer(
                    onPressedFacebook: () {},
                    onPressedGoogle: () {},
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
                          Navigator.pop(context);
                        },
                        style: kSignInSignUpForgetPasswordTextButtonStyle,
                        child: Text(
                          'Sign In',
                          style: kSmallGreyColorDescriptionTextStyle.copyWith(
                              color: kBlueThemeColor),
                        ),
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
