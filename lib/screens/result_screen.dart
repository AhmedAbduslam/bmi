import "dart:math" show pi;

import 'package:bmi/screens/info_screen.dart';
import 'package:bmi/widgets/app_button.dart';
import 'package:bmi/widgets/custom_appbar.dart';
import 'package:bmi/dummy_data.dart';
import 'package:bmi/widgets/dynamic_sized_widget.dart';
import 'package:bmi/widgets/my_container.dart';
import 'package:flutter/material.dart';

String _getBodyType(double value) {
  for (int i = 0; i < bodyTypesList.length; ++i) {
    if (value > bodyTypesList[i].startFrom) {
      return bodyTypesList[i].name;
    }
  }
  return '';
}

class ResultScreen extends StatelessWidget {
  final double bmiValue;

  const ResultScreen(this.bmiValue);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomeAppBar('Bmi Results'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 7,
              child: MyContainer(
                heightFactor: .8,
                widthFactor: .8,
                shape: BoxShape.circle,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Indicator(value: bmiValue),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: DynamicSizedgWidget(
                heightFactor: .4,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    children: [
                      TextSpan(
                          text: 'Your body is ',
                          style: TextStyle(fontWeight: FontWeight.w300)),
                      TextSpan(
                          text: _getBodyType(bmiValue),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).accentColor)),
                      TextSpan(
                          text: ' !',
                          style: TextStyle(fontWeight: FontWeight.w300)),
                    ],
                  ),
                ),
              ),
            ),
            AppButton(
              text: 'Details',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => InfoScreen(
                          bmi: bmiValue,
                          bodyType: _getBodyType(bmiValue),
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final double value;

  const Indicator({this.value});

  @override
  Widget build(BuildContext context) {
    double percentage = value / 30;
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) {
            return SweepGradient(
              startAngle: 0.0,
              endAngle: pi * 2,
              stops: [percentage, percentage],
              transform: GradientRotation(pi * 3 / 2),
              colors: [
                Theme.of(context).accentColor,
                Colors.grey.withAlpha(20)
              ],
            ).createShader(rect);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Center(
          child: MyContainer(
            widthFactor: .8,
            heightFactor: .8,
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              shape: BoxShape.circle,
            ),
            child: DynamicSizedgWidget(
              widthFactor: .6,
              heightFactor: .6,
              child: Text(
                value.toStringAsFixed(1),
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
