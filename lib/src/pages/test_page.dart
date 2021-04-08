import 'package:exFinal_analiza_T/src/components/ButtonComponent.dart';
import 'package:flutter/material.dart';
import 'package:exFinal_analiza_T/src/components/AppBarConponent.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(),
      body: ButtonComponent(
        child: Text('Ver resultados'),
        onPressed: () {
          Navigator.pushNamed(context, 'results');
        },
      ),
    );
  }
}
