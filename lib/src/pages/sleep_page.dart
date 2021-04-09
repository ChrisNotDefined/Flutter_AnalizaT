import 'package:exFinal_analiza_T/src/components/AppBarConponent.dart';
import 'package:flutter/material.dart';

class SleepPage extends StatelessWidget {
  const SleepPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(context),
      body: Text("Pagina de sueño"),
    );
  }
}
