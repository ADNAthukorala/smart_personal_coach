import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/components/next_button.dart';
import 'package:smart_personal_coach/components/title_and_description_holder.dart';

/// Screen to get data on how many days per week the user can dedicate to one workout plan
class WeeklyGoalScreen extends StatefulWidget {
  const WeeklyGoalScreen({super.key});

  @override
  State<WeeklyGoalScreen> createState() => _WeeklyGoalScreenState();
}

class _WeeklyGoalScreenState extends State<WeeklyGoalScreen> {
  /// Declare an int variable to store how many days the user can dedicate to the workout plan
  /// and assign its value to 1
  int daysDedicatedToWorkoutPlan = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar
      appBar: AppBar(
          centerTitle: true,
          title: const SizedBox(
            width: kAppBarSizedBoxWidth,
            child: Row(
              children: [
                Icon(
                  Icons.circle,
                  size: kAppBarRoundedIconSize,
                  color: kGreyThemeColor02,
                ),
                Icon(
                  Icons.circle,
                  size: kAppBarRoundedIconSize,
                  color: kGreyThemeColor02,
                ),
                Icon(
                  Icons.circle,
                  size: kAppBarRoundedIconSize,
                  color: kGreyThemeColor02,
                ),
                Icon(
                  Icons.circle,
                  size: kAppBarRoundedIconSize,
                  color: kGreyThemeColor02,
                ),
                Icon(
                  Icons.circle,
                  size: kAppBarRoundedIconSize,
                  color: kGreyThemeColor02,
                ),
                Icon(
                  Icons.circle,
                  size: kAppBarActiveRoundedIconSize,
                  color: kBlueThemeColor,
                ),
              ],
            ),
          )),

      /// Body of the screen
      body: Padding(
        padding: EdgeInsets.all(kPadding16),
        child: Column(
          children: [
            const TitleAndDescriptionHolder(
              title: 'Set your weekly goal',
              description:
                  'How many days per week the user can dedicate to one workout plan',
            ),
            const Spacer(),
            Column(
              children: [
                DayButton(
                  onPressed: () {
                    setState(() {
                      daysDedicatedToWorkoutPlan = 1;
                    });
                    print(daysDedicatedToWorkoutPlan);
                  },
                  daysDedicatedToWorkoutPlan: daysDedicatedToWorkoutPlan,
                  selectedDays: 1,
                  title: '1 Day',
                  description: 'Dedicate 1 day a week',
                ),
                const SizedBox(height: 8.0),
                DayButton(
                  onPressed: () {
                    setState(() {
                      daysDedicatedToWorkoutPlan = 2;
                    });
                    print(daysDedicatedToWorkoutPlan);
                  },
                  daysDedicatedToWorkoutPlan: daysDedicatedToWorkoutPlan,
                  selectedDays: 2,
                  title: '2 Days',
                  description: 'Dedicate 2 days a week',
                ),
                const SizedBox(height: 10.0),
                DayButton(
                  onPressed: () {
                    setState(() {
                      daysDedicatedToWorkoutPlan = 3;
                    });
                    print(daysDedicatedToWorkoutPlan);
                  },
                  daysDedicatedToWorkoutPlan: daysDedicatedToWorkoutPlan,
                  selectedDays: 3,
                  title: '3 Days',
                  description: 'Dedicate 3 days a week',
                ),
                const SizedBox(height: 10.0),
                DayButton(
                  onPressed: () {
                    setState(() {
                      daysDedicatedToWorkoutPlan = 4;
                    });
                    print(daysDedicatedToWorkoutPlan);
                  },
                  daysDedicatedToWorkoutPlan: daysDedicatedToWorkoutPlan,
                  selectedDays: 4,
                  title: '4 Days',
                  description: 'Dedicate 4 days a week',
                ),
                const SizedBox(height: 10.0),
                DayButton(
                  onPressed: () {
                    setState(() {
                      daysDedicatedToWorkoutPlan = 5;
                    });
                    print(daysDedicatedToWorkoutPlan);
                  },
                  daysDedicatedToWorkoutPlan: daysDedicatedToWorkoutPlan,
                  selectedDays: 5,
                  title: '5 Days',
                  description: 'Dedicate 5 days a week',
                ),
                const SizedBox(height: 10.0),
                DayButton(
                  onPressed: () {
                    setState(() {
                      daysDedicatedToWorkoutPlan = 6;
                    });
                    print(daysDedicatedToWorkoutPlan);
                  },
                  daysDedicatedToWorkoutPlan: daysDedicatedToWorkoutPlan,
                  selectedDays: 6,
                  title: '6 Days',
                  description: 'Dedicate 6 days a week',
                ),
                const SizedBox(height: 10.0),
                DayButton(
                  onPressed: () {
                    setState(() {
                      daysDedicatedToWorkoutPlan = 7;
                    });
                    print(daysDedicatedToWorkoutPlan);
                  },
                  daysDedicatedToWorkoutPlan: daysDedicatedToWorkoutPlan,
                  selectedDays: 7,
                  title: '7 Days',
                  description: 'Dedicate 7 days a week',
                ),
              ],
            ),
            const Spacer(),
            NextButton(
              onPressed: () {},
              style: kNextButtonStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class DayButton extends StatelessWidget {
  const DayButton({
    super.key,
    required this.daysDedicatedToWorkoutPlan,
    required this.selectedDays,
    required this.onPressed,
    required this.title,
    required this.description,
  });

  final int daysDedicatedToWorkoutPlan;
  final int selectedDays;
  final String title;
  final String description;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: kDayButtonStyle.copyWith(
        backgroundColor: daysDedicatedToWorkoutPlan == selectedDays
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
              color: daysDedicatedToWorkoutPlan == selectedDays
                  ? kWhiteThemeColor
                  : kBlueThemeColor,
            ),
          ),
          Text(
            description,
            style: kDayButtonTextStyle.copyWith(
              color: daysDedicatedToWorkoutPlan == selectedDays
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
