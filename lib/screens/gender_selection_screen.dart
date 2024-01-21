import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/app_bar_title.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/components/next_button.dart';
import 'package:smart_personal_coach/components/title_and_description_holder.dart';
import 'package:smart_personal_coach/components/top_image.dart';
import 'package:smart_personal_coach/screens/age_height_weight_screen.dart';

/// Create an enum for gender
enum Gender { male, female, notSelected }

/// Screen to get the user's gender
class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({super.key});

  @override
  State<GenderSelectionScreen> createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  /// Variable to store the user's gender
  Gender _userGender = Gender.notSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar
      appBar: AppBar(
        centerTitle: true,

        /// Show which screen the user is on
        title: const AppBarTitle(
          screenId: 1,
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
                title: "What's your gender?",
                description: '',
              ),
            ),

            /// Middle of the screen
            /// The image and the gender selection buttons holder
            Expanded(
              child: Center(
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  // If the viewport's max height is greater than 600, the listview never scrolls, otherwise scrolls
                  physics: MediaQuery.of(context).size.height > 600
                      ? const NeverScrollableScrollPhysics()
                      : const AlwaysScrollableScrollPhysics(),
                  children: [
                    /// Image of gender selection screen
                    const SizedBox(
                      height: 210.0,
                      child: TopImage(
                          imageUrl: 'images/gender_selection_screen_image.jpg'),
                    ),

                    /// Add space between the image and the gender selection buttons holder
                    const SizedBox(height: 10.0),

                    /// Gender selection buttons holder
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        /// Male button
                        _buildMaleButton(),

                        /// Female button
                        _buildFemaleButton(),
                      ],
                    ),

                    /// Add space
                    const SizedBox(height: 12.0),
                  ],
                ),
              ),
            ),

            /// Bottom of the screen
            /// Next button
            Padding(
              padding: const EdgeInsets.only(
                top: kPadding8,
              ),
              child: NextButton(
                onPressed: _userGender == Gender.notSelected
                    ? null // Disable the next button
                    : () {
                        // When the button is clicked, navigate to the age, height, weight screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AgeHeightWeightScreen(),
                          ),
                        );
                      },
                style: kNextButtonStyle.copyWith(
                    backgroundColor: MaterialStatePropertyAll(
                        _userGender == Gender.notSelected
                            ? kGreyThemeColor02
                            : kBlueThemeColor)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Female button
  ElevatedButton _buildFemaleButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          // If the male button is clicked, selected gender = Female
          _userGender = Gender.female;
        });
      },
      style: kGenderSelectionButtonStyle.copyWith(
        backgroundColor: MaterialStatePropertyAll(
            _userGender == Gender.female ? kPinkThemeColor : kWhiteThemeColor),
      ),
      child: Text(
        'Female',
        style: kLargeBlackTitleTextStyle.copyWith(
            color: _userGender == Gender.female
                ? kWhiteThemeColor
                : kPinkThemeColor),
      ),
    );
  }

  /// Male button
  ElevatedButton _buildMaleButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          // If the male button is clicked, selected gender = Male
          _userGender = Gender.male;
        });
      },
      style: kGenderSelectionButtonStyle.copyWith(
        backgroundColor: MaterialStatePropertyAll(
            _userGender == Gender.male ? kBlueThemeColor : kWhiteThemeColor),
      ),
      child: Text(
        'Male',
        style: kLargeBlackTitleTextStyle.copyWith(
            color: _userGender == Gender.male
                ? kWhiteThemeColor
                : kBlueThemeColor),
      ),
    );
  }
}
