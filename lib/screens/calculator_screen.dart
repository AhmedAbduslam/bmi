import 'dart:math';

import 'package:bmi/screens/result_screen.dart';
import 'package:bmi/widgets/app_button.dart';
import 'package:bmi/widgets/card_numerical.dart';
import 'package:bmi/widgets/custom_appbar.dart';
import 'package:bmi/widgets/gender_selection.dart';
import 'package:bmi/widgets/slider_card.dart';
import 'package:flutter/material.dart';

int weight = 60;
int age = 25;
int height = 170;

class CalculatorScreen extends StatelessWidget {
  double get _bmiCalculation => weight / pow(height / 100, 2);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomeAppBar('BMI Calculator', hasBackButton: false),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: FractionallySizedBox(
                widthFactor: .5,
                heightFactor: .9,
                child: GenderSelection(),
              ),
            ),
            SliderCard(
              value: height,
              onValueChange: (value) => height = value,
            ),
            Expanded(
              flex: 7,
              child: FractionallySizedBox(
                widthFactor: .8,
                child: Row(
                  children: [
                    CardNumerical(
                      title: 'WEIGHT',
                      unit: 'Kg',
                      value: weight,
                      onValueChange: (value) => weight = value,
                    ),
                    SizedBox(width: 25),
                    CardNumerical(
                      title: 'AGE',
                      value: age,
                      onValueChange: (value) => age = value,
                    ),
                  ],
                ),
              ),
            ),
            AppButton(
              flex: 4,
              text: 'Let\'s begin',
              color: Theme.of(context).accentColor,
              textColor: Theme.of(context).canvasColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => ResultScreen(_bmiCalculation),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
