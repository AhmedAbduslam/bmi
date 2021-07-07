import 'package:bmi/widgets/dynamic_sized_widget.dart';
import 'package:bmi/widgets/main_card.dart';
import 'package:flutter/material.dart';

class GenderSelection extends StatefulWidget {
  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  bool _isMale = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ExpandWidget(
            widthFactor: .8,
            flex: 5,
            child: Text(
              'I\'m a',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w300,
              ),
            )),
        MainCard(
          widthFactor: .9,
          title: _isMale ? 'Male' : 'Female',
          onPressed: () => setState(() => _isMale = !_isMale),
        ),
      ],
    );
  }
}
