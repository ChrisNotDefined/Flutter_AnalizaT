import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

PreferredSizeWidget appBarComponent() {
  return AppBar(
    title: Text(
      'ANALIZA-T',
      style: _titleStyle(),
    ),
    leading: Container(
      padding: EdgeInsets.all(5.0),
      child: SvgPicture.asset('assets/svg/corazon.svg'),
    ),
  );
}

TextStyle _titleStyle() {
  return TextStyle(color: Colors.white);
}
