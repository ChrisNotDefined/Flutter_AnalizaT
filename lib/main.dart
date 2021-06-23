import 'package:exFinal_analiza_T/src/providers/ApplicationState.dart';
import 'package:exFinal_analiza_T/src/utils/Colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:exFinal_analiza_T/src/pages/login_page.dart';
import 'package:exFinal_analiza_T/src/routes/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider(
      child: MyApp(),
      create: (_) => ApplicationState(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<ApplicationState>(context);

    String _initialRoute = 'login';

    return MaterialApp(
      navigatorKey: appState.navigationKey,
      title: "Analiza-T",
      theme: _appThemeData(),
      debugShowCheckedModeBanner: false,
      initialRoute: _initialRoute,
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => LoginPage(),
        );
      },
    );
  }

  ThemeData _appThemeData() {
    return ThemeData(
      primaryColor: MyColors.primaryColor,
      accentColor: MyColors.accentColor,
      splashColor: MyColors.primaryColor,
      primarySwatch: Colors.pink,
      scaffoldBackgroundColor: MyColors.backgroundColor,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(10.0),
        border: OutlineInputBorder(),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyColors.accentColor, width: 3.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyColors.accentColor, width: 1.0),
        ),
        errorStyle: TextStyle(color: Colors.red),
        labelStyle: TextStyle(color: MyColors.accentColor),
        fillColor: Colors.white,
        filled: true,
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: MyColors.primaryColor,
        cursorColor: MyColors.accentColor,
        selectionHandleColor: MyColors.accentColor,
      ),
    );
  }
}
