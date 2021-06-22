import 'package:charts_flutter/flutter.dart' as charts;
import 'package:exFinal_analiza_T/src/models/register_model.dart';
import 'package:exFinal_analiza_T/src/models/user_model.dart';
import 'package:exFinal_analiza_T/src/providers/API_provider.dart';
import 'package:exFinal_analiza_T/src/providers/ApplicationState.dart';
import 'package:exFinal_analiza_T/src/utils/RegisterToSeries.dart';

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
  List<RegisterModel> registers;

  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<ApplicationState>(context).user;

    return Scaffold(
      appBar: PreferredSize(
        child: AppBarComponent(),
        preferredSize: const Size(double.infinity, kToolbarHeight),
      ),
      body: SingleChildScrollView(
        child: Container(
            constraints: BoxConstraints(
              minHeight:
                  MediaQuery.of(context).size.height - kToolbarHeight - 30,
            ),
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  FormRow(
                    label: 'Peso:',
                    unit: 'Kg',
                  ),
                  FormRow(
                    label: 'Estatura:',
                    unit: 'cm',
                  ),
                  FormRow(
                    label: 'Cintura:',
                    unit: 'cm',
                  ),
                  FormRow(
                    label: 'Pecho:',
                    unit: 'cm',
                  ),
                  SizedBox(height: 10),
                  _CalcMeasuresButton(),
                  SizedBox(height: 10),
                  FutureBuilder(
                    future: RegisterProvider().getRegistersByUserId(user.id),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        List<charts.Series<double, int>> series =
                            registerToSeries(snapshot.data);

                        List<charts.Series<double, int>> series1 = [series[0]];
                        List<charts.Series<double, int>> series2 = [
                          series[1],
                          series[2],
                          series[3],
                        ];

                        BoxDecoration chartDecoration = BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              offset: Offset(0.0, 5.0),
                              blurRadius: 2.0,
                            )
                          ],
                        );

                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5.0),
                              decoration: chartDecoration,
                              height: MediaQuery.of(context).size.height / 3,
                              child: MeasuresChart(series1),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              decoration: chartDecoration,
                              height: MediaQuery.of(context).size.height / 3,
                              child: MeasuresChart(series2),
                            ),
                          ],
                        );
                      }
                      if (snapshot.hasError) {
                        return Text('Hubo un error al obtener los datos');
                      }
                      return Container(
                        height: MediaQuery.of(context).size.height / 2.5,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

class _CalcMeasuresButton extends StatelessWidget {
  const _CalcMeasuresButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: ButtonComponent(
        child: Text('Añadir Medidas', style: TextStyle(fontSize: 25.0)),
        onPressed: () {
          Navigator.pushNamed(context, '');
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

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
