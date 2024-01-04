import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';
import 'package:smart_personal_coach/components.dart';
import 'package:smart_personal_coach/screens/signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          //Top image of sign in page
          const Flexible(
            flex: 2,
            child: TopImage(imageUrl: 'images/signin_screen_image.jpg'),
          ),
          //Bottom components of sign in page
          Flexible(
            flex: 3,
            child: Container(
              //Adding padding to the bottom area
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
              //Adding all the components at the bottom to a column
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Top texts of bottom area
                  const Column(
                    children: [
                      Text(
                        'Sign In',
                        style: kLargeTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Please enter email and password for login',
                        style: kSmallTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  //Adding space between the top text column and the email text field
                  const SizedBox(height: 8.0),
                  //Adding text field to get user email
                  const SignInSignUpTextFormField(
                    hintText: 'Email',
                    prefixIcon: Icons.mail_outline,
                  ),
                  //Adding space between the email text field and the password text field
                  const SizedBox(height: 2.0),
                  //Adding text field to get user password
                  const SignInSignUpTextFormField(
                    hintText: 'Password',
                    prefixIcon: Icons.lock_outline,
                  ),
                  //Adding a check box
                  CheckboxListTile(
                    title: const Text(
                      'Remember Me',
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
                  //Sign in button
                  SignInSignUpButton(
                    onPressed: () {},
                    buttonText: 'Sign In',
                  ),
                  //Forget password button
                  Container(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.fromLTRB(10.0, 0, 10.0, 0))),
                      child: const Text(
                        'Forget Password',
                        style: kSmallTextStyle,
                      ),
                    ),
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
                        "Don’t have account?",
                        style: kSmallTextStyle,
                      ),
                      //Sign Up text button
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsets.zero),
                        ),
                        child: Text(
                          'Sign Up',
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
