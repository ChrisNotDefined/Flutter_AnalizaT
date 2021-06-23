import 'package:exFinal_analiza_T/src/components/AdviceListRowComponent.dart';
import 'package:exFinal_analiza_T/src/components/AppBarConponent.dart';
import 'package:exFinal_analiza_T/src/components/ButtonComponent.dart';
import 'package:exFinal_analiza_T/src/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({Key key}) : super(key: key);

  // final _sportUrl =
  //     'https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80';

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
          children: [
              _TipsExcersice(),
              _BotonExcersice(),
          ],
        ),
            )));
  }
}

class _TipsExcersice extends StatelessWidget {
  _TipsExcersice({Key key}) : super(key: key);

  final TextStyle label = TextStyle(
    color: MyColors.accentColor,
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
  );

  final videoView = Container(
    margin: EdgeInsets.symmetric(vertical: 10.0),
    height: 300,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: WebView(
        initialUrl: Uri.dataFromString('''
                    <iframe 
                      style="width:100%;height:100%;top:0;left:0;position:absolute;"
                      src="https://www.youtube.com/embed/0YRX4pEP6pY"
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
              'Consejos para hacer ejercicio',
              style: TextStyle(fontSize: 24, color: MyColors.accentColor),
              textAlign: TextAlign.center,
            ),
          ),
          AdviceRowList(advice: 'Levantate más temprano'),
          AdviceRowList(advice: 'Dedica 6 dias de la semana'),
          AdviceRowList(advice: 'Elige una actividad'),
          AdviceRowList(advice: 'Invierte'),
          AdviceRowList(advice: 'Metas a corto plazo'),
          AdviceRowList(advice: 'Anota resultados'),
          AdviceRowList(advice: 'Desafiate'),
          AdviceRowList(advice: 'Dale un significado personal'),
          videoView,
        ],
      ),
    );
  }
}

class _BotonExcersice extends StatelessWidget {
  const _BotonExcersice({
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
