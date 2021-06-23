import 'package:exFinal_analiza_T/src/components/AdviceListRowComponent.dart';
import 'package:exFinal_analiza_T/src/components/AppBarConponent.dart';
import 'package:exFinal_analiza_T/src/components/ButtonComponent.dart';
import 'package:exFinal_analiza_T/src/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SleepPage extends StatelessWidget {
  const SleepPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarComponent(),
        preferredSize: const Size(double.infinity, kToolbarHeight),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TipsSleep(),
              _BotonSleep(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TipsSleep extends StatelessWidget {
  _TipsSleep({Key key}) : super(key: key);

  final TextStyle label = TextStyle(
    color: MyColors.accentColor,
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
  );

  final Widget videoView = Container(
    margin: EdgeInsets.symmetric(vertical: 10.0),
    height: 300,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: WebView(
        initialUrl: Uri.dataFromString('''
                <iframe 
                  style="width:100%;height:100%;top:0;left:0;position:absolute;"
                  src="https://www.youtube.com/embed/TWXfHWVl2ik"
                  title="YouTube video player"
                  frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture">
                </iframe>
                ''', mimeType: 'text/html').toString(),
        javascriptMode: JavascriptMode.unrestricted,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.accentColor),
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xFFFFFFFF),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 10.0),
            child: Text(
              'Consejos para dormir',
              style: TextStyle(fontSize: 24, color: MyColors.accentColor),
              textAlign: TextAlign.center,
            ),
          ),
          AdviceRowList(
              type: AdviceType.Sleep,
              advice: 'Vaya a dormir a la misma hora cada noche.'),
          AdviceRowList(
              type: AdviceType.Sleep,
              advice: 'Evite las siestas después de las 3 p.m.'),
          AdviceRowList(
              type: AdviceType.Sleep,
              advice:
                  'Manténgase alejado de la cafeína y el alcohol por la noche.'),
          AdviceRowList(
              type: AdviceType.Sleep,
              advice: 'Evite la nicotina por completo.'),
          AdviceRowList(
              type: AdviceType.Sleep,
              advice:
                  'Haga ejercicio con regularidad, pero evite hacerlo 2 a 3 horas antes de la hora de acostarse.'),
          AdviceRowList(
              type: AdviceType.Sleep,
              advice: 'No coma una comida pesada a la noche.'),
          AdviceRowList(
              type: AdviceType.Sleep,
              advice:
                  'Haga que su dormitorio sea cómodo, esté oscuro y tranquilo.'),
          AdviceRowList(
              type: AdviceType.Sleep,
              advice:
                  'Siga una rutina que le ayude a relajarse antes de dormir.'),
          AdviceRowList(
              type: AdviceType.Sleep,
              advice: 'No repose en la cama despierto.'),
          AdviceRowList(
              type: AdviceType.Sleep,
              advice:
                  'Consulte a un médico si continúa teniendo problemas para dormir.'),
          videoView,
        ],
      ),
    );
  }
}

class _BotonSleep extends StatelessWidget {
  const _BotonSleep({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      height: 50.0,
      width: double.infinity,
      child: ButtonComponent(
        child: Text('Regresar', style: TextStyle(fontSize: 25.0)),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
