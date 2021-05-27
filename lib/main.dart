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
      theme: ThemeData.light().copyWith(
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyColors.accentColor, width: 4.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyColors.accentColor, width: 1.0),
          ),
          labelStyle: TextStyle(color: MyColors.accentColor),
          fillColor: Colors.white,
          filled: true,
        ),
        primaryColor: MyColors.primaryColor,
        accentColor: MyColors.accentColor,
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: MyColors.primaryColor,
          cursorColor: MyColors.accentColor,
          selectionHandleColor: MyColors.accentColor,
        ),
        scaffoldBackgroundColor: MyColors.backgroundColor,
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
