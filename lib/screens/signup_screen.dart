import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/components/signin_signup_button.dart';
import 'package:smart_personal_coach/components/top_image.dart';
import 'package:smart_personal_coach/components/social_media_buttons_container.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? isChecked = false;
  //To check whether visibility button is clicked or not.
  bool isVisibilityButtonClicked = false;
  //Visibility button click function
  void visibilityButtonClick() {
    if (isVisibilityButtonClicked == false) {
      isVisibilityButtonClicked = true;
    } else {
      isVisibilityButtonClicked = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          //Top image of sign up screen
          const Flexible(
            flex: 1,
            child: TopImage(imageUrl: 'images/signup_screen_image.jpg'),
          ),
          //Bottom components of sign up screen
          Flexible(
            flex: 3,
            //Adding padding to the bottom area
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Top texts column of bottom area
                  const Column(
                    children: [
                      Text(
                        'Sign Up',
                        style: kLargeTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Create your account here',
                        style: kSmallTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  //Adding space between the top texts column and the full name text field
                  const SizedBox(height: 8.0),
                  //Adding a text field to get the full name
                  TextFormField(
                    decoration: kSignInSignUpTextFormFieldDecorations.copyWith(
                      hintText: 'Full Name',
                      prefixIcon: const Icon(
                        Icons.person_outlined,
                        color: kGreyThemeColor,
                      ),
                    ),
                  ),
                  //Adding a text field to get the email
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
                  //Adding a text field to get the phone number
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
                  //Adding a text field to get the password
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
                        icon: isVisibilityButtonClicked
                            ? const Icon(Icons.visibility_off_outlined)
                            : const Icon(Icons.visibility_outlined),
                      ),
                    ),
                    obscureText: isVisibilityButtonClicked ? false : true,
                    enableSuggestions: false,
                    autofocus: false,
                  ),
                  //Adding a text field to get the confirm password
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
                        icon: isVisibilityButtonClicked
                            ? const Icon(Icons.visibility_off_outlined)
                            : const Icon(Icons.visibility_outlined),
                      ),
                    ),
                    obscureText: isVisibilityButtonClicked ? false : true,
                    enableSuggestions: false,
                    autofocus: false,
                  ),
                  //Adding a check box for terms and conditions
                  CheckboxListTile(
                    title: const Text(
                      'I agree Terms & Conditions',
                      style: kSmallTextStyle,
                    ),
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: kBlueThemeColor,
                    checkColor: kWhiteThemeColor,
                    contentPadding: const EdgeInsets.all(0),
                  ),
                  //Sign up button
                  SignInSignUpButton(
                    onPressed: () {},
                    buttonText: 'Sign Up',
                  ),
                  //Social media icon buttons with text
                  SocialMediaButtonsContainer(
                    onPressedFacebook: () {},
                    onPressedGoogle: () {},
                  ),
                  //Bottom text and button of bottom area
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: kSmallTextStyle,
                      ),
                      //Sign In text button
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsets.zero),
                          overlayColor:
                              MaterialStatePropertyAll(kGreyThemeColor02),
                        ),
                        child: Text(
                          'Sign In',
                          style:
                              kSmallTextStyle.copyWith(color: kBlueThemeColor),
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
