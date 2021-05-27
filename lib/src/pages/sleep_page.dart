import 'package:exFinal_analiza_T/src/components/AppBarConponent.dart';
import 'package:exFinal_analiza_T/src/utils/Colors.dart';
import 'package:flutter/material.dart';

class SleepPage extends StatelessWidget {
  const SleepPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle label = TextStyle(
        color: MyColors.accentColor,
        fontWeight: FontWeight.bold,
        fontSize: 16.0);

    return Scaffold(
      appBar: PreferredSize(
        child: AppBarComponent(),
        preferredSize: const Size(double.infinity, kToolbarHeight),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('1. Vaya a dormir a la misma hora cada noche.', style: label),
          Text('2. Evite las siestas después de las 3 p.m.', style: label),
          Text('3. Manténgase alejado de la cafeína y el alcohol por la noche.',
              style: label),
          Text('4. Evite la nicotina por completo.', style: label),
          Text(
              '5. Haga ejercicio con regularidad, pero evite hacerlo 2 a 3 horas antes de la hora de acostarse.',
              style: label),
          Text('6. No coma una comida pesada a la noche.', style: label),
          Text('7. Haga que su dormitorio sea cómodo, esté oscuro y tranquilo.',
              style: label),
          Text('8. Siga una rutina que le ayude a relajarse antes de dormir.',
              style: label),
          Text('9. No repose en la cama despierto.', style: label),
          Text(
              '10. Consulte a un médico si continúa teniendo problemas para dormir.',
              style: label)
        ],
      ),
    );
  }
}
