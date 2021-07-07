import 'package:bmi/widgets/main_card.dart';
import 'package:flutter/material.dart';

class SliderCard extends StatefulWidget {
  const SliderCard({
    this.value,
    this.onValueChange,
  });

  final int value;
  final Function(int) onValueChange;

  @override
  _SliderCardState createState() => _SliderCardState();
}

class _SliderCardState extends State<SliderCard> {
  int value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainCard(
        flex: 7,
        heightFactor: .8,
        widthFactor: .8,
        title: 'HEIGHT',
        child: RichText(
          text: TextSpan(
            style: TextStyle(color: Theme.of(context).primaryColor),
            children: [
              TextSpan(
                text: value.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: 'cm',
                style: TextStyle(fontSize: 6, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
        child2: SliderTheme(
          data: SliderTheme.of(context).copyWith(
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
              thumbColor: Theme.of(context).canvasColor,
              overlayColor: Theme.of(context).accentColor,
              inactiveTrackColor: Theme.of(context).cardColor,
              activeTrackColor: Theme.of(context).accentColor),
          child: Slider(
            value: value.toDouble(),
            min: 20.0,
            max: 220.0,
            label: value.toString(),
            onChanged: (x) {
              setState(() => value = x.round());
              widget.onValueChange(value);
            },
          ),
        ));
  }
}
