import 'package:bmi/widgets/custom_appbar.dart';
import 'package:bmi/dummy_data.dart';
import 'package:bmi/widgets/custome_card.dart';
import 'package:bmi/widgets/dynamic_sized_widget.dart';
import 'package:bmi/widgets/my_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TipsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.of(context).size.width >= 450 * 2;
    return SafeArea(
      child: Scaffold(
        appBar: CustomeAppBar('Good Tips', hasTipsButton: false),
        body: Flex(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          direction: isScreenWide ? Axis.horizontal : Axis.vertical,
          children: [
            Expanded(
              flex: 4,
              child: LayoutBuilder(
                builder: (context, constraints) => constraints.maxWidth <= 420
                    ? TitleWidget()
                    : Container(width: 450, child: TitleWidget()),
              ),
            ),
            Expanded(
              flex: 6,
              child: LayoutBuilder(
                builder: (context, constraints) => ListView.builder(
                  itemCount: tipsData.length,
                  itemExtent: constraints.maxHeight / 4.5,
                  itemBuilder: (context, index) => CustomCardTile(
                    text: tipsData[index].title,
                    icon: tipsData[index].icon,
                    onPressed: () => print(tipsData[index].title),
                  ),
                ),
              ),
            ),
            // Expanded(
            //   flex: 2,
            //   child: MyContainer(
            //     widthFactor: .3,
            //     heightFactor: .5,
            //     alignment: Alignment(0, -.5),
            //     onPressed: () => print('more'),
            //     child: DynamicSizedgWidget(
            //       widthFactor: .6,
            //       heightFactor: .6,
            //       child: Text(
            //         'More',
            //         style: TextStyle(color: Theme.of(context).primaryColor),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyContainer(
      widthFactor: .8,
      heightFactor: .8,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: MyContainer(
              shape: BoxShape.circle,
              child: MyContainer(
                widthFactor: .7,
                heightFactor: .7,
                shape: BoxShape.circle,
                gradient: gradient,
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            flex: 3,
            child: DynamicSizedgWidget(
              alignment: Alignment.centerLeft,
              heightFactor: .5,
              child: RichText(
                maxLines: 3,
                text: TextSpan(
                  style: TextStyle(color: Theme.of(context).primaryColor),
                  children: [
                    TextSpan(
                        text: 'Hi There!\n',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: 'I\'m your mentor to give\n you good tips',
                        style: TextStyle(fontSize: 10)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
