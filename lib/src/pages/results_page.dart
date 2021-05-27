import 'package:exFinal_analiza_T/src/components/AppBarConponent.dart';
import 'package:exFinal_analiza_T/src/components/ButtonComponent.dart';
import 'package:exFinal_analiza_T/src/utils/Colors.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle label = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20.0
    );

    return Scaffold(
      appBar: PreferredSize(
        child: AppBarComponent(),
        preferredSize: const Size(double.infinity, kToolbarHeight),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(10.0),
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
                Text('Colesterol:', style: label),
                Text('Triglicéridos:', style: label),
                Text('Ácido Úrico:', style: label),
                Text('Glucosa:', style: label),
                Text('Glóbulos Rojos: ', style: label),
                Text('Glóbulos Blancos: ', style: label),
                Text('Hemoglobina: ', style: label),
                Text('Plaquetas:', style: label),
              ],
            ),
          ),
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
        ],
      ),
    );
  }
}
