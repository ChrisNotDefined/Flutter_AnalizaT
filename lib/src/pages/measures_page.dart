import 'package:charts_flutter/flutter.dart' as charts;
import 'package:exFinal_analiza_T/src/components/AlertComponent.dart';
import 'package:exFinal_analiza_T/src/components/LoadingIndicatorComponent.dart';
import 'package:exFinal_analiza_T/src/models/register_model.dart';
import 'package:exFinal_analiza_T/src/providers/ApplicationState.dart';
import 'package:exFinal_analiza_T/src/utils/Colors.dart';
import 'package:exFinal_analiza_T/src/utils/RegisterToSeries.dart';
import 'package:exFinal_analiza_T/src/utils/Validators.dart';

import 'package:flutter/material.dart';
import 'package:exFinal_analiza_T/src/components/ButtonComponent.dart';
import 'package:exFinal_analiza_T/src/components/FormRowComponent.dart';
import 'package:exFinal_analiza_T/src/components/AppBarConponent.dart';
import 'package:provider/provider.dart';

class MeasuresPage extends StatefulWidget {
  const MeasuresPage({Key key}) : super(key: key);

  @override
  _MeasuresPageState createState() => _MeasuresPageState();
}

class _MeasuresPageState extends State<MeasuresPage> {
  RegisterModel register = new RegisterModel();
  GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    Provider.of<ApplicationState>(context, listen: false).fetchRegisters();
  }

  Widget build(BuildContext context) {
    final state = Provider.of<ApplicationState>(context);

    final registerForm = Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            FormRow(
              label: 'Peso:',
              unit: 'Kg',
              onChange: (value) => setState(() {
                register.peso = double.tryParse(value);
              }),
              validator: isValidDouble,
              keyBoardType: TextInputType.number,
            ),
            FormRow(
              label: 'Estatura:',
              unit: 'cm',
              onChange: (value) => setState(() {
                register.estatura = double.tryParse(value);
              }),
              validator: isValidDouble,
              keyBoardType: TextInputType.number,
            ),
            FormRow(
              label: 'Cintura:',
              unit: 'cm',
              onChange: (value) => setState(() {
                register.cintura = double.tryParse(value);
              }),
              validator: isValidDouble,
              keyBoardType: TextInputType.number,
            ),
            FormRow(
              label: 'Pecho:',
              unit: 'cm',
              onChange: (value) => setState(() {
                register.pecho = double.tryParse(value);
              }),
              validator: isValidDouble,
              keyBoardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            _CalcMeasuresButton(register: register, formKey: formKey),
            SizedBox(height: 10),
            _GoBackButton(),
          ],
        ),
      ),
    );
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarComponent(),
        preferredSize: const Size(double.infinity, kToolbarHeight),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                  minHeight:
                      MediaQuery.of(context).size.height - kToolbarHeight - 30),
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Center(
                child: Column(
                  children: [
                    registerForm,
                    SizedBox(height: 10),
                    ChartsSection(),
                  ],
                ),
              ),
            ),
          ),
          state.isLoadingRegister ? LoadingIndicator() : Container(),
        ],
      ),
    );
  }
}

class _Deletebutton extends StatelessWidget {
  const _Deletebutton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        AlertComponent(
          title: '¿Borrar Registros?',
          message:
              'Se borrrarán todos los registros, esta acción no se puede deshacer.',
          actions: {
            'Aceptar': () {
              Provider.of<ApplicationState>(context, listen: false)
                  .cleanRegisters();
              Navigator.of(context).pop();
            },
            'Cancelar': () => Navigator.of(context).pop()
          },
        ).show(context);
      },
      icon: Icon(Icons.delete_forever),
      label: Text('Borrar registros'),
    );
  }
}

Column _loadCharts(List<RegisterModel> registers, BuildContext context) {
  List<charts.Series<double, int>> series = registerToSeries(registers);

  List<charts.Series<double, int>> series1 = [series[0]];
  List<charts.Series<double, int>> series2 = [
    series[1],
    series[2],
    series[3],
  ];

  Container _chartContainer(Widget chart) {
    return Container(
      child: chart,
      padding: EdgeInsets.only(left: 20.0, right: 3.0),
      height: MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
        color: MyColors.primaryLight,
      ),
    );
  }

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      _chartContainer(MeasuresChart(series1)),
      SizedBox(height: 20.0),
      _chartContainer(MeasuresChart(series2)),
      SizedBox(height: 10),
      _Deletebutton(),
    ],
  );
}

class ChartsSection extends StatelessWidget {
  const ChartsSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ApplicationState>(context);

    final registers = state.registers;
    final isLoading = state.isLoadingRegister;

    if (isLoading) {
      return Container(
        height: MediaQuery.of(context).size.height / 2.5,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (registers == null || registers.isEmpty) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height / 2.8,
        child: Container(
          padding: EdgeInsets.all(30.0),
          decoration: BoxDecoration(
            color: MyColors.primaryColor,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
                color: MyColors.accentColor, style: BorderStyle.solid),
          ),
          child: Text(
            'Comienza a añadir medidas para visualizar tu progreso.',
            style: TextStyle(
              color: MyColors.accentColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return _loadCharts(registers, context);
  }
}

class _GoBackButton extends StatelessWidget {
  const _GoBackButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: ButtonComponent(
        child: Text('Volver', style: TextStyle(fontSize: 25.0)),
        onPressed: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
          
          Navigator.pop(context);
        },
      ),
    );
  }
}

class _CalcMeasuresButton extends StatelessWidget {
  final RegisterModel register;
  final GlobalKey<FormState> formKey;

  const _CalcMeasuresButton({Key key, this.register, this.formKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: ButtonComponent(
        child: Text('Añadir Medidas', style: TextStyle(fontSize: 25.0)),
        onPressed: () {
          if (formKey.currentState.validate()) {
            Provider.of<ApplicationState>(context, listen: false)
                .uploadRegister(this.register);
          }
        },
      ),
    );
  }
}

class MeasuresChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  MeasuresChart(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    return charts.LineChart(
      seriesList,
      defaultRenderer: charts.LineRendererConfig(
        includePoints: true,
      ),
      animate: animate,
      secondaryMeasureAxis: charts.NumericAxisSpec(showAxisLine: true),
      primaryMeasureAxis: charts.NumericAxisSpec(
        tickProviderSpec: charts.BasicNumericTickProviderSpec(
          desiredTickCount: 5,
          zeroBound: false,
        ),
      ),
      behaviors: [
        charts.SeriesLegend(
          position: charts.BehaviorPosition.bottom,
        ),
      ],
    );
  }
}
