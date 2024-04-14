import 'package:flutter/material.dart';

/// Theme colors and font family
const kBlueThemeColor = Color(0xFF006685);
const kPinkThemeColor = Color(0xFFBA1E8B);
const kRedThemeColor = Color(0xFFDD3300);
const kWhiteThemeColor = Color(0xFFFFFFFF);
const kGreyThemeColor = Color(0xFF757575);
const kGreyThemeColor02 = Color(0xFFD9D9D9);
const kBlackThemeColor = Color(0xFF000000);

/// BMI scale colors
const kBMIBlueThemeColor = Color(0xFF06D3B5);
const kBMIGreenThemeColor = Color(0xFF27B707);
const kBMIYellowThemeColor = Color(0xFFFCB004);
const kBMIOrangeThemeColor = Color(0xFFFA6707);
const kBMIRedThemeColor = Color(0xFFFF1700);

/// Main theme color
const kAppThemeColor = kBlueThemeColor;

/// Black text colorize colors
const kBlackTextColorizeColors = [
  kBlackThemeColor,
  kAppThemeColor,
  kWhiteThemeColor,
  kBlackThemeColor,
];

/// Grey text colorize colors
const kGreyTextColorizeColors = [
  kGreyThemeColor,
  kAppThemeColor,
  kWhiteThemeColor,
  kGreyThemeColor,
];

///
const kRadius8 = 8.0;
const kRadius16 = 16.0;
const kRadius30 = 30.0;
const kPadding8 = 8.0;
const kPadding16 = 16.0;
const kAppBarRoundedIconSize = 15.0;
const kAppBarActiveRoundedIconSize = 15.0;
const kAppBarSizedBoxWidth = 105.0;

/// STYLES FOR TEXTS
/// Text styles for small grey color texts (Descriptions)
const kSmallGreyColorDescriptionTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: kGreyThemeColor,
);

/// Text styles for exercise card title
const kExerciseCardTitleTextStyle = TextStyle(
  color: kAppThemeColor,
  fontSize: 28.0,
  fontWeight: FontWeight.w900,
);

/// Text styles for exercise card subtitle
const kExerciseCardSubtitleTextStyle = TextStyle(
  color: kAppThemeColor,
  fontSize: 22.0,
  fontWeight: FontWeight.w700,
);

/// Text styles for exercise card step title
const kExerciseCardStepTextStyle = TextStyle(
  color: kGreyThemeColor,
  fontSize: 17.0,
  fontWeight: FontWeight.w600,
);

/// Text styles for exercise card step description
const kExerciseCardDescriptionTextStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
);

/// Text style for text button
const kTextButtonTextStyle = TextStyle(
  fontSize: 14,
  color: kAppThemeColor,
);

/// Text styles for large black color texts (Titles)
const kLargeBlackTitleTextStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.w700,
  color: kBlackThemeColor,
);

/// Text style for terms and conditions titles
const kTermsAndConditionsTitlesTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w700,
  color: kAppThemeColor,
);

/// Text style for terms and conditions descriptions
const kTermsAndConditionsDescriptionsTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: kGreyThemeColor,
);

/// Text styles for welcome screen's large text
const kWelcomeTextStyle = TextStyle(
  height: 1.15,
  fontSize: 36,
  fontWeight: FontWeight.bold,
  color: kBlackThemeColor,
);

/// Text styles for signin, signup, sign out and reset password  buttons
const kSignInSignUpSignOutButtonResetPasswordTextStyle = TextStyle(
  fontSize: 14,
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
  fontWeight: FontWeight.w700,
  color: kWhiteThemeColor,
);

/// Text styles for select body area button
const kSelectBodyAreaButtonTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w700,
  color: kAppThemeColor,
);

/// Text styles for select capacity button
const kSelectCapacityButtonTextStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
  color: kAppThemeColor,
);

/// Text styles for day button
const kDayButtonTextStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
  color: kAppThemeColor,
);

/// Text styles for explore screen buttons
const kExploreScreenButtonTextStyle = TextStyle(
  fontSize: 36,
  fontWeight: FontWeight.w900,
  color: kWhiteThemeColor,
);

/// Text style for main screens app bar
const kAppBarTextStyle = TextStyle(
  color: kWhiteThemeColor,
  fontWeight: FontWeight.w700,
);

/// Text style for profile titles
const kProfileTitleTextStyle = TextStyle(
  color: kBlackThemeColor,
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

/// Text style for exercises list tile
const kExercisesListTileTextStyle = TextStyle(
  color: kWhiteThemeColor,
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

/// Text style for user report titles
const kUserReportTitleTextStyle = TextStyle(
  color: kBlackThemeColor,
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

/// Text style for user report information
const kUserReportInformationTitleTextStyle = TextStyle(
  color: kBlackThemeColor,
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

/// STYLES FOR BUTTONS
/// Button styles for gender selection buttons
const kGenderSelectionButtonStyle = ButtonStyle(
  backgroundColor: MaterialStatePropertyAll(kAppThemeColor),
  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(kRadius16)),
  )),
  fixedSize: MaterialStatePropertyAll(Size(160.0, 75.0)),
);

/// Button styles for signin, signup, sign out and reset password buttons
const kSignInSignUpSignOutResetPasswordButtonStyle = ButtonStyle(
  fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, 50.0)),
  backgroundColor: MaterialStatePropertyAll(kAppThemeColor),
);

