import 'package:exFinal_analiza_T/src/components/InputComponent.dart';
import 'package:exFinal_analiza_T/src/utils/Colors.dart';
import 'package:flutter/material.dart';

class FormRow extends StatelessWidget {
  final String label;
  final String unit;
  final void Function(String) onChange;
  final String Function(String) validator;
  final TextInputType keyBoardType;

  const FormRow({
    Key key,
    @required this.label,
    this.unit,
    this.onChange,
    this.validator,
    this.keyBoardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Text(
            this.label,
            style: TextStyle(
              color: MyColors.accentColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
              child: InputComponent(
            label: this.unit,
            onChange: this.onChange,
            validator: this.validator,
            keyBoardType: this.keyBoardType,
          ))
        ],
      ),
    );
  }
}
