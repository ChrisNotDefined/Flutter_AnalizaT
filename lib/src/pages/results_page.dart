import 'package:exFinal_analiza_T/src/components/AppBarConponent.dart';
import 'package:exFinal_analiza_T/src/components/ButtonComponent.dart';
import 'package:exFinal_analiza_T/src/components/LoadingIndicatorComponent.dart';
import 'package:exFinal_analiza_T/src/models/result_model.dart';
import 'package:exFinal_analiza_T/src/providers/ApplicationState.dart';
import 'package:exFinal_analiza_T/src/utils/AnalysisValidators.dart';
import 'package:exFinal_analiza_T/src/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading = Provider.of<ApplicationState>(context).isLoadingAnalysis;

    return Scaffold(
      appBar: PreferredSize(
        child: AppBarComponent(),
        preferredSize: const Size(double.infinity, kToolbarHeight),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  _Results(),
                  _Observations(),
                  _Options(),
                ],
              ),
            ),
          ),
          isLoading ? LoadingIndicator() : Container()
        ],
      ),
    );
  }
}

class _Observations extends StatelessWidget {
  const _Observations({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ResultModel results =
        Provider.of<ApplicationState>(context).currentAnalysis;

    if(results == null) return Container();

    final warningDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.yellow[200],
      border: Border.all(
        color: Colors.amber,
        width: 4.0,
      ),
    );

    final okDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.green[200],
      border: Border.all(
        color: Colors.green,
        width: 1.0,
      ),
    );

    List<String> _lookObservations() {
      List<String> observations = [];

      String resp = isCalcGlobulosRojos(results.globulosRojos);
      if (resp != null) observations.add(resp);

      resp = isCalcGlucosa(results.glucosa);
      if (resp != null) observations.add(resp);

      resp = isCalcGlobulosBlancos(results.globulosBlancos);
      if (resp != null) observations.add(resp);

      resp = isCalcTrigliceridos(results.trigliceridos);
      if (resp != null) observations.add(resp);

      resp = isCalcHemoglobina(results.hemoglobina);
      if (resp != null) observations.add(resp);

      resp = isCalcPlaquetas(results.plaquetas);
      if (resp != null) observations.add(resp);

      resp = isCalcAcidoUrico(results.acidoUrico);
      if (resp != null) observations.add(resp);

      resp = isCalcColesterolLDL(results.colesterol.ldl);
      if (resp != null) observations.add(resp);

      resp = isCalcColesterolHDL(results.colesterol.hdl);
      if (resp != null) observations.add(resp);

      return observations;
    }

    if (_lookObservations().isEmpty) {
      return Container(
        margin: EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: okDecoration,
        child: Text(
          'Todas tus mediciones están saludables. \n\n ¡Sigue cuidándote!',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.green[700],
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    final warnTitleStyle = TextStyle(
      fontSize: 23.0,
      fontWeight: FontWeight.bold,
      color: Colors.amber[700],
    );

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: warningDecoration,
      child: Column(
        children: [
          Container(
            child: Text('Observaciones', style: warnTitleStyle),
          )
        ]..addAll(_obsList(_lookObservations).map((obs) {
            final obsStyle = TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            );

            return Container(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                children: [
                  Icon(Icons.info, color: Colors.amber),
                  SizedBox(width: 10.0),
                  Expanded(child: Text(obs, style: obsStyle)),
                ],
              ),
            );
          })),
      ),
    );
  }

  List<String> _obsList(List<String> _lookObservations()) =>
      _lookObservations();
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
      child: results == null
          ? Container()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 20.0),
                  width: double.infinity,
                  child: Text(
                    'Tu análisis',
                    style: TextStyle(
                      color: MyColors.accentColor,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
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
                    text: 'Glucosa: ',
                    unit: '(mg / dl)',
                    value: results.glucosa),
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Container(
            height: 50.0,
            width: double.infinity,
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
            width: double.infinity,
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
            width: double.infinity,
            child: ButtonComponent(
              child: Text('Regresar', style: TextStyle(fontSize: 25.0)),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('home'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
