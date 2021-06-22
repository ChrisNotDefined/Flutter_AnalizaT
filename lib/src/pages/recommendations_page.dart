import 'package:exFinal_analiza_T/src/components/AdviceComponent.dart';
import 'package:exFinal_analiza_T/src/components/AppBarConponent.dart';
import 'package:exFinal_analiza_T/src/utils/Colors.dart';
import 'package:flutter/material.dart';

class RecommendationsPage extends StatelessWidget {
  const RecommendationsPage({Key key}) : super(key: key);

  final _sportUrl =
      'https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80';

  final _sleepUrl =
      'https://images.unsplash.com/photo-1531353826977-0941b4779a1c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80';
  final _dietUrl =
      'https://images.unsplash.com/photo-1565895405138-6c3a1555da6a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarComponent(),
        preferredSize: const Size(double.infinity, kToolbarHeight),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TipsList(),
              Text('Tips', style: _subTitle()),
              SizedBox(height: 20),
              AdviceComponent(
                title: 'EJERCICIO',
                image: NetworkImage(_sportUrl),
                onTap: () {
                  Navigator.pushNamed(context, 'exercise');
                },
              ),
              SizedBox(height: 20),
              AdviceComponent(
                title: 'SUEÑO',
                image: NetworkImage(_sleepUrl),
                onTap: () {
                  Navigator.pushNamed(context, 'sleep');
                },
              ),
              SizedBox(height: 20),
              AdviceComponent(
                title: 'DIETA',
                image: NetworkImage(_dietUrl),
                onTap: () {
                  Navigator.pushNamed(context, 'diet');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TipsList extends StatelessWidget {
  const TipsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}

TextStyle _subTitle() {
  return TextStyle(
      fontSize: 30, color: MyColors.accentColor, fontWeight: FontWeight.bold);
}
