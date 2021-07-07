import 'package:bmi/widgets/dynamic_sized_widget.dart';
import 'package:bmi/widgets/my_container.dart';
import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    this.title,
    this.value,
    this.child,
    this.child2,
    this.flex,
    this.heightFactor,
    this.widthFactor,
    this.onPressed,
  });

  final int flex;
  final double heightFactor;
  final double widthFactor;
  final void Function() onPressed;
  final String title;
  final int value;
  final Widget child;
  final Widget child2;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: MyContainer(
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        onPressed: onPressed,
        child: Column(
          children: [
            ExpandWidget(
              heightFactor: .6,
              child: Text(
                title,
                style: TextStyle(
                  letterSpacing: .5,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            if (child != null)
              Expanded(flex: 2, child: DynamicSizedgWidget(child: child)),
            if (child2 != null) Expanded(flex: 3, child: child2),
          ],
        ),
      ),
    );
  }
}
