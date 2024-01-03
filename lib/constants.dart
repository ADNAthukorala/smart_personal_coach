import 'package:flutter/material.dart';

//Theme colors
const kBlueThemeColor = Color(0xFF2596BE);
const kWhiteThemeColor = Color(0xFFFFFFFF);
const kGreyThemeColor = Color(0xFF7E7474);
const kGreyThemeColor02 = Color(0xFFD9D9D9);
const kBlackThemeColor = Color(0xFF000000);
const kThemeFontFamily = "Inter";

//Global constants
const kTextFieldInputDecoration = InputDecoration(
  hintText: 'Hint Text',
  hintStyle: TextStyle(
    color: kGreyThemeColor,
    fontFamily: kThemeFontFamily,
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
  fillColor: kGreyThemeColor02,
  contentPadding: EdgeInsets.only(
      left: 8.0, top: 12.0, right: 8.0, bottom: 12.0),
);

const kSmallTextStyle = TextStyle(
  fontFamily: kThemeFontFamily,
  fontSize: 14,
  fontWeight: FontWeight.w700,
  color: kGreyThemeColor,
);

//Button styles for login and signup buttons
const kSignInSignUpButtonStyle = ButtonStyle(
  fixedSize: MaterialStatePropertyAll(
      Size(double.maxFinite, 50.0)),
  backgroundColor:
  MaterialStatePropertyAll(kBlueThemeColor),
  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  )),
);

//Text styles for login and signup buttons
const kSignInSignUpButtonTextStyle = TextStyle(
  fontFamily: kThemeFontFamily,
  fontSize: 15,
  fontWeight: FontWeight.w700,
  color: kWhiteThemeColor,
);


//Welcome screen
const kImageContainerDecoration = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('images/welcome_screen_image.jpg'),
    fit: BoxFit.fill,
  ),
  borderRadius: BorderRadius.only(
    bottomRight: Radius.circular(50.0),
  ),
);

const kWelcomeTextStyle = TextStyle(
  fontFamily: "Inter",
  fontSize: 28,
  fontWeight: FontWeight.w700,
  color: kBlackThemeColor,
);

const kWelcomeMessageTextStyle = TextStyle(
  fontFamily: "Inter",
  fontSize: 14,
  fontWeight: FontWeight.w700,
  color: kGreyThemeColor,
);

const kWelcomeButtonStyle = ButtonStyle(
  fixedSize: MaterialStatePropertyAll(Size(200, 70)),
  backgroundColor: MaterialStatePropertyAll(kBlueThemeColor),
  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(8),
        bottomRight: Radius.circular(16),
        bottomLeft: Radius.circular(8)),
  )),
);

const kWelcomeButtonTextStyle = TextStyle(
  fontFamily: "Inter",
  fontSize: 20,
  fontWeight: FontWeight.w700,
  color: kWhiteThemeColor,
);

//Login screen
const kSignInTextStyle = TextStyle(
  fontFamily: "Inter",
  fontSize: 28,
  fontWeight: FontWeight.w700,
  color: Color(0xff000000),
);

const kSignInMessageTextStyle = TextStyle(
  fontFamily: "Inter",
  fontSize: 14,
  fontWeight: FontWeight.w700,
  color: Color(0xff7e7474),
);
