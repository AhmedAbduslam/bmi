import 'package:bmi/dummy_data.dart';
import 'package:bmi/widgets/custom_appbar.dart';
import 'package:bmi/widgets/dynamic_sized_widget.dart';
import 'package:bmi/widgets/my_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class InfoScreen extends StatelessWidget {
  final String bodyType;
  final double bmi;

  const InfoScreen({
    this.bodyType,
    this.bmi,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomeAppBar('BMI Info'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: MyContainer(
                widthFactor: .8,
                heightFactor: .8,
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Your BMI',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff5A6176),
                            fontWeight: FontWeight.w300),
                      ),
                      Expanded(
                        child: DynamicSizedgWidget(
                          widthFactor: .8,
                          child: Text(
                            bmi.toStringAsFixed(1),
                            style: TextStyle(
                                color: Color(0xff5A6176),
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      Text(
                        bodyType,
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xffe6b3a3),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: MyContainer(
                heightFactor: .8,
                widthFactor: .8,
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) =>
                      ListView.builder(
                          itemCount: infoList.length,
                          itemExtent: constraints.maxHeight / infoList.length,
                          itemBuilder: (BuildContext context, int index) =>
                              MyContainer(
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    DynamicSizedgWidget(
                                      child: Text(
                                        infoList[index][1],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    DynamicSizedgWidget(
                                        child: Text(infoList[index][0])),
                                  ],
                                ),
                              )),
                ),
              ),
            ),
            Spacer()
            // AppButton(
            //   text: 'Save Results',
            //   color: Theme.of(context).accentColor,
            //   textColor: Theme.of(context).canvasColor,
            // ),
          ],
        ),
      ),
    );
  }
}
