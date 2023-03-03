import 'package:flutter/material.dart';
import 'package:prototipo_flutter_lab4/model/artists.dart';
import 'package:prototipo_flutter_lab4/widgets/item_track.dart';
import 'package:provider/provider.dart';
import '../model/album.dart';
import '../providers/providers.dart';

class ListViewPageAlbum extends StatefulWidget {
  const ListViewPageAlbum({super.key});

  @override
  State<ListViewPageAlbum> createState() => _CustomListViewPageState();
}

class _CustomListViewPageState extends State<ListViewPageAlbum> {
  double _opacityLevel = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {
      _opacityLevel = 1;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final albumsProvider = Provider.of<AlbumsProvider>(context);
    final int index = albumsProvider.pointer;
    final Album album = albumsProvider.albums[index];

    final tracksProvider = Provider.of<TracksProvider>(context);
    tracksProvider.setAndLoadTracksAlbum(album.id);
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
        title: Text(album.name),
        leading: InkWell(
            child: IconButton(
          onPressed: () {
            tracksProvider.loadData = false;
            Navigator.pushReplacementNamed(context, 'listaAlbums');
          },
          icon: Icon(Icons.arrow_back),
        )),
      ),
      //drawer: const DrawerMenu(),
      body: ListView(
        children: [
          AnimatedOpacity(
            opacity: _opacityLevel,
            duration: const Duration(milliseconds: 500),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Center(
                      child: Image.network(
                    album.images[0].url,
                    width: size.width * 0.8,
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    alignment: Alignment.center,
                    width: size.width * 0.99,
                    //height: 40,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              '${interpretes(album.artists)}${anio_de_album(album)} -'),
                          Text(
                              '- ${cantidad_de_canciones(album.totalTracks)} - ${explicito(tracksProvider)}'),
                        ],
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: tracksProvider.tracks.length,
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  itemBuilder: (BuildContext context, int index) {
                    return ItemTrack(index: index);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

String cantidad_de_canciones(int totalTracks) {
  return '$totalTracks cancion${totalTracks > 1 ? "es" : ""}';
}

String explicito(TracksProvider tracksProvider) {
  bool es = false;
  for (var element in tracksProvider.tracks) {
    element.explicit ? es = true : null;
  }
  return es ? "con contenido explicito -" : "";
}

String anio_de_album(Album album) {
  return album.releaseDate.year.toString();
}

String interpretes(List<Artists> artists) {
  String cadena = "";
  for (var element in artists) {
    cadena += " - ${element.name}";
  }
  return "$cadena - ";
}
