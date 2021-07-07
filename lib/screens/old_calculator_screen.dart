import 'package:bmi/widgets/app_button.dart';
import 'package:bmi/widgets/custom_appbar.dart';
import 'package:bmi/widgets/dynamic_sized_widget.dart';
import 'package:bmi/widgets/my_container.dart';
import 'package:flutter/material.dart';
import "dart:math" show pi;

int startPoint = 30;
int endPoint = 220;

class OldCalculatorScreen extends StatelessWidget {
  Widget _getView(int i) {
    if (i % 5 == 0) {
      return Expanded(child: FittedBox(child: Text(i.toString())));
    } else {
      return Expanded(flex: 2, child: Container());
    }
  }

  List<Widget> get _list {
    List<Widget> l = [];
    for (int i = startPoint; i <= endPoint; i++) {
      l.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                color: Colors.grey,
                height: 1.0,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
              ),
            ),
            _getView(i)
          ],
        ),
      );
    }
    return l;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomeAppBar('BMI Calculator'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: FractionallySizedBox(
                widthFactor: .8,
                heightFactor: .9,
                child: Row(
                  children: [
                    Expanded(child: Button(text: 'Male')),
                    SizedBox(width: 25),
                    Expanded(child: Button(text: 'Female'))
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: FractionallySizedBox(
                widthFactor: .8,
                heightFactor: .9,
                child: Row(
                  children: [
                    Expanded(
                      child: MyContainer(
                          child: Column(
                        children: [
                          Text('Height'),
                          SizedBox(height: 10.0),
                          Expanded(
                            child: LayoutBuilder(
                              builder: (context, constrains) => Container(
                                width: constrains.maxWidth / 1.5,
                                child: Row(
                                  children: [
                                    // Expanded(child: Sliderc()),
                                    Expanded(
                                      child: ListWheelScrollView(
                                        itemExtent: constrains.maxHeight / 15,
                                        children: _list,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                    ),
                    SizedBox(width: 25),
                    Expanded(child: Button(text: 'Female'))
                  ],
                ),
              ),
            ),
            AppButton(
              text: 'Let\'s begin',
              color: Theme.of(context).accentColor,
              textColor: Theme.of(context).canvasColor,
            ),
          ],
        ),
      ),
    );
  }
}

class Sliderc extends StatefulWidget {
  @override
  _SlidercState createState() => _SlidercState();
}

class _SlidercState extends State<Sliderc> {
  int height = ((startPoint + endPoint) / 2).truncate();

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()..rotateZ(pi * 3 / 2),
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
            // thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
            // overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
            thumbColor: Theme.of(context).canvasColor,
            overlayColor: Theme.of(context).accentColor,
            inactiveTrackColor: Theme.of(context).cardColor,
            activeTrackColor: Theme.of(context).accentColor),
        child: Slider(
          value: height.toDouble(),
          min: startPoint.toDouble(),
          max: endPoint.toDouble(),
          onChanged: (double value) {
            setState(
              () {
                height = value.round();
              },
            );
          },
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String text;

  const Button({this.text});

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      onPressed: () => print(text),
      child: DynamicSizedgWidget(
        heightFactor: .7,
        child: Text(
          text,
          style: TextStyle(
            letterSpacing: .5,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
