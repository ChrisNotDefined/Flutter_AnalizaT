import 'package:exFinal_analiza_T/src/components/AppBarConponent.dart';
import 'package:exFinal_analiza_T/src/components/ButtonComponent.dart';
import 'package:exFinal_analiza_T/src/components/LoadingIndicatorComponent.dart';
import 'package:exFinal_analiza_T/src/providers/ApplicationState.dart';
import 'package:exFinal_analiza_T/src/utils/Colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarComponent(),
        preferredSize: const Size(double.infinity, kToolbarHeight),
      ),
      body: HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ApplicationState>(context);

    return Stack(
      children: [
        Container(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(5.0),
              height: MediaQuery.of(context).size.height - kToolbarHeight - 25,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Bienvenido',
                    style: TextStyle(
                      fontSize: 40,
                      color: MyColors.accentColor,
                    ),
                  ),
                  Text(
                    state.user?.nombre ?? '',
                    style: TextStyle(
                      color: MyColors.accentColor,
                      fontSize: 20.0,
                    ),
                  ),
                  _HomeOptions(),
                ],
              ),
            ),
          ),
        ),
        state.isLoadingUser || state.user == null || state.isLoadingAnalysis
            ? LoadingIndicator()
            : Container(),
      ],
    );
  }
}

class _HomeOptions extends StatelessWidget {
  const _HomeOptions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget signOutButton = Container(
      height: 60,
      child: ButtonComponent(
        child: Icon(
          Icons.exit_to_app,
          color: MyColors.accentColor,
          size: 40,
        ),
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          // Navigator.of(context).pushReplacementNamed('login');
        },
      ),
    );

    void _validateAnalysis() async {
      final state = Provider.of<ApplicationState>(context, listen: false);

      await state.fetchAnalysis();

      if (state.currentAnalysis == null) {
        Navigator.of(context).pushNamed('test');
      } else {
        Navigator.of(context).pushNamed('results');
      }
    }

    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OptionButton(
            label: 'Leer análisis',
            icon: SvgPicture.asset('assets/svg/sample.svg'),
            onTap: _validateAnalysis,
          ),
          OptionButton(
            label: 'Registra tus medidas',
            icon: SvgPicture.asset('assets/svg/scale.svg'),
            onTap: () => Navigator.of(context).pushNamed('measures'),
          ),
          signOutButton,
        ],
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final void Function() onTap;
  final String label;

  /// Widget para usar como imágen o ícono
  final Widget icon;

  const OptionButton({
    Key key,
    @required this.onTap,
    @required this.icon,
    @required this.label,
  }) : super(key: key);

  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: this.icon,
            height: MediaQuery.of(context).size.width / 5,
          ),
          SizedBox(height: 10.0),
          Text(
            this.label,
            style: TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

    final BoxDecoration buttonDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(9999),
      color: MyColors.accentLight,
      boxShadow: [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(0.0, 10.0),
          blurRadius: 10.0,
        )
      ],
    );

    return InkWell(
      highlightColor: Colors.pink.withAlpha(20),
      splashColor: MyColors.accentColor.withAlpha(155),
      borderRadius: BorderRadius.circular(9999),
      onTap: this.onTap,
      child: Ink(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.width / 2,
        decoration: buttonDecoration,
        child: content,
      ),
    );
  }
}
