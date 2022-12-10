//import 'dart:html';

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
          title: const Text('Coldplay - Music of the Spheres'),
          centerTitle: true,
          elevation: 10.0,
        ),
        drawer: const DrawerMenu(),
        // ignore: prefer_const_constructors
        body: Center(
          child: const FadeInImage(
            placeholder: AssetImage('assets/images/loading.gif'),
            image:
                AssetImage('assets/images/coldplay_music_of_the_spheres.jpg'),
            fit: BoxFit.cover,
            width: double.infinity,
            height: 564,
            // ancho y alto del dispositivo : 420 x 620
          ),
        ));
  }
}
