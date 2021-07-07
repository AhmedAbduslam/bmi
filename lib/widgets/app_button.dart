import 'package:bmi/widgets/dynamic_sized_widget.dart';
import 'package:bmi/widgets/my_container.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    this.flex = 2,
    this.onPressed,
    this.text,
    this.color,
    this.textColor,
  });

  final int flex;
  final void Function() onPressed;
  final String text;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: MyContainer(
        widthFactor: .5,
        heightFactor: .4,
        color: color,
        onPressed: onPressed ?? () => print(text),
        child: DynamicSizedgWidget(
          heightFactor: .65,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