/// Button style for welcome screen button
const kWelcomeButtonStyle = ButtonStyle(
  fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, 60.0)),
  backgroundColor: MaterialStatePropertyAll(kAppThemeColor),
);

/// Button styles for next button
const kNextButtonStyle = ButtonStyle(
  fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, 60.0)),
  backgroundColor: MaterialStatePropertyAll(kAppThemeColor),
);

/// Button style for social media icon button
const kSocialMediaIconButtonStyle = ButtonStyle(
  fixedSize: MaterialStatePropertyAll(Size.fromWidth(double.maxFinite)),
  side: MaterialStatePropertyAll(BorderSide(color: kGreyThemeColor02)),
);

/// Button styles for select body area button
const kSelectBodyAreaButtonStyle = ButtonStyle(
  fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, 40.0)),
  backgroundColor: MaterialStatePropertyAll(kWhiteThemeColor),
  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(kRadius16)),
  )),
);

/// Button styles for select capacity button
const kSelectCapacityButtonStyle = ButtonStyle(
  alignment: Alignment.centerLeft,
  fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, 120.0)),
  backgroundColor: MaterialStatePropertyAll(kWhiteThemeColor),
  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(kRadius16)),
  )),
);

/// Button styles for day button
const kDayButtonStyle = ButtonStyle(
  alignment: Alignment.centerLeft,
  fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, 70.0)),
  backgroundColor: MaterialStatePropertyAll(kWhiteThemeColor),
  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(kRadius16)),
  )),
);

/// Button style for signin/signup/forget password text button
const kTextButtonStyle = ButtonStyle(
  minimumSize: MaterialStatePropertyAll(Size.zero),
  padding: MaterialStatePropertyAll(
    EdgeInsets.only(
      left: 4.0,
      right: 4.0,
    ),
  ),
  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
);

/// Button styles for explore screen buttons
const kExploreScreenButton = ButtonStyle(
  fixedSize: MaterialStatePropertyAll(Size.fromHeight(150.0)),
  padding: MaterialStatePropertyAll(EdgeInsets.zero),
  backgroundColor: MaterialStatePropertyAll(kAppThemeColor),
  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(kRadius16)),
  )),
);

///STYLES FOR SLIDERS
/// Slider style
const kSliderStyle = SliderThemeData(
  activeTrackColor: kWhiteThemeColor,
  inactiveTrackColor: kBlackThemeColor,
  thumbColor: kWhiteThemeColor,
  overlayColor: Color(0x1FFFFFFF),
  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
);

/// BMI slider style
const kBMISliderStyle = SliderThemeData(
  activeTrackColor: kBMIGreenThemeColor,
  inactiveTrackColor: kGreyThemeColor02,
  thumbColor: Colors.transparent,
  overlayColor: Colors.transparent,
  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0),
  overlayShape: RoundSliderOverlayShape(overlayRadius: 16.0),
  trackHeight: 20.0,
  allowedInteraction: SliderInteraction.slideThumb,
);

///STYLES FOR TEXT FIELDS
///Input decorations for signin signup text form fields
const kSignInSignUpTextFormFieldDecorations = InputDecoration(
  hintStyle: kSmallGreyColorDescriptionTextStyle,
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(kRadius16),
    ),
    borderSide: BorderSide(color: kAppThemeColor, width: 2),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(kRadius16),
    ),
  ),
  contentPadding: EdgeInsets.zero,
);

///Input decorations for change main goal, level, weekly goal and focused body areas text form fields
const kMlwfTextFormFieldDecorations = InputDecoration(
  hintText: "Enter your email",
  hintStyle: TextStyle(color: kWhiteThemeColor),
  border: UnderlineInputBorder(borderSide: BorderSide(color: kWhiteThemeColor)),
  focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: kWhiteThemeColor, width: 2.0)),
  enabledBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: kWhiteThemeColor)),
);

///Input decorations for community message text form field
const kCommunityMessageTextFormFieldDecoration = InputDecoration(
  hintText: "Type your message here...",
  hintStyle: TextStyle(
    color: kGreyThemeColor,
  ),
  contentPadding:
      EdgeInsets.symmetric(vertical: kPadding16, horizontal: kPadding16),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(kRadius30),
    ),
    borderSide: BorderSide(color: kAppThemeColor, width: 2),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(kRadius30),
    ),
  ),
);
