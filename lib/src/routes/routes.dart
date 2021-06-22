import 'package:exFinal_analiza_T/src/pages/measures_page.dart';
import 'package:flutter/material.dart';
import 'package:exFinal_analiza_T/src/pages/login_page.dart';
import 'package:exFinal_analiza_T/src/pages/register_page.dart';
import 'package:exFinal_analiza_T/src/pages/home_page.dart';
import 'package:exFinal_analiza_T/src/pages/test_page.dart';
import 'package:exFinal_analiza_T/src/pages/results_page.dart';
import 'package:exFinal_analiza_T/src/pages/recommendations_page.dart';
import 'package:exFinal_analiza_T/src/pages/exercise_page.dart';
import 'package:exFinal_analiza_T/src/pages/sleep_page.dart';
import 'package:exFinal_analiza_T/src/pages/diet_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'login': (BuildContext context) => LoginPage(),
    'register': (BuildContext context) => RegisterPage(),
    'home': (BuildContext context) => HomePage(),
    'test': (BuildContext context) => TestPage(),
    'results': (BuildContext context) => ResultsPage(),
    'recomendations': (BuildContext context) => RecommendationsPage(),
    'exercise': (BuildContext context) => ExercisePage(),
    'sleep': (BuildContext context) => SleepPage(),
    'diet': (BuildContext context) => DietPage(),
    'measures': (BuildContext context) => MeasuresPage(),
  };
}
