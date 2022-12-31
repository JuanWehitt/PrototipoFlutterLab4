import 'package:flutter/material.dart';
import 'package:prototipo_flutter_lab4/pages/lista_tracks.dart';
import 'package:prototipo_flutter_lab4/themes/default_theme.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';

class CardPage extends StatelessWidget {
  //final int nro;

  CardPage({super.key});

  final PageController pageController = PageController(
    initialPage: 0,
    //viewportFraction:0.5
  );

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
          body: SizedBox(
            width: double.infinity,
            child: PageView(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                children: [
                  CardTrack(nro: ListViewPage.seleccionado),
                  NotesTrack(nro: ListViewPage.seleccionado)
                ]),
          ),
          floatingActionButton: const FavoritoActionButton(),
          bottomNavigationBar: ControlNavigation()),
    );
  }
}

class ControlNavigation extends StatelessWidget {
  ControlNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final botonera = Provider.of<_handlerPage>(context);

    return BottomNavigationBar(
        currentIndex: botonera.botonActual,
        onTap: (value) {
          botonera.botonActual = value;
        },
        selectedLabelStyle: DefaultTheme
            .defaultTheme.bottomNavigationBarTheme.selectedLabelStyle,
        selectedIconTheme: DefaultTheme
            .defaultTheme.bottomNavigationBarTheme.selectedIconTheme,
        unselectedIconTheme: DefaultTheme
            .defaultTheme.bottomNavigationBarTheme.unselectedIconTheme,
        enableFeedback: false,
        elevation: 10,
        items: const [
          BottomNavigationBarItem(
              label: 'Info', icon: Icon(Icons.music_note_rounded)),
          BottomNavigationBarItem(
              label: 'Mis Notas', icon: Icon(Icons.queue_music_rounded)),
        ]);
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
  int _botonActual = 0;

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

  int get botonActual => _botonActual;

  set botonActual(int value) {
    _botonActual = value;
    notifyListeners();
  }
}
