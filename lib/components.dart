import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';

//Login and SignUp button
class SignInSignUpButton extends StatelessWidget {
  const SignInSignUpButton(
      {super.key, required this.buttonText, required this.onPressed});

  final String buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: kSignInSignUpButtonStyle,
      child: Text(
        buttonText,
        style: kSignInSignUpButtonTextStyle,
      ),
    );
  }
}

//Screen's top image
class TopImage extends StatelessWidget {
  const TopImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(50.0),
        ),
      ),
    );
  }
}
