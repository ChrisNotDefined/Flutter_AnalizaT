import 'package:exFinal_analiza_T/src/components/ButtonComponent.dart';
import 'package:exFinal_analiza_T/src/components/InputComponent.dart';
import 'package:exFinal_analiza_T/src/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:exFinal_analiza_T/src/components/AppBarConponent.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarComponent(),
        preferredSize: const Size(double.infinity, kToolbarHeight),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FormRow(label: 'Colesterol:'),
              FormRow(label: 'Triglicéridos:'),
              FormRow(label: 'Ácido Úrico:'),
              FormRow(label: 'Glucosa:'),
              FormRow(label: 'Glóbulos Rojos:'),
              FormRow(label: 'Glóbulos Blancos:'),
              FormRow(label: 'Plaquetas:'),
              SizedBox(height:100),
              Container(
                height: 50.0,
                width: 200.0,
                child: ButtonComponent(
                  child:
                      Text('Ver resultados', style: TextStyle(fontSize: 25.0)),
                  onPressed: () {
                    Navigator.pushNamed(context, 'results');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FormRow extends StatelessWidget {
  final String label;

  const FormRow({
    Key key,
    @required this.label,
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
                fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10.0),
          Expanded(child: InputComponent())
        ],
      ),
    );
  }
}
