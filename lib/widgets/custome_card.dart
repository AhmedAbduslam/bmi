import 'package:bmi/widgets/dynamic_sized_widget.dart';
import 'package:bmi/widgets/my_container.dart';
import 'package:flutter/material.dart';

class CustomCardTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final double widthFactor;
  final double heightFactor;
  final void Function() onPressed;

  const CustomCardTile({
    this.text,
    this.icon,
    this.widthFactor = .8,
    this.heightFactor = .8,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      onPressed: onPressed,
      heightFactor: heightFactor,
      widthFactor: widthFactor,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffa3e6e0).withOpacity(.25),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: DynamicSizedgWidget(
                widthFactor: .5,
                child: Icon(icon, color: Theme.of(context).accentColor),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DynamicSizedgWidget(
                  heightFactor: .3,
                  child: Text(
                    text,
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                ),
                DynamicSizedgWidget(
                  heightFactor: .3,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
