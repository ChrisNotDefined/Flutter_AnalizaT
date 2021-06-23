import 'package:exFinal_analiza_T/src/components/AdviceListRowComponent.dart';
import 'package:exFinal_analiza_T/src/components/AppBarConponent.dart';
import 'package:exFinal_analiza_T/src/components/ButtonComponent.dart';
import 'package:exFinal_analiza_T/src/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DietPage extends StatelessWidget {
  const DietPage({Key key}) : super(key: key);

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
                _TipsDiet(),
                _BotonDiet(),
              ],
            ),
          ),
        ));
  }
}

class _TipsDiet extends StatelessWidget {
  _TipsDiet({Key key}) : super(key: key);

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
                  src="https://www.youtube.com/embed/2btyqqOjXEM"
                  title="YouTube video player"
                  frameborder="0"
                  allow="accelerometer; autoplay; clipboard-write;
                  encrypted-media; gyroscope; picture-in-picture">
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
              'Consejos alimenticios',
              style: TextStyle(fontSize: 24, color: MyColors.accentColor),
              textAlign: TextAlign.center,
            ),
          ),
          AdviceRowList(
            type: AdviceType.Diet,
            advice: "Incorporar a diario alimentos de todos los grupos.",
          ),
          AdviceRowList(
            type: AdviceType.Diet,
            advice: 'Tomar a diario 8 vasos de agua.',
          ),
          AdviceRowList(
            type: AdviceType.Diet,
            advice: 'Consume frutas y verduras.',
          ),
          AdviceRowList(
            type: AdviceType.Diet,
            advice:
                'Reducir el consumo de alimentos con alto contenido de sodio.',
          ),
          AdviceRowList(
            type: AdviceType.Diet,
            advice: 'Limitar el consumo de bebidas azucaradas.',
          ),
          AdviceRowList(
            type: AdviceType.Diet,
            advice: 'Consumir lacteos, preferentemente descremados.',
          ),
          AdviceRowList(
            type: AdviceType.Diet,
            advice: 'Al consumir carnes quitarle la grasa visible.',
          ),
          AdviceRowList(
            type: AdviceType.Diet,
            advice: 'Consumir legumbres, cereales integrales.',
          ),
          AdviceRowList(
            type: AdviceType.Diet,
            advice: 'Consumir aceite como condimento, frutas secas o semillas.',
          ),
          AdviceRowList(
            type: AdviceType.Diet,
            advice: 'El consumo de bebidas alcohólicas debe ser responsable.',
          ),
          videoView,
        ],
      ),
    );
  }
}

class _BotonDiet extends StatelessWidget {
  const _BotonDiet({
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
