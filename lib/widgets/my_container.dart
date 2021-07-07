import 'package:flutter/material.dart';

class MyContainer extends StatefulWidget {
  final Widget child;
  final double widthFactor;
  final double heightFactor;
  final BoxDecoration decoration;
  final void Function() onPressed;
  final double spreadRadius;
  final AlignmentGeometry alignment;
  final BoxShape shape;
  final Gradient gradient;
  final Color color;
  final bool isPressed;

  const MyContainer({
    this.child,
    this.widthFactor = 1,
    this.heightFactor = 1,
    this.decoration,
    this.onPressed,
    this.spreadRadius,
    this.alignment = Alignment.center,
    this.shape = BoxShape.rectangle,
    this.gradient,
    this.color,
    this.isPressed = false,
  });

  @override
  _MyContainerState createState() => _MyContainerState();
}

bool _isPressed = false;
List<BoxShadow> get _getShadow => _isPressed ? [] : _getDynamicShadow(4);
List<BoxShadow> _getDynamicShadow(double position) =>
    _isPressed ? [] : boxShadow;

class _MyContainerState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      onTapDown: widget.onPressed != null
          ? (_) => setState(() => _isPressed = true)
          : null,
      onTapUp: widget.onPressed != null
          ? (_) => setState(() => _isPressed = false)
          : null,
      // onTapCancel: () => setState(() => _isPressed = false),
      child: FractionallySizedBox(
        alignment: widget.alignment,
        widthFactor: widget.widthFactor,
        heightFactor: widget.heightFactor,
        child: Container(
          width: double.infinity,
          child: widget.child,
          padding: const EdgeInsets.all(8.0),
          decoration: widget.decoration ??
              BoxDecoration(
                shape: widget.shape,
                color: _isPressed
                    ? Theme.of(context).cardColor
                    : widget.color ?? Theme.of(context).canvasColor,
                borderRadius: widget.shape != BoxShape.circle
                    ? const BorderRadius.all(Radius.circular(20.0))
                    : null,
                boxShadow: _getShadow,
                gradient: widget.gradient,
              ),
        ),
      ),
    );
  }
}

List<BoxShadow> boxShadow = [
  BoxShadow(
      color: Colors.white,
      spreadRadius: 2,
      blurRadius: 3,
      offset: Offset(-5, -5)),
  BoxShadow(
      color: Color(0xffa3e6e0).withOpacity(.4),
      spreadRadius: 3,
      blurRadius: 3,
      offset: Offset(4, 4)),
];
// List<BoxShadow> boxShadow = [
//   BoxShadow(
//     color: Colors.white,
//     spreadRadius: 0,
//     blurRadius: 3,
//     offset: Offset(-3, -3),
//   ),
//   BoxShadow(
//     color: Color(0xffC4D7DF),
//     spreadRadius: 0,
//     blurRadius: 5,
//     offset: Offset(4, 4),
//   ),
// ];

// List<BoxShadow> pressedShadow = [
//   BoxShadow(
//     color: Colors.white,
//     spreadRadius: 1,
//     blurRadius: 5,
//     offset: Offset(5, 5),
//   ),
//   BoxShadow(
//     color: Color(0xffC4D7DF),
//     spreadRadius: 1,
//     blurRadius: 5,
//     offset: Offset(-5, -5),
//   ),
// ];

LinearGradient gradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Colors.white,
    Colors.white.withOpacity(.3),
    Color(0xffa3e6e0).withOpacity(.2),
    Color(0xffa3e6e0).withOpacity(.3),
    Color(0xffa3e6e0).withOpacity(.4),
  ],
  stops: [0.1, 0.5, 0.75, 0.85, .9],
);
