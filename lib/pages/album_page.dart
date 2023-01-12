import 'package:flutter/material.dart';
import 'package:prototipo_flutter_lab4/model/albums_Artist.dart';
import 'package:prototipo_flutter_lab4/model/artists.dart';
import 'package:prototipo_flutter_lab4/model/track.dart';
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

  //ScrollController _scrollController = ScrollController();

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
      body: ListView(children: [
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
                  //height: 300,
                )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  alignment: Alignment.center,
                  width: size.width,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                          '${compositores(album.artists)}${anio_de_album(album)} -'),
                      Text(
                          '- ${cantidad_de_canciones(album.totalTracks)} - ${explicito(tracksProvider)}'),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                  //scrollDirection: ,
                  //controller: _scrollController,
                  itemCount: tracksProvider.tracks.length,
                  //physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemExtent: 100,
                  // ignore: prefer_const_literals_to_create_immutables
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        height: 90,
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  spreadRadius: 0,
                                  offset: Offset(0, 6))
                            ]),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //Image.network('https://cdn-icons-png.flaticon.com/512/147/147133.png', width: 50, height: 50,),
                              GestureDetector(
                                child: Image.network(
                                    albumsProvider
                                        .albums[albumsProvider.pointer]
                                        .images[1]
                                        .url,
                                    scale: 0.6),
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, 'cardTrack');
                                },
                              )
                            ]));
                  }),
            ],
          ),
        ),
      ]),
    );
  }
}

String cantidad_de_canciones(int totalTracks) {
  return totalTracks == 1 ? '$totalTracks canción' : '$totalTracks canciónes';
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

class ListaTraks extends StatelessWidget {
  const ListaTraks({
    Key? key,
    required this.tracksProvider,
    required this.albumsProvider,
  }) : super(key: key);

  final TracksProvider tracksProvider;
  final AlbumsProvider albumsProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        //scrollDirection: ,
        //controller: _scrollController,
        itemCount: tracksProvider.tracks.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemExtent: 100,
        // ignore: prefer_const_literals_to_create_immutables
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 90,
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        spreadRadius: 0,
                        offset: Offset(0, 6))
                  ]),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Image.network('https://cdn-icons-png.flaticon.com/512/147/147133.png', width: 50, height: 50,),
                    GestureDetector(
                      child: Image.network(
                          albumsProvider
                              .albums[albumsProvider.pointer].images[1].url,
                          scale: 0.6),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, 'cardTrack');
                      },
                    )
                  ]));
        });
  }
}

String compositores(List<Artists> artists) {
  String cadena = "";
  for (var element in artists) {
    cadena += " - ${element.name}";
  }
  return "$cadena - ";
}
