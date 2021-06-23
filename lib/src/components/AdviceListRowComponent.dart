import 'package:exFinal_analiza_T/src/utils/Colors.dart';
import 'package:flutter/material.dart';

enum AdviceType { Exercise, Sleep, Diet }

class AdviceRowList extends StatelessWidget {
  final String advice;

  final AdviceType type;

  AdviceRowList({
    Key key,
    @required this.advice,
    this.type = AdviceType.Exercise,
  }) : super(key: key);

  final TextStyle label = TextStyle(
    color: MyColors.accentColor,
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
  );

  Icon _adviceIcon() {
    if (this.type == AdviceType.Exercise)
      return Icon(Icons.golf_course, size: 40, color: MyColors.accentColor);
    if (this.type == AdviceType.Diet)
      return Icon(
        Icons.restaurant,
        size: 30,
        color: MyColors.accentColor,
      );
    if (this.type == AdviceType.Sleep)
      return Icon(
        Icons.hotel,
        size: 30,
        color: MyColors.accentColor,
      );

    return Icon(Icons.info);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          _adviceIcon(),
          SizedBox(width: 10.0),
          Expanded(
            child: Text(
              this.advice,
              maxLines: 3,
              style: label,
              overflow: TextOverflow.fade,
            ),
          ),
          SizedBox(width: 10.0),
        ],
      ),
    );
  }
}
