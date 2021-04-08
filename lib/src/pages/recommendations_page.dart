import 'package:exFinal_analiza_T/src/components/AdviceComponent.dart';
import 'package:exFinal_analiza_T/src/components/AppBarConponent.dart';
import 'package:exFinal_analiza_T/src/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:exFinal_analiza_T/src/components/ButtonComponent.dart';

class RecommendationsPage extends StatelessWidget {
  const RecommendationsPage({Key key}) : super(key: key);

  final _sportUrl =
      'https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80';

  final _sleepUrl =
      'https://images.unsplash.com/photo-1531353826977-0941b4779a1c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80';
  final _dietUrl =
      'https://images.unsplash.com/photo-1565895405138-6c3a1555da6a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Colesterol\nTrigliceridos\n...'),
            Text(
              'Tips',
              style: _subTitle(),
            ),
            SizedBox(height: 20),
            AdviceComponent(
              title: 'EJERCICIO',
              image: NetworkImage(_sportUrl),
            ),
            SizedBox(height: 20),
            AdviceComponent(
              title: 'SUEÑO',
              image: NetworkImage(_sleepUrl),
            ),
            SizedBox(height: 20),
            AdviceComponent(
              title: 'DIETA',
              image: NetworkImage(_dietUrl),
            )
          ],
        ),
      ),
    );
  }
}

TextStyle _subTitle() {
  return TextStyle(
      fontSize: 30,
      color: Color(MyColors.accentColor),
      fontWeight: FontWeight.bold);
}
