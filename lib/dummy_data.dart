import 'package:bmi/models/body_types.dart';
import 'package:bmi/models/tips.dart';
import 'package:flutter/material.dart';

List<Tips> tipsData = [
  // Tips(icon: Icons.sports_football, title: 'Football'),
  Tips(icon: Icons.directions_run, title: 'Running'),
  Tips(icon: Icons.motorcycle, title: 'Cycling'),
  Tips(icon: Icons.pool, title: 'Swimming'),
];

List<dynamic> infoList = [
  ['underweight', 'less than 18.5'],
  ['Normal', '18.5 and 24.9'],
  ['overweight', '25 and 29.9'],
  ['obesity', 'more than 30'],
];

List<BodyType> bodyTypesList = [
  BodyType(name: 'obese', startFrom: 30),
  BodyType(name: 'Overweight', startFrom: 25),
  BodyType(name: 'Normal', startFrom: 18.5),
  BodyType(name: 'Underweight', startFrom: 0),
];
