import 'dart:html';

import 'package:flutter/material.dart';
//import 'package:flutter_app/themes/default_theme.dart';

import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
          elevation: 10.0,
        ),
        //drawer: DrawerMenu(),
        body: Center(
          child: Column(children: [
            const Text("Hola!",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                )),
            FadeInImage(
              placeholder: const AssetImage('assets/images/loading.gif'),
              image: const NetworkImage(
                  'https://www.solofondos.com/wp-content/uploads/2017/09/para-celular-fondos-de-pantalla-im%C3%A1genes-1.jpg'),
              fit: BoxFit.cover,
              width: double.infinity,
              height: size.height * 0.35,
            )
          ]),
        ));
  }
}
