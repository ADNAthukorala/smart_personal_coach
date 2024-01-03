import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';
import 'package:smart_personal_coach/components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          //Top image of sign in page
          Flexible(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/login_screen_image.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50.0),
                ),
              ),
            ),
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
                        style: kSignInTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Please enter email and password for login',
                        style: kSignInMessageTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  //Adding space between the top text column and the email text field
                  const SizedBox(height: 8.0),
                  const ModifiedTextFormField(
                    hintText: 'Email',
                    prefixIcon: Icons.mail_outline,
                  ),
                  //Adding space between the email text field and the password text field
                  const SizedBox(height: 2.0),
                  const ModifiedTextFormField(
                    hintText: 'Password',
                    prefixIcon: Icons.lock_outline,
                  ),
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
                  SignInSignUpButton(
                    onPressed: () {},
                    buttonText: 'Sign In',
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forget Password',
                        style: const TextStyle(
                          fontFamily: "Inter",
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff7e7474),
                        ),
                      ),
                      style: ButtonStyle(
                        overlayColor: MaterialStatePropertyAll(Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          "Or continue with",
                          style: const TextStyle(
                            fontFamily: "Inter",
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff7e7474),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.facebook_rounded),
                              iconSize: 30.0,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.facebook_rounded),
                              iconSize: 30.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have account?",
                        style: const TextStyle(
                          fontFamily: "Inter",
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF7E7474),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsets.zero),
                          overlayColor: MaterialStatePropertyAll(Colors.white),
                        ),
                        child: Text(
                          'Sign Up',
                          style: const TextStyle(
                            fontFamily: "Inter",
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF2596BE),
                          ),
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
