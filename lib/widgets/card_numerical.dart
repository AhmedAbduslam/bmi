import 'package:bmi/widgets/circular_icon_button.dart';
import 'package:bmi/widgets/main_card.dart';
import 'package:flutter/material.dart';

class CardNumerical extends StatefulWidget {
  const CardNumerical({
    this.title,
    this.value = 0,
    this.onValueChange,
    this.unit = '',
  });

  final String title;
  final int value;
  final Function(int) onValueChange;
  final String unit;

  @override
  _CardNumericalState createState() => _CardNumericalState();
}

class _CardNumericalState extends State<CardNumerical> {
  int value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainCard(
      title: widget.title,
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Theme.of(context).primaryColor),
          children: [
            TextSpan(
              text: value.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: ' ${widget.unit}',
              style: TextStyle(
                fontSize: 4,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
      child2: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularIconButton(
            widthFactor: .7,
            icon: Icons.remove,
            onPressed: () {
              setState(() => value = (value - 1).clamp(12, 200));
              widget.onValueChange(value);
            },
          ),
          CircularIconButton(
            widthFactor: .7,
            icon: Icons.add,
            onPressed: () {
              setState(() => value = (value + 1).clamp(12, 200));
              widget.onValueChange(value);
            },
          ),
        ],
      ),
    );
  }
}
