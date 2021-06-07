import 'package:exFinal_analiza_T/src/providers/ApplicationState.dart';
import 'package:exFinal_analiza_T/src/utils/Colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:exFinal_analiza_T/src/pages/login_page.dart';
import 'package:exFinal_analiza_T/src/routes/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    child: MyApp(),
    create: (context) => ApplicationState(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    String _initialRoute = 'login';

    if(FirebaseAuth.instance.currentUser != null) {
      _initialRoute = 'test';
    }

    return MaterialApp(
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
    return ThemeData.light().copyWith(
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
      primaryColor: MyColors.primaryColor,
      accentColor: MyColors.accentColor,
      
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: MyColors.primaryColor,
        cursorColor: MyColors.accentColor,
        selectionHandleColor: MyColors.accentColor,
      ),
      scaffoldBackgroundColor: MyColors.backgroundColor,
    );
  }
}
