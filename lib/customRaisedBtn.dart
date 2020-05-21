import 'package:flutter/material.dart';

class customRaisedBtn extends StatelessWidget {
  final Color color;
  final double borderRadius;
  final Widget child;
  final VoidCallback onPressed;
  final SizedBox width;
  final SizedBox height;
  customRaisedBtn({@required this.color, this.borderRadius, this.child, this.onPressed, this.width, this.height}) : assert(color != null);

  @override
  Widget build(BuildContext context) {
    return
       RaisedButton(
          child: child,
          onPressed: onPressed,
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          )

    );
  }
}
