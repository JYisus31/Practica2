import 'package:flutter/material.dart';
import 'package:practica2/src/screens/intenciones_screen.dart';
import 'package:practica2/src/screens/opcion1_screen.dart';
import 'package:practica2/src/screens/propina_screen.dart';
import 'package:practica2/src/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/opc1': (BuildContext context) => opcion1Screen(),
        '/intenciones': (BuildContext context) => IntencionesScreen(),
        '/propina': (BuildContext context) => PropinasScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
