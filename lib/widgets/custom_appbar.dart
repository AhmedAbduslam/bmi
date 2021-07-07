import 'package:bmi/screens/tips_screen.dart';
import 'package:bmi/widgets/circular_icon_button.dart';
import 'package:bmi/widgets/dynamic_sized_widget.dart';
import 'package:flutter/material.dart';

class CustomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasTipsButton;
  final bool hasBackButton;

  const CustomeAppBar(this.title,
      {this.hasTipsButton = true, this.hasBackButton = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: Row(
        children: [
          hasBackButton
              ? CircularIconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icons.arrow_back_ios_outlined)
              : Spacer(),
          Expanded(
            flex: 3,
            child: DynamicSizedgWidget(
              widthFactor: .9,
              heightFactor: .4,
              child: Text(
                title,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          hasTipsButton
              ? CircularIconButton(
                  icon: Icons.info_outline,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TipsScreen()),
                  ),
                )
              : Spacer(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
