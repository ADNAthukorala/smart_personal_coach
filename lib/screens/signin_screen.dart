import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';
import 'package:smart_personal_coach/components/signin_signup_button.dart';
import 'package:smart_personal_coach/components/title_and_description_holder.dart';
import 'package:smart_personal_coach/components/top_image.dart';
import 'package:smart_personal_coach/components/social_media_buttons_container.dart';
import 'package:smart_personal_coach/screens/forgot_password_screen.dart';
import 'package:smart_personal_coach/screens/getting_data_screens/gender_selection_screen.dart';
import 'package:smart_personal_coach/screens/signup_screen.dart';

/// Sign-In Screen
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  /// Create text controllers and use them to retrieve
  /// the current values of the email, password and confirm password text boxes
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  /// Declare variables to store email, password, confirm password
  late String _email;
  late String _password;

  /// Create a global key that uniquely identifies the Form widget
  /// and allows validation of the form.
  final _formKeySignIn = GlobalKey<FormState>();

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

  /// Validator for password
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter the password';
    }
    // Password length greater than 6
    else if (value.length < 6) {
      return 'Password must be longer than 6 characters';
    }
    // Contains at least one uppercase letter
    else if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Uppercase letter is missing';
    }
    // Contains at least one lowercase letter
    else if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Lowercase letter is missing';
    }
    // Contains at least one digit
    else if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Digit is missing';
    }
    // Contains at least one special character
    else if (!value.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
      return 'Special character is missing';
    }
    // If there are no error messages, the password is valid
    return null;
  }

  /// To check whether visibility button is clicked or not.
  bool _isVisibilityButtonClicked = false;

  /// Visibility button click function
  void visibilityButtonClick() {
    if (_isVisibilityButtonClicked == false) {
      _isVisibilityButtonClicked = true;
    } else {
      _isVisibilityButtonClicked = false;
    }
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Body of the screen
      body: Column(
        children: [
          /// Top of the screen (Top image)
          MediaQuery.of(context).viewInsets.bottom == 0
              ? const Expanded(
                  flex: 2,
                  child: TopImage(imageUrl: 'images/signin_screen_image.jpg'),
                )
              : const SizedBox(),

          /// Bottom components holder (Middle and bottom of the screen)
          Expanded(
            flex: MediaQuery.of(context).size.height > 800 ? 4 : 6,
            // Add padding around the bottom components
            child: Padding(
              padding: const EdgeInsets.only(
                left: kPadding16,
                right: kPadding16,
                bottom: kPadding16,
              ),
              // Adding all the components at the bottom to a column
              child: Column(
                mainAxisAlignment: MediaQuery.of(context).viewInsets.bottom == 0
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                children: [
                  /// Middle of the screen (Title ans user input fields)
                  /// User inputs container and title and description container
                  Form(
                    key: _formKeySignIn,
                    child: Column(
                      children: [
                        /// The Title and the description holder
                        const TitleAndDescriptionHolder(
                          title: 'Sign In',
                          description:
                              'Please enter email and password for login',
                        ),

                        /// Add space
                        const SizedBox(height: 12.0),

                        /// Get the user's email
                        TextFormField(
                          validator: _validateEmail,
                          controller: _emailController,
                          onChanged: (value) {
                            _email = _emailController.text;
                          },
                          decoration:
                              kSignInSignUpTextFormFieldDecorations.copyWith(
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

                        /// Get the user's password
                        TextFormField(
                          validator: _validatePassword,
                          controller: _passwordController,
                          onChanged: (value) {
                            _password = _passwordController.text;
                          },
                          decoration:
                              kSignInSignUpTextFormFieldDecorations.copyWith(
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
                              icon: _isVisibilityButtonClicked
                                  ? const Icon(Icons.visibility_outlined)
                                  : const Icon(Icons.visibility_off_outlined),
                            ),
                          ),
                          obscureText:
                              _isVisibilityButtonClicked ? false : true,
                          enableSuggestions: false,
                          autofocus: false,
                        ),

                        /// Add space
                        const SizedBox(height: 12.0),

                        /// Forget password button
                        Container(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Go to the forgot password screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                  const ForgotPasswordScreen(),
                                ),
                              );
                            },
                            style: kTextButtonStyle,
                            child: const Text(
                              'Forgot Password?',
                              style: kTextButtonTextStyle,
                            ),
                          ),
                        ),

                        /// Add space
                        const SizedBox(height: 12.0),

                        /// Sign in button
                        SignInSignUpButton(
                          onPressed: () async {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKeySignIn.currentState!.validate()) {
                              try {
                                // Sign in a user with an email address and password
                                final credential = await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                  email: _email,
                                  password: _password,
                                );
                                _passwordController.clear();
                                if (!context.mounted) return;
                                // Go to the gender selection screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const GenderSelectionScreen(),
                                  ),
                                );
                                // Show snack bar with 'Signed in' message
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Signed in!')),
                                );
                              } on FirebaseAuthException catch (e) {
                                // Show snack bar with error message
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Wrong email or password. Check again and re-enter!')),
                                );
                              } catch (e) {
                                print(e);
                              }
                            }
                          },
                          buttonText: 'Sign In',
                        ),
                      ],
                    ),
                  ),

                  /// Bottom of the screen (Sign-up button, social media buttons)
                  MediaQuery.of(context).viewInsets.bottom == 0
                      ? Column(
                          children: [
                            /// Social media buttons container
                            SocialMediaButtonsContainer(
                              onPressedGoogle: () {},
                              onPressedFacebook: () {},
                            ),

                            /// Add space
                            const SizedBox(
                              height: 12.0,
                            ),

                            /// Sign up text button container
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don’t have an account?",
                                  style: kSmallGreyColorDescriptionTextStyle,
                                ),

                                /// Sign up text button
                                TextButton(
                                  onPressed: () {
                                    // Navigate to the sign-up screen
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpScreen(),
                                      ),
                                    );
                                  },
                                  style: kTextButtonStyle,
                                  child: const Text(
                                    'Sign Up',
                                    style: kTextButtonTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
