import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/app_bar_title.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/components/next_button.dart';
import 'package:smart_personal_coach/components/title_and_description_holder.dart';
import 'package:smart_personal_coach/screens/bottom_navigationbar_screen.dart';

/// Screen to get data on how many days per week the user can dedicate to one workout plan
class WeeklyGoalScreen extends StatefulWidget {
  const WeeklyGoalScreen({super.key});

  @override
  State<WeeklyGoalScreen> createState() => _WeeklyGoalScreenState();
}

class _WeeklyGoalScreenState extends State<WeeklyGoalScreen> {
  /// Declare an int variable to store how many days the user can dedicate to the workout plan
  /// and assign its value to 1
  int _userSelectedDays = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar
      appBar: AppBar(
        centerTitle: true,

        /// Show which screen the user is on
        title: const AppBarTitle(
          screenId: 7,
        ),
      ),

      /// Body of the screen
      body: Padding(
        // Add padding around the body of the screen
        padding: const EdgeInsets.all(kPadding16),
        child: Column(
          children: [
            /// Top of the screen
            /// The title and the description
            const Padding(
              padding: EdgeInsets.only(
                bottom: kPadding8,
              ),
              child: TitleAndDescriptionHolder(
                title: 'Set your weekly goal',
                description:
                    'How many days per week can you dedicate to one workout plan?',
              ),
            ),

            /// Middle of the screen
            /// Week days buttons holder
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                primary: false,
                shrinkWrap: true,
                children: [
                  /// Add space
                  const SizedBox(height: 12.0),

                  /// 1 day a week button
                  DayButton(
                    onPressed: () {
                      setState(() {
                        _userSelectedDays = 1;
                      });
                      print(_userSelectedDays);
                    },
                    userSelectedDays: _userSelectedDays,
                    selectedDays: 1,
                    title: '1 Day',
                    description: 'Dedicate 1 day a week',
                  ),

                  /// Add space between buttons
                  const SizedBox(height: 10.0),

                  /// 2 days a week button
                  DayButton(
                    onPressed: () {
                      setState(() {
                        _userSelectedDays = 2;
                      });
                      print(_userSelectedDays);
                    },
                    userSelectedDays: _userSelectedDays,
                    selectedDays: 2,
                    title: '2 Days',
                    description: 'Dedicate 2 days a week',
                  ),

                  /// Add space between buttons
                  const SizedBox(height: 10.0),

                  /// 3 days a week button
                  DayButton(
                    onPressed: () {
                      setState(() {
                        _userSelectedDays = 3;
                      });
                      print(_userSelectedDays);
                    },
                    userSelectedDays: _userSelectedDays,
                    selectedDays: 3,
                    title: '3 Days',
                    description: 'Dedicate 3 days a week',
                  ),

                  /// Add space between buttons
                  const SizedBox(height: 10.0),

                  /// 4 days a week button
                  DayButton(
                    onPressed: () {
                      setState(() {
                        _userSelectedDays = 4;
                      });
                      print(_userSelectedDays);
                    },
                    userSelectedDays: _userSelectedDays,
                    selectedDays: 4,
                    title: '4 Days',
                    description: 'Dedicate 4 days a week',
                  ),

                  /// Add space between buttons
                  const SizedBox(height: 10.0),

                  /// 5 days a week button
                  DayButton(
                    onPressed: () {
                      setState(() {
                        _userSelectedDays = 5;
                      });
                      print(_userSelectedDays);
                    },
                    userSelectedDays: _userSelectedDays,
                    selectedDays: 5,
                    title: '5 Days',
                    description: 'Dedicate 5 days a week',
                  ),

                  /// Add space between buttons
                  const SizedBox(height: 10.0),

                  /// 6 days a week button
                  DayButton(
                    onPressed: () {
                      setState(() {
                        _userSelectedDays = 6;
                      });
                      print(_userSelectedDays);
                    },
                    userSelectedDays: _userSelectedDays,
                    selectedDays: 6,
                    title: '6 Days',
                    description: 'Dedicate 6 days a week',
                  ),

                  /// Add space between buttons
                  const SizedBox(height: 10.0),

                  /// 7 days a week button
                  DayButton(
                    onPressed: () {
                      setState(() {
                        _userSelectedDays = 7;
                      });
                      print(_userSelectedDays);
                    },
                    userSelectedDays: _userSelectedDays,
                    selectedDays: 7,
                    title: '7 Days',
                    description: 'Dedicate 7 days a week',
                  ),

                  /// Add space
                  const SizedBox(height: 12.0),
                ],
              ),
            ),

            /// Bottom of the screen
            /// Next button
            Padding(
              padding: const EdgeInsets.only(
                top: kPadding8,
              ),
              child: NextButton(
                onPressed: () {
                  // When the button is clicked, navigate to the home page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainScreenScreen(),
                    ),
                  );
                },
                style: kNextButtonStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Button to select how many days the user can dedicate to the workout plan
class DayButton extends StatelessWidget {
  const DayButton({
    super.key,
    required this.userSelectedDays,
    required this.selectedDays,
    required this.onPressed,
    required this.title,
    required this.description,
  });

  final int userSelectedDays;
  final int selectedDays;
  final String title;
  final String description;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: kDayButtonStyle.copyWith(
        backgroundColor: userSelectedDays == selectedDays
            ? const MaterialStatePropertyAll(kBlueThemeColor)
            : const MaterialStatePropertyAll(kWhiteThemeColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: kDayButtonTextStyle.copyWith(
              color: userSelectedDays == selectedDays
                  ? kWhiteThemeColor
                  : kBlueThemeColor,
            ),
          ),
          Text(
            description,
            style: kDayButtonTextStyle.copyWith(
              color: userSelectedDays == selectedDays
                  ? kGreyThemeColor02
                  : kGreyThemeColor,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
