import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DynamicSizedgWidget extends StatelessWidget {
  const DynamicSizedgWidget(
      {@required this.child,
      this.widthFactor,
      this.heightFactor,
      this.alignment = Alignment.center});

  final Widget child;
  final double widthFactor;
  final double heightFactor;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: alignment,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: FittedBox(alignment: alignment, child: child),
    );
  }
}

class ExpandWidget extends StatelessWidget {
  const ExpandWidget(
      {@required this.child,
      this.widthFactor,
      this.heightFactor,
      this.flex = 1,
      this.alignment = Alignment.center});

  final Widget child;
  final double widthFactor;
  final double heightFactor;
  final int flex;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: DynamicSizedgWidget(
        alignment: alignment,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        child: child,
      ),
    );
  }
}
