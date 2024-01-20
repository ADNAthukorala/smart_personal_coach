import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';

/// Title of the app bar
class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
    required this.screenId,
  });
  // To get which screen the user is on
  final int screenId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kAppBarSizedBoxWidth,
      child: Row(
        children: [
          Icon(
            Icons.circle,
            size: kAppBarActiveRoundedIconSize,
            color: screenId == 1 ? kBlueThemeColor : kGreyThemeColor02,
          ),
          Icon(
            Icons.circle,
            size: kAppBarRoundedIconSize,
            color: screenId == 2 ? kBlueThemeColor : kGreyThemeColor02,
          ),
          Icon(
            Icons.circle,
            size: kAppBarRoundedIconSize,
            color: screenId == 3 ? kBlueThemeColor : kGreyThemeColor02,
          ),
          Icon(
            Icons.circle,
            size: kAppBarRoundedIconSize,
            color: screenId == 4 ? kBlueThemeColor : kGreyThemeColor02,
          ),
          Icon(
            Icons.circle,
            size: kAppBarRoundedIconSize,
            color: screenId == 5 ? kBlueThemeColor : kGreyThemeColor02,
          ),
          Icon(
            Icons.circle,
            size: kAppBarRoundedIconSize,
            color: screenId == 6 ? kBlueThemeColor : kGreyThemeColor02,
          ),
          Icon(
            Icons.circle,
            size: kAppBarRoundedIconSize,
            color: screenId == 7 ? kBlueThemeColor : kGreyThemeColor02,
          ),
        ],
      ),
    );
  }
}
