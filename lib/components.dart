import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';

//Text field for getting user inputs
class ModifiedTextFormField extends StatelessWidget {
  const ModifiedTextFormField({super.key, required this.hintText, required this.prefixIcon});

  final String? hintText;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(
          prefixIcon,
          color: kGreyThemeColor,
        ),
        hintStyle: const TextStyle(
          color: kGreyThemeColor,
          fontFamily: kThemeFontFamily,
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: kGreyThemeColor02,
        contentPadding: const EdgeInsets.only(
            left: 8.0, top: 12.0, right: 8.0, bottom: 12.0),
      ),
    );
  }
}

//Login and SignUp button
class SignInSignUpButton extends StatelessWidget {
  const SignInSignUpButton({super.key, required this.buttonText, required this.onPressed});

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