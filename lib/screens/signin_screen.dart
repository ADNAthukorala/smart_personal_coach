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
          Flexible(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/login_screen_image.jpg'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50.0),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Sign In',
                    style: kSignInTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    'Please enter email and password for login',
                    style: kSignInMessageTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 22.0),
                  TextField(
                    decoration: kTextFieldInputDecoration.copyWith(
                        hintText: 'Email',
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: kGreyThemeColor,
                        )),
                  ),
                  const SizedBox(height: 15.0),
                  TextField(
                    decoration: kTextFieldInputDecoration.copyWith(
                        hintText: 'Password',
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: kGreyThemeColor,
                        )),
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
                  const SizedBox(height: 8.0),
                  SignInSignUpButton(
                    onPressed: () {

                    },
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
