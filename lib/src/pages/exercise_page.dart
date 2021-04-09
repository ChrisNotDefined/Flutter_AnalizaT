import 'package:exFinal_analiza_T/src/components/AppBarConponent.dart';
import 'package:flutter/material.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(context),
      body: Text("Pagina de ejercicios"),
    );
  }
}