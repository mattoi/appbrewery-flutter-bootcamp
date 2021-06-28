import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  static const double minHeight = 100;
  static const double maxHeight = 230;
  Gender userGender;
  int userAge = 18;
  int userWeight = 70;
  double userHeight = 160;

  Color setGenderCardColor(Gender selectedGender, Gender previousGender) {
    return (selectedGender == previousGender)
        ? UIColors.active
        : UIColors.inactive;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                ReusableCard(
                  onTap: () => setState(() => userGender = Gender.male),
                  color: setGenderCardColor(Gender.male, userGender),
                  child: IconContent(
                    label: 'MALE',
                    icon: Icon(FontAwesomeIcons.mars, size: 80),
                  ),
                ),
                ReusableCard(
                  onTap: () => setState(() => userGender = Gender.female),
                  color: setGenderCardColor(Gender.female, userGender),
                  child: IconContent(
                    label: 'FEMALE',
                    icon: Icon(FontAwesomeIcons.venus, size: 80),
                  ),
                ),
              ],
            ),
          ),
          ReusableCard(
            color: UIColors.active,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEIGHT', style: labelTextStyle),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      trackHeight: 1,
                      thumbColor: Color(0xFFEB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayColor: Color(0x29EB1555),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30)),
                  child: Slider(
                    value: userHeight.toDouble(),
                    min: minHeight,
                    max: maxHeight,
                    onChanged: (newHeight) => setState(
                      () => userHeight = newHeight,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      userHeight.toInt().toString(),
                      style: numberTextStyle,
                    ),
                    Text(' cm', style: labelTextStyle)
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ReusableCard(
                  color: UIColors.active,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT', style: labelTextStyle),
                      Text(
                        userWeight.toString(),
                        style: numberTextStyle,
                      ),
                      SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            color: Color(0xFF4C4F5E),
                            onPressed: () => setState(() => userWeight--),
                          ),
                          SizedBox(width: 10),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            color: Color(0xFF4C4F5E),
                            onPressed: () => setState(() => userWeight++),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                ReusableCard(
                  color: UIColors.active,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE', style: labelTextStyle),
                      Text(userAge.toString(), style: numberTextStyle),
                      SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () => setState(() => userAge--),
                          ),
                          SizedBox(width: 10),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () => setState(() => userAge++),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            label: 'CALCULATE YOUR BMI',
            onPressed: () {
              double bmi = BMICalculator.calculateBMI(userHeight, userWeight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultsPage(
                      bmi: BMICalculator.calculateBMI(userHeight, userWeight),
                      resultRange: BMICalculator.getRange(bmi),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
