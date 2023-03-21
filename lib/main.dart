import 'package:flutter/material.dart';
import 'package:recipe_app/screens/Splash.dart';
import 'package:recipe_app/screens/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RecipeApp',
        theme: ThemeData(
          fontFamily: "Poppins",
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            color: Colors.deepPurpleAccent, //<-- SEE HERE
          ),
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
          home: Splash(),
          // home: SplashScreen(
          //     seconds: 5,
          //     navigateAfterSeconds:wrlcome(),
          //     title: new Text(
          //       'Recepies',
          //       style: new TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 20.0,
          //           color: Colors.white),
          //     ),
          //     image: Image.asset('assets/images/food.jpg'),
          //     photoSize: 100.0,
          //     backgroundColor: Colors.blue,
          //     styleTextUnderTheLoader: new TextStyle(),
          //     loaderColor: Colors.white
          // )
      ),
    );
  }
}


