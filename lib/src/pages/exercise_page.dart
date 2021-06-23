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
            child: Column(
          children: [_TipsExcersice(), _BotonExcersice()],
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
    height: 315,
    child: WebView(
      initialUrl: Uri.dataFromString(
              '<iframe width="100%" height="290" src="https://www.youtube.com/embed/0YRX4pEP6pY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"></iframe>',
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
            '1. Levantarte mas temprano',
            style: label,
          ),
          Text('2. Dedica 6 dias de la semana', style: label),
          Text('3. Elige una actividad', style: label),
          Text('4. Invierte', style: label),
          Text('5. Metas a corto plazo', style: label),
          Text('6. Anota resultados', style: label),
          Text('7. Desafiante', style: label),
          Text('8. Dale un significado personal', style: label),
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
