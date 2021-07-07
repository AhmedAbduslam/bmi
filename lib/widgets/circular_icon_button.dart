import 'package:bmi/widgets/dynamic_sized_widget.dart';
import 'package:bmi/widgets/my_container.dart';
import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  const CircularIconButton({
    this.onPressed,
    this.icon,
    this.widthFactor = .5,
  });

  final void Function() onPressed;
  final IconData icon;
  final double widthFactor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MyContainer(
        widthFactor: widthFactor,
        onPressed: onPressed,
        shape: BoxShape.circle,
        child: DynamicSizedgWidget(
          child: Icon(icon, color: Theme.of(context).accentColor),
        ),
      ),
    );
  }
}
