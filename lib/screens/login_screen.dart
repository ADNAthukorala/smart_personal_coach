import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
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
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Sign In',
                    style: const TextStyle(
                      fontFamily: "Inter",
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff000000),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Please enter email and password for login',
                    style: const TextStyle(
                      fontFamily: "Inter",
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff7e7474),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 22.0,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Color(0xFF7E7474),
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Color(0xFF7E7474),
                        fontFamily: "Inter",
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color(0xFFD9D9D9),
                      contentPadding: EdgeInsets.only(
                          left: 8.0, top: 12.0, right: 8.0, bottom: 12.0),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Color(0xFF7E7474),
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Color(0xFF7E7474),
                        fontFamily: "Inter",
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color(0xFFD9D9D9),
                      contentPadding: EdgeInsets.only(
                          left: 8.0, top: 12.0, right: 8.0, bottom: 12.0),
                    ),
                  ),
                  SizedBox(height: 9.0),
                  Container(
                    child: Text('Hi'),
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
