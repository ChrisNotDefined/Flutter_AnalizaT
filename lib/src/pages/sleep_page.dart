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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _TipsSleep(),
            _BotonSleep(),
          ],
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
    height: 315,
    child: WebView(
      initialUrl: Uri.dataFromString(
              '<iframe width="100%" height="290" src="https://www.youtube.com/embed/TWXfHWVl2ik" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"></iframe>',
              mimeType: 'text/html')
          .toString(),
      javascriptMode: JavascriptMode.unrestricted,
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
              style: label),
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
      height: 50.0,
      alignment: Alignment.center,
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
