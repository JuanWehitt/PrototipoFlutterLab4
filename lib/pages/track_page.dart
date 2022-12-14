import 'package:flutter/material.dart';
import 'package:prototipo_flutter_lab4/pages/lista_tracks.dart';
import 'package:prototipo_flutter_lab4/themes/default_theme.dart';
import 'package:prototipo_flutter_lab4/widgets/card_track.dart';
import '../widgets/widgets.dart';

class CardPage extends StatefulWidget {
  final int nro;
  static bool meGusta = false;

  const CardPage({required this.nro, super.key});

  @override
  State<CardPage> createState() => _CardPage();
}

class _CardPage extends State<CardPage> {
  bool _meGusta = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(ListViewPage.listaDeTracks[ListViewPage.seleccionado]
                  ['title']
              .toString()),
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
        body: ListView(children: [CardTrack(nro: ListViewPage.seleccionado)]),
        floatingActionButton: FloatingActionButton(
          onPressed: _toggleMeGusta,
          backgroundColor: DefaultTheme
              .defaultTheme.floatingActionButtonTheme.backgroundColor,
          foregroundColor: (_meGusta
              ? Colors.red
              : DefaultTheme
                  .defaultTheme.floatingActionButtonTheme.foregroundColor),
          child: const Icon(Icons.favorite),
        ));
  }

  void _toggleMeGusta() {
    setState(() {
      if (_meGusta) {
        _meGusta = false;
      } else {
        _meGusta = true;
      }
    });
  }
}
