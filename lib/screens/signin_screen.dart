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
          //Top image of sign in screen
          const Flexible(
            flex: 2,
            child: TopImage(imageUrl: 'images/signin_screen_image.jpg'),
          ),
          //Bottom components of sign in screen
          Flexible(
            flex: 3,
            //Adding padding to the bottom area
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
              //Adding all the components at the bottom to a column
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Top texts column of bottom area
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
                  //Adding space between the top texts column and the email text field
                  const SizedBox(height: 8.0),
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
                  //Adding space between the email text field and the password text field
                  const SizedBox(height: 2.0),
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
                        icon: isVisibilityButtonClicked ? const Icon(Icons.visibility_off_outlined) : const Icon(Icons.visibility_outlined),
                      ),
                    ),
                    obscureText: isVisibilityButtonClicked ? false : true,
                    enableSuggestions: false,
                    autofocus: false,
                  ),
                  //Adding a check box for remember user details
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
                        "Don’t have an account?",
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
