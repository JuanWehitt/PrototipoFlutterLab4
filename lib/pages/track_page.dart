import 'package:flutter/material.dart';
import 'package:prototipo_flutter_lab4/widgets/card_track.dart';
import '../widgets/widgets.dart';

class CardPage extends StatelessWidget {
  final String nombre;
  final String autores;
  final String compositores;

  const CardPage(
      {required this.nombre,
      required this.autores,
      required this.compositores,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Cancion 1"),
          elevation: 10,
          leading: InkWell(
              child: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'listaTracks');
            },
            icon: Icon(Icons.arrow_back),
          )),
          automaticallyImplyLeading: false,
        ),
        //drawer: const DrawerMenu(),
        // ignore: prefer_const_constructors
        body: ListView(children: [
          CardTrack(
              nombre: nombre, autores: autores, compositores: compositores)
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("presiono me gusta");
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.favorite),
        ));
  }
}
