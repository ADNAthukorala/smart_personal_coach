import 'package:flutter/material.dart';

//Theme colors and font family
const kBlueThemeColor = Color(0xFF2596BE);
const kPinkThemeColor = Color(0xFFEC22CC);
const kWhiteThemeColor = Color(0xFFFFFFFF);
const kGreyThemeColor = Color(0xFF7E7474);
const kGreyThemeColor02 = Color(0xFFD9D9D9);
const kBlackThemeColor = Color(0xFF000000);
const kRadius16 = 16.0;
const kRadius8 = 8.0;
const kPadding16 = 16.0;
const kPadding8 = 8.0;
const kAppBarRoundedIconSize = 15.0;
const kAppBarActiveRoundedIconSize = 15.0;
const kAppBarSizedBoxWidth = 60.0;

/// STYLES FOR TEXTS
/// Text styles for small grey color texts (Descriptions)
const kSmallGreyColorDescriptionTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: kGreyThemeColor,
);

/// Text styles for large black color texts (Titles)
const kLargeBlackTitleTextStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.w900,
  color: kBlackThemeColor,
);

/// Text styles for welcome screen's large text
const kWelcomeTextStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.w900,
  color: kBlueThemeColor,
);

/// Text styles for login and signup buttons
const kSignInSignUpButtonTextStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w500,
  color: kWhiteThemeColor,
);

/// Text styles for welcome screen button
const kWelcomeButtonTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w700,
  color: kWhiteThemeColor,
);

/// Text style for next button
const kNextButtonTextStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w900,
  color: kWhiteThemeColor,
);

/// Text styles for select body area button
const kSelectBodyAreaButtonTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w900,
  color: kBlueThemeColor,
);

/// Text styles for select volume button
const kSelectVolumeButtonTextStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.w900,
  color: kBlueThemeColor,
);



/// STYLES FOR BUTTONS
/// Button styles for gender selection buttons
const kGenderSelectionButtonStyle = ButtonStyle(
  backgroundColor: MaterialStatePropertyAll(kBlueThemeColor),
  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(kRadius16),
        topRight: Radius.circular(kRadius16),
        bottomRight: Radius.circular(kRadius16),
        bottomLeft: Radius.circular(kRadius16)),
  )),
  fixedSize: MaterialStatePropertyAll(Size(150.0, 70.0)),
);

/// Button styles for login and signup buttons
const kSignInSignUpButtonStyle = ButtonStyle(
  fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, 50.0)),
  backgroundColor: MaterialStatePropertyAll(kBlueThemeColor),
  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(kRadius16)),
  )),
);

/// Button style for welcome screen button
const kWelcomeButtonStyle = ButtonStyle(
  fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, 60.0)),
  backgroundColor: MaterialStatePropertyAll(kBlueThemeColor),
  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(kRadius16),
        topRight: Radius.circular(kRadius16),
        bottomRight: Radius.circular(kRadius16),
        bottomLeft: Radius.circular(kRadius16)),
  )),
);

/// Button styles for next button
const kNextButtonStyle = ButtonStyle(
  fixedSize: MaterialStatePropertyAll(Size(200.0, 60.0)),
  backgroundColor: MaterialStatePropertyAll(kBlueThemeColor),
  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(kRadius16),
        topRight: Radius.circular(kRadius16),
        bottomRight: Radius.circular(kRadius16),
        bottomLeft: Radius.circular(kRadius16)),
  )),
);

/// Button styles for select body area button
const kSelectBodyAreaButtonStyle = ButtonStyle(
  fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, 40.0)),
  backgroundColor: MaterialStatePropertyAll(kWhiteThemeColor),
  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(kRadius16),
        topRight: Radius.circular(kRadius16),
        bottomRight: Radius.circular(kRadius16),
        bottomLeft: Radius.circular(kRadius16)),
  )),
);

/// Button styles for select volume button
const kSelectVolumeButtonStyle = ButtonStyle(
  fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, 100.0)),
  backgroundColor: MaterialStatePropertyAll(kWhiteThemeColor),
  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(kRadius16),
        topRight: Radius.circular(kRadius16),
        bottomRight: Radius.circular(kRadius16),
        bottomLeft: Radius.circular(kRadius16)),
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
    fontSize: 15,
    fontWeight: FontWeight.w500,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(kRadius16),
    ),
    borderSide: BorderSide.none,
  ),
  filled: true,
  fillColor: kGreyThemeColor02,
  contentPadding:
      EdgeInsets.only(left: 8.0, top: 12.0, right: 8.0, bottom: 12.0),
);
