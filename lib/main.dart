import 'package:exFinal_analiza_T/src/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:exFinal_analiza_T/src/pages/login_page.dart';
import 'package:exFinal_analiza_T/src/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Analiza-T",
      theme: ThemeData(
        primaryColor: Color(MyColors.primaryColor),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        print('Fallback route');
        return MaterialPageRoute(
          builder: (BuildContext context) => LoginPage(),
        );
      },
    );
  }
}
