import 'package:flutter/material.dart';

//Theme colors and font family
const kBlueThemeColor = Color(0xFF2596BE);
const kPinkThemeColor = Color(0xFFEC22CC);
const kWhiteThemeColor = Color(0xFFFFFFFF);
const kGreyThemeColor = Color(0xFF7E7474);
const kGreyThemeColor02 = Color(0xFFD9D9D9);
const kBlackThemeColor = Color(0xFF000000);
const kThemeFontFamily = "Inter";

///STYLES FOR TEXTS
///Text styles for small grey color texts (Descriptions)
const kSmallTextStyle = TextStyle(
  fontFamily: kThemeFontFamily,
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: kGreyThemeColor,
);

///Text styles for large black color texts (Topics)
const kLargeTextStyle = TextStyle(
  fontFamily: kThemeFontFamily,
  fontSize: 28,
  fontWeight: FontWeight.w900,
  color: kBlackThemeColor,
);

///Text styles for welcome screen's large text
const kWelcomeTextStyle = TextStyle(
  fontFamily: kThemeFontFamily,
  fontSize: 28,
  fontWeight: FontWeight.w900,
  color: kBlackThemeColor,
);

///Text styles for login and signup buttons
const kSignInSignUpButtonTextStyle = TextStyle(
  fontFamily: kThemeFontFamily,
  fontSize: 15,
  fontWeight: FontWeight.w500,
  color: kWhiteThemeColor,
);

///Welcome screen button's text style
const kWelcomeButtonTextStyle = TextStyle(
  fontFamily: kThemeFontFamily,
  fontSize: 20,
  fontWeight: FontWeight.w700,
  color: kWhiteThemeColor,
);

///Text style for next button
const kNextButtonTextStyle = TextStyle(
  fontFamily: kThemeFontFamily,
  fontSize: 24,
  fontWeight: FontWeight.w900,
  color: kWhiteThemeColor,
);

///STYLES FOR BUTTONS
///Rounded corner button style
const kRoundedCornerButtonStyle = ButtonStyle(
  backgroundColor: MaterialStatePropertyAll(kBlueThemeColor),
  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
        bottomRight: Radius.circular(8),
        bottomLeft: Radius.circular(8)),
  )),
);

///Button styles for login and signup buttons
const kSignInSignUpButtonStyle = ButtonStyle(
  fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, 50.0)),
  backgroundColor: MaterialStatePropertyAll(kBlueThemeColor),
  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  )),
);

///Welcome screen button style
const kWelcomeButtonStyle = ButtonStyle(
  fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, 60.0)),
  backgroundColor: MaterialStatePropertyAll(kBlueThemeColor),
  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
        bottomRight: Radius.circular(16),
        bottomLeft: Radius.circular(16)),
  )),
);

///Next button button style
const kNextButtonStyle = ButtonStyle(
  fixedSize: MaterialStatePropertyAll(Size(200.0, 60.0)),
  backgroundColor: MaterialStatePropertyAll(kBlueThemeColor),
  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
        bottomRight: Radius.circular(16),
        bottomLeft: Radius.circular(16)),
  )),
);



///STYLES FOR SLIDERS
///Slider style
const kSliderStyle = SliderThemeData(
  activeTrackColor: kWhiteThemeColor,
  inactiveTrackColor: kBlackThemeColor,
  thumbColor: kWhiteThemeColor,
  overlayColor: Color(0x1FFFFFFF),
  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
);

///STYLES FOR TEXT FIELDS
///Input decorations for signin signup text form fields
const kSignInSignUpTextFormFieldDecorations = InputDecoration(
  hintStyle: TextStyle(
    color: kGreyThemeColor,
    fontFamily: kThemeFontFamily,
    fontSize: 15,
    fontWeight: FontWeight.w500,
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
