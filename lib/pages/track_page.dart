import 'package:flutter/material.dart';
import 'package:prototipo_flutter_lab4/pages/lista_tracks.dart';
import 'package:prototipo_flutter_lab4/themes/default_theme.dart';
import 'package:prototipo_flutter_lab4/widgets/card_track.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';

class CardPage extends StatelessWidget {
  //final int nro;

  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _handlerPage(),
      child: Scaffold(
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
          // ignore: prefer_const_constructors
          body: ListView(children: [CardTrack(nro: ListViewPage.seleccionado)]),
          floatingActionButton: const FavoritoActionButton()),
    );
  }
}

class FavoritoActionButton extends StatelessWidget {
  const FavoritoActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final iconoMeGusta = Provider.of<_handlerPage>(context);

    return FloatingActionButton(
      onPressed: () => iconoMeGusta.toggle(),
      backgroundColor:
          DefaultTheme.defaultTheme.floatingActionButtonTheme.backgroundColor,
      foregroundColor: (iconoMeGusta.meGusta
          ? Color.fromARGB(255, 255, 0, 0)
          : DefaultTheme
              .defaultTheme.floatingActionButtonTheme.foregroundColor),
      child: const Icon(Icons.favorite),
    );
  }
}

class _handlerPage extends ChangeNotifier {
  bool _meGusta = false;

  bool get meGusta => _meGusta;

  set meGusta(bool value) {
    _meGusta = value;
    notifyListeners();
  }

  void toggle() {
    _meGusta = !_meGusta;
    //print(_meGusta);
    notifyListeners();
  }
}
