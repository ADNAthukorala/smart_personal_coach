import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';

//Text field for getting user inputs
class SignInSignUpTextFormField extends StatelessWidget {
  const SignInSignUpTextFormField(
      {super.key, required this.hintText, required this.prefixIcon, this.onPressedEye});

  final String? hintText;
  final IconData? prefixIcon;
  final void Function()? onPressedEye;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: kSignInSignUpTextFormFieldDecorations.copyWith(
        hintText: hintText,
        prefixIcon: Icon(
          prefixIcon,
          color: kGreyThemeColor,
        ),
        suffixIcon: (hintText == 'Password' || hintText == 'Confirm Password')
            ? IconButton(
                onPressed: onPressedEye,
                icon: const Icon(Icons.remove_red_eye_outlined),
              )
            : null,
      ),
      obscureText: (hintText == 'Password' || hintText == 'Confirm Password')
          ? true
          : false,
      enableSuggestions:
          (hintText == 'Password' || hintText == 'Confirm Password')
              ? false
              : true,
      autocorrect: (hintText == 'Password' || hintText == 'Confirm Password')
          ? false
          : true,
    );
  }
}

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
