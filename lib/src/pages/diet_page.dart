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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TipsDiet(),
              _BotonDiet(),
            ],
          ),
        ));
  }
}

class _TipsDiet extends StatelessWidget {
  _TipsDiet({Key key}) : super(key: key);

  final TextStyle label = TextStyle(
      color: MyColors.accentColor, fontWeight: FontWeight.bold, fontSize: 16.0);

  final Widget videoView = Container(
    height: 315,
    child: WebView(
      initialUrl: Uri.dataFromString(
              '<iframe width="100%" height="290" src="https://www.youtube.com/embed/2btyqqOjXEM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"></iframe>',
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
          Text(
            "1 Incorporar a diario alimentos de todos los grupos.",
            style: label,
          ),
          Text(
            '2 Tomar a diario 8 vasos de agua naturalen .',
            style: label,
          ),
          Text(
            '3 Consume frutas y verduras.',
            style: label,
          ),
          Text(
            '4 Reducir el consumo de alimentos con alto contenido de sodio.',
            style: label,
          ),
          Text(
            '5 Limitar el consumo de bebidas azucaradas',
            style: label,
          ),
          Text(
            '6 Consumir lacteos, preferentemente descremados.',
            style: label,
          ),
          Text(
            '7 Al consumir carnes quitarle la grasa visible.',
            style: label,
          ),
          Text(
            '8 Consumir legumbres, cereales integrales.',
            style: label,
          ),
          Text(
            '9 Consumir aceite como condimento, frutas secas o semillas.',
            style: label,
          ),
          Text(
            '10 El consumo de bebidas alcohólicas debe ser responsable.',
            style: label,
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
