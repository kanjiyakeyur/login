import 'package:flutter/material.dart';

class EaseInWidget extends StatefulWidget {
  final Widget child;
  final Function onTap;
  const EaseInWidget({Key key, @required this.child, @required this.onTap})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _EaseInWidgetState();
}

class _EaseInWidgetState extends State<EaseInWidget>
    with TickerProviderStateMixin<EaseInWidget> {
  AnimationController controller;
  Animation<double> easeInAnimation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      value: 0.1,
    );
    easeInAnimation = Tween(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
    controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        if (widget.onTap == null) {
          return;
        }
        controller.forward().then((val) {});
      },
      onTapUp: (TapUpDetails details) {
        if (widget.onTap == null) {
          return;
        }
        controller.reverse().then((val) {
          widget.onTap();
        });
      },
      onTapCancel: () {
        controller.forward().then((val) {
          controller.reverse().then((val) {
            widget.onTap();
          });
        });
      },
      child: ScaleTransition(
        scale: easeInAnimation,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}