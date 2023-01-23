import 'package:flutter/material.dart';
import 'package:prototipo_flutter_lab4/themes/default_theme.dart';
import 'package:provider/provider.dart';

import '../Shared_data/data.dart';
import '../model/album.dart';
import '../model/track.dart';
import '../providers/providers.dart';
import '../widgets/widgets.dart';

class CardPage extends StatelessWidget {
  //final int nro;

  CardPage({super.key});

  final PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.99);

  @override
  Widget build(BuildContext context) {
    final albumsProvider = Provider.of<AlbumsProvider>(context);
    final trackPreview = Provider.of<PreviewProvider>(context);
    final tracksProvider = Provider.of<TracksProvider>(context);

    if (!tracksProvider.loadData) {
      return const Center(
        child: SizedBox(
          width: 60,
          height: 60,
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Column(
            children: [
              Text(tracksProvider.tracks[tracksProvider.pointer].name),
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text(
                  'del album ${albumsProvider.albums[albumsProvider.pointer].name}',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
          elevation: 10,
          leading: InkWell(
              child: IconButton(
            onPressed: () {
              trackPreview.pause();
              Navigator.pushReplacementNamed(context, 'albumPage');
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
              children: [CardTrack(), NotesTrack()]),
        ),
        floatingActionButton: const FavoritoActionButton(),
        bottomNavigationBar: ControlNavigation(pageController));
  }
}

class ControlNavigation extends StatelessWidget {
  PageController pageController = PageController();
  ControlNavigation(this.pageController, {super.key});

  @override
  Widget build(BuildContext context) {
    //final botonera = Provider.of<TrackPageProvider>(context);
    final trackPageProvider = Provider.of<TrackPageProvider>(context);
    return BottomNavigationBar(
        currentIndex: trackPageProvider.botonActual,
        onTap: (value) {
          trackPageProvider.botonActual = value;
          pageController.animateToPage(trackPageProvider.botonActual,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn);
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
    final iconoMeGusta = Provider.of<FavoriteProvider>(context);
    final tracksProvider = Provider.of<TracksProvider>(context);
    final Track track = tracksProvider.tracks[tracksProvider.pointer];
    //print('${Favorites.getFavorite(track.id)} ${track.id}');
    //? iconoMeGusta.meGustaMucho()
    //: iconoMeGusta.noMeGusta();
    //Favorites.getFavorite(track.id);
    return FloatingActionButton(
      onPressed: () {
        iconoMeGusta.meGusta = Favorites.getFavorite(track.id);
        iconoMeGusta.toggle();
        track.favorite = iconoMeGusta.meGusta;
        iconoMeGusta.meGusta
            ? Favorites.addFavorite(track.id)
            : Favorites.quitFavorite(track.id);
      },
      backgroundColor:
          DefaultTheme.defaultTheme.floatingActionButtonTheme.backgroundColor,
      foregroundColor: Favorites.getFavorite(track.id)
          ? Color.fromARGB(255, 255, 0, 0)
          : DefaultTheme.defaultTheme.floatingActionButtonTheme.foregroundColor,
      child: const Icon(Icons.favorite),
    );
  }
}
