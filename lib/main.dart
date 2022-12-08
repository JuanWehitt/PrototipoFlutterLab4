import 'package:flutter/material.dart';
import 'package:prototipo_flutter_lab4/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var themeData = ThemeData(
      primarySwatch: Colors.blueGrey,
    );
    return MaterialApp(
        title: 'prototipo flutter',
        debugShowCheckedModeBanner: false,
        theme: themeData,
        initialRoute: 'home',
        routes: {
          'home': (context) => const HomePage(),
          'listaRegistros': (context) => const ListViewPage(),
        });
  }
}
