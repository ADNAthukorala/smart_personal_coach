import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';

//Text field for getting user inputs
class ModifiedTextFormField extends StatelessWidget {
  const ModifiedTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: kTextFieldInputDecoration.copyWith(
          hintText: 'Email',
          prefixIcon: const Icon(
            Icons.email_outlined,
            color: kGreyThemeColor,
          )),
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