import 'package:exFinal_analiza_T/src/components/AppBarConponent.dart';
import 'package:exFinal_analiza_T/src/utils/Colors.dart';
import 'package:flutter/material.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({Key key}) : super(key: key);

  // final _sportUrl =
  //     'https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80';

  @override
  Widget build(BuildContext context) {
    TextStyle label = TextStyle(
      color: MyColors.accentColor,
      fontWeight: FontWeight.bold,
      fontSize: 16.0
    );

    return Scaffold(
      appBar: PreferredSize(
        child: AppBarComponent(),
        preferredSize: const Size(double.infinity, kToolbarHeight),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text('1. Levantarte mas temprano', style: label,),
            Text('2. Dedica 6 dias de la semana', style: label),
            Text('3. Elige una actividad', style: label),
            Text('4. Invierte', style: label),
            Text('5. Metas a corto plazo', style: label),
            Text('6. Anota resultados', style: label),
            Text('7. Desafiante', style: label),
            Text('8. Dale un significado personal', style: label)
        ]
      ),
    );
  }
}