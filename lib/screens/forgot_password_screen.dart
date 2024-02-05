import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  /// Create text controller and use them to retrieve
  /// the current values of the email text box
  final _emailController = TextEditingController();

  /// Create a global key that uniquely identifies the Form widget
  /// and allows validation of the form.
  final _formKeyResetPassword = GlobalKey<FormState>();

  /// Password reset method
  Future _passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
      if (!context.mounted) return;
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: kBlueThemeColor,
            titleTextStyle: const TextStyle(
              color: kWhiteThemeColor,
              fontSize: 20.0,
            ),
            contentTextStyle: const TextStyle(color: kWhiteThemeColor),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(kRadius16),
              ),
            ),
            title: const Text('Email sent'),
            content: const Text(
                'Password reset link sent! Check your email'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Ok',
                  style: TextStyle(color: kWhiteThemeColor),
                ),
              ),
            ],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: kBlueThemeColor,
            titleTextStyle: const TextStyle(
              color: kWhiteThemeColor,
              fontSize: 20.0,
            ),
            contentTextStyle: const TextStyle(color: kWhiteThemeColor),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(kRadius16),
              ),
            ),
            title: const Text('Error'),
            content: Text(e.message.toString()),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Ok',
                  style: TextStyle(color: kWhiteThemeColor),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  /// Validator for email
  String? _validateEmail(String? value) {
    // Is the text field empty?
    if (value == null || value.isEmpty) {
      return 'Enter the email';
    }
    // Is it a valid email?
    else if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Appbar of the screen
      appBar: AppBar(
        title: const Text(
          'Reset Password',
          style: kAppBarTextStyle,
        ),
      ),

      /// Body of the screen
      body: Padding(
        // Add padding around the body
        padding: const EdgeInsets.only(
          left: kPadding16,
          right: kPadding16,
          bottom: kPadding16,
        ),
        child: Form(
          key: _formKeyResetPassword,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Title
              const Text(
                'Enter your email and we will send you a password reset link',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              /// Add space
              const SizedBox(height: 12.0),

              /// Get the user's email
              TextFormField(
                validator: _validateEmail,
                controller: _emailController,
                decoration: kSignInSignUpTextFormFieldDecorations.copyWith(
                  hintText: 'Email',
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: kGreyThemeColor,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),

              /// Add space
              const SizedBox(height: 12.0),

              /// Reset password button
              ElevatedButton(
                onPressed: () async {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKeyResetPassword.currentState!.validate()) {
                    _passwordReset();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBlueThemeColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(kRadius16),
                    ),
                  ),
                ),
                child: const Text(
                  'Reset Password',
                  style: TextStyle(
                    color: kWhiteThemeColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}