import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';
import 'package:smart_personal_coach/components.dart';
import 'package:smart_personal_coach/screens/signin_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? isChecked = false;

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
                  const SignInSignUpTextFormField(
                    hintText: 'Full Name',
                    prefixIcon: Icons.person_outlined,
                  ),
                  //Adding a text field to get the email
                  const SignInSignUpTextFormField(
                    hintText: 'Email',
                    prefixIcon: Icons.person_outlined,
                  ),
                  //Adding a text field to get the phone number
                  const SignInSignUpTextFormField(
                    hintText: 'Phone Number',
                    prefixIcon: Icons.person_outlined,
                  ),
                  //Adding a text field to get the password
                  const SignInSignUpTextFormField(
                    hintText: 'Password',
                    prefixIcon: Icons.person_outlined,
                  ),
                  //Adding a text field to get the confirm password
                  const SignInSignUpTextFormField(
                    hintText: 'Confirm Password',
                    prefixIcon: Icons.person_outlined,
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
                  Column(
                    children: [
                      const Text(
                        "Or continue with",
                        style: kSmallTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      //Icon buttons row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Google icon button
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'images/google_icon.png',
                            ),
                          ),
                          //Facebook icon button
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'images/facebook_icon.png',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //Bottom text and button of bottom area
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Have an account?",
                        style: kSmallTextStyle,
                      ),
                      //Sign In text button
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignInScreen(),
                            ),
                          );
                        },
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsets.zero),
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
