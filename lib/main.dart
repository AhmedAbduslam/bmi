import 'package:bmi/screens/calculator_screen.dart';
import 'package:bmi/screens/info_screen.dart';
import 'package:bmi/screens/tips_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        // primaryColor: Color(0xffEDEDED),
        canvasColor: Colors.grey.shade50,
        cardColor: Colors.grey.shade200,
        accentColor: Color(0xffe6b3a3),
        primaryColor: Color(0xff5A6176),
      ),
      home: CalculatorScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              TextButton(
                child: Text('CalculatorScreen'),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CalculatorScreen())),
              ),
              TextButton(
                child: Text('InfoScreen'),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InfoScreen())),
              ),
              // TextButton(
              //   child: Text('ResultScreen'),
              //   onPressed: () => Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => ResultScreen())),
              // ),
              TextButton(
                child: Text('TipsScreen'),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TipsScreen())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
