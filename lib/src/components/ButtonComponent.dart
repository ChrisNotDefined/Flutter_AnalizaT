import 'package:exFinal_analiza_T/src/utils/Colors.dart';
import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final Widget child;
  final Function onPressed;

  const ButtonComponent({Key key, this.child, this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: child,
      style: buttonStyle(),
      onPressed: onPressed,
    );
  }
}

ButtonStyle buttonStyle() {
  return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        Color(MyColors.primaryColor),
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        TextStyle(color: Colors.white),
      ),
      side: MaterialStateProperty.all<BorderSide>(
          BorderSide(width: 3.0, color: Color(MyColors.accentColor))));
}
