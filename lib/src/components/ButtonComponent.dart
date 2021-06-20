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
      style: ElevatedButton.styleFrom(
        primary: MyColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(width: 2.0, color: MyColors.accentColor),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
