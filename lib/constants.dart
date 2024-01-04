import 'package:flutter/material.dart';

//Theme colors and font family
const kBlueThemeColor = Color(0xFF2596BE);
const kWhiteThemeColor = Color(0xFFFFFFFF);
const kGreyThemeColor = Color(0xFF7E7474);
const kGreyThemeColor02 = Color(0xFFD9D9D9);
const kBlackThemeColor = Color(0xFF000000);
const kThemeFontFamily = "Inter";

//Input decorations for signin signup text form fields
const kSignInSignUpTextFormFieldDecorations = InputDecoration(
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
  contentPadding:
      EdgeInsets.only(left: 8.0, top: 12.0, right: 8.0, bottom: 12.0),
);

//Text styles for small grey color texts
const kSmallTextStyle = TextStyle(
  fontFamily: kThemeFontFamily,
  fontSize: 14,
  fontWeight: FontWeight.w700,
  color: kGreyThemeColor,
);

//Text styles for large black color texts (Topics)
const kLargeTextStyle = TextStyle(
  fontFamily: kThemeFontFamily,
  fontSize: 28,
  fontWeight: FontWeight.w700,
  color: kBlackThemeColor,
);

//Text styles for welcome screen's large text
const kWelcomeTextStyle = TextStyle(
  fontFamily: kThemeFontFamily,
  fontSize: 28,
  fontWeight: FontWeight.w700,
  color: kBlackThemeColor,
);

//Button styles for login and signup buttons
const kSignInSignUpButtonStyle = ButtonStyle(
  fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, 50.0)),
  backgroundColor: MaterialStatePropertyAll(kBlueThemeColor),
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

//Welcome screen button style
const kWelcomeButtonStyle = ButtonStyle(
  fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, 60.0)),
  backgroundColor: MaterialStatePropertyAll(kBlueThemeColor),
  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(8),
        bottomRight: Radius.circular(16),
        bottomLeft: Radius.circular(8)),
  )),
);

//Welcome screen button's text style
const kWelcomeButtonTextStyle = TextStyle(
  fontFamily: kThemeFontFamily,
  fontSize: 20,
  fontWeight: FontWeight.w700,
  color: kWhiteThemeColor,
);

