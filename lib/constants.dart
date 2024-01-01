import 'package:flutter/material.dart';

//Theme colors
const kBlueThemeColor = Color(0xFF2596BE);
const kWhiteThemeColor = Color(0xFFFFFFFF);
const kGrayThemeColor = Color(0xFF7E7474);
const kBlackThemeColor = Color(0xFF000000);

//Global constants



//Defined screen constants
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
  color: kGrayThemeColor,
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
