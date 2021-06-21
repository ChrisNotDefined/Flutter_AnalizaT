import 'package:exFinal_analiza_T/src/utils/Colors.dart';
import 'package:flutter/material.dart';

class OptionSelector<T> extends StatelessWidget {
  /// Indicates the label for the option for each value
  final Map<String, T> options;

  final T value;
  final Function(T) onChanged;

  const OptionSelector({
    Key key,
    @required this.options,
    @required this.onChanged,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: MyColors.accentColor, width: 1)),
      child: DropdownButton<T>(
        style: TextStyle(color: MyColors.accentColor),
        value: value,
        icon: Icon(Icons.arrow_drop_down_sharp, color: MyColors.accentColor),
        iconSize: 24,
        elevation: 16,
        isExpanded: true,
        dropdownColor: MyColors.backgroundColor,
        underline: Container(
          height: 2,
          color: MyColors.accentColor,
        ),
        onChanged: this.onChanged,
        items: options.keys.map<DropdownMenuItem<T>>((String name) {
          return DropdownMenuItem<T>(
            value: options[name],
            child: Text(name),
          );
        }).toList(),
      ),
    );
  }
}
