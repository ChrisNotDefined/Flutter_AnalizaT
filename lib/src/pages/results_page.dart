import 'package:exFinal_analiza_T/src/components/AppBarConponent.dart';
import 'package:exFinal_analiza_T/src/components/ButtonComponent.dart';
import 'package:exFinal_analiza_T/src/providers/ApplicationState.dart';
import 'package:exFinal_analiza_T/src/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarComponent(),
        preferredSize: const Size(double.infinity, kToolbarHeight),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              _Results(),
              _Options(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Results extends StatelessWidget {
  _Results({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final results = Provider.of<ApplicationState>(context).currentAnalysis;

    return Container(
      margin: EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.accentColor),
        borderRadius: BorderRadius.circular(20.0),
        color: MyColors.primaryColor,
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _ResField(
              text: 'Colesterol (HDL):',
              unit: '(mg / dl)',
              value: results.colesterol.hdl),
          _ResField(
              text: 'Colesterol (LDL):',
              unit: '(mg / dl)',
              value: results.colesterol.ldl),
          _ResField(
              text: 'Triglicéridos: ',
              unit: '(mg / dl)',
              value: results.trigliceridos),
          _ResField(
              text: 'Ácido Úrico: ',
              unit: '(mg / dl)',
              value: results.acidoUrico),
          _ResField(
              text: 'Glucosa: ', unit: '(mg / dl)', value: results.glucosa),
          _ResField(
              text: 'Glóbulos Rojos: ',
              unit: '(millones / ml) ',
              value: results.globulosRojos),
          _ResField(
              text: 'Glóbulos Blancos: ',
              unit: '(miles / ml) ',
              value: results.globulosBlancos),
          _ResField(
              text: 'Hemoglobina: ',
              unit: '(g / L) ',
              value: results.hemoglobina),
          _ResField(
              text: 'Plaquetas: ',
              unit: '(miles / ml)',
              value: results.plaquetas),
        ],
      ),
    );
  }
}

class _ResField extends StatelessWidget {
  final String text;
  final dynamic value;
  final String unit;

  _ResField({
    Key key,
    @required this.text,
    @required this.value,
    this.unit,
  }) : super(key: key);

  final TextStyle label = TextStyle(
    color: MyColors.accentColor,
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
  );

  final TextStyle valueStyle = TextStyle(
    fontSize: 20.0,
  );

  @override
  Widget build(BuildContext context) {
    final labelBorder = BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: MyColors.accentColor,
          width: 2.0,
        ),
      ),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 5.0),
          width: double.infinity,
          child: Text(this.text, style: label),
          decoration: labelBorder,
        ),
        Container(
          padding: EdgeInsets.only(top: 5.0),
          width: double.infinity,
          child: Text(
            '${this.value.toString()} ${this.unit}',
            style: valueStyle,
            textAlign: TextAlign.end,
          ),
        ),
        SizedBox(
          height: 5.0,
        )
      ],
    );
  }
}

class _Options extends StatelessWidget {
  const _Options({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50.0,
          width: 250.0,
          child: ButtonComponent(
            child: Text('Nuevos Análisis', style: TextStyle(fontSize: 25.0)),
            onPressed: () {
              Navigator.pushNamed(context, 'test');
            },
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 50.0,
          width: 250.0,
          child: ButtonComponent(
            child: Text('Recomendaciones', style: TextStyle(fontSize: 25.0)),
            onPressed: () {
              Navigator.pushNamed(context, 'recomendations');
            },
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 50.0,
          width: 250.0,
          child: ButtonComponent(
            child: Text('Regresar', style: TextStyle(fontSize: 25.0)),
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('home'));
            },
          ),
        ),
      ],
    );
  }
}
