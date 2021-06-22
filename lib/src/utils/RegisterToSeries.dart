import 'package:charts_flutter/flutter.dart' as charts;
import 'package:exFinal_analiza_T/src/models/register_model.dart';

List<charts.Series<double, int>> registerToSeries(
    List<RegisterModel> registers) {
  List<double> peso = [];
  List<double> estatura = [];
  List<double> cintura = [];
  List<double> pecho = [];

  registers.forEach((e) {
    peso.add(e.peso);
    estatura.add(e.estatura);
    cintura.add(e.cintura);
    pecho.add(e.pecho);
  });

  charts.Series<double, int> pesoSeries = new charts.Series<double, int>(
    id: 'Peso',
    data: peso,
    domainFn: (_, i) => i,
    measureFn: (val, _) => val,
    colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
  );

  charts.Series<double, int> estaturaSeries = new charts.Series<double, int>(
    id: 'Estatura',
    data: estatura,
    domainFn: (_, i) => i,
    measureFn: (val, _) => val,
    colorFn: (_, __) => charts.MaterialPalette.lime.shadeDefault,
  );

  charts.Series<double, int> cinturaSeries = new charts.Series<double, int>(
    id: 'Cintura',
    data: cintura,
    domainFn: (_, i) => i,
    measureFn: (val, _) => val,
    colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
  );

  charts.Series<double, int> pechoSeries = new charts.Series<double, int>(
    id: 'Pecho',
    data: pecho,
    domainFn: (_, i) => i,
    measureFn: (val, _) => val,
    colorFn: (_, __) => charts.MaterialPalette.indigo.shadeDefault,
  );

  return [pesoSeries, estaturaSeries, cinturaSeries, pechoSeries];
}
