import 'package:exFinal_analiza_T/src/utils/Colors.dart';
import 'package:flutter/material.dart';

class AlertComponent extends StatelessWidget {
  final String title;
  final String message;
  final Map<String, void Function()> actions;

  AlertComponent({
    Key key,
    @required this.title,
    this.actions,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: MyColors.backgroundColor,
      title: Text(this.title, textAlign: TextAlign.center,),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 10.0),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: Icon(Icons.warning_rounded, size: 60.0, color: Colors.amber),
          ),
          SizedBox(height: 10.0),
          Container(
            child: Text(
              this.message,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      actions: this.actions.keys.map((e) {
        return TextButton(
          onPressed: this.actions[e],
          child: Text(e),
        );
      }).toList(),
    );
  }

  Future<T> show<T>(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return this;
      },
    );
  }
}
