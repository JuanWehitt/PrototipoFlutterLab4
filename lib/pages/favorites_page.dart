import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:prototipo_flutter_lab4/Shared_data/data.dart';
import 'package:prototipo_flutter_lab4/main.dart';

import '../model/track.dart';

import '../model/tracks_Album.dart';
import '../themes/default_theme.dart';
import '../widgets/widgets.dart';
import 'package:http/http.dart' as http;

class ListViewPageFavorites extends StatelessWidget {
  const ListViewPageFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('mis favoritas '),
          ],
        ),
      ),
      drawer: DrawerMenu(),
      body: ListaFavoritas(),
    );
  }
}

class ListaFavoritas extends StatefulWidget {
  const ListaFavoritas({
    Key? key,
  }) : super(key: key);

  @override
  State<ListaFavoritas> createState() => _CustomListaFavoritas();
}

class _CustomListaFavoritas extends State<ListaFavoritas> {
  double _opacityLevel = 0;
  late Future<Track> futureFavorites;
  List<String> listaIdsTracks = FavoritesData.getKeys();

  Future<Track> getTrackFavorite(int index) async {
    String idTrack = listaIdsTracks[index];
    String? idAlbum = FavoritesData.getFavoriteAlbum(idTrack);
    String _apiToken = dotenv.env['API_TOKEN_SPOTIFY'].toString();
    //_apiToken = MyApp().token;
    final String baseUrl = dotenv.env['HOST'].toString();
    final url = Uri.http(baseUrl, "/albums/$idAlbum/tracks");
    final response = await http.get(url, headers: {'access_token': _apiToken});
    Track trackBuscado = Track(
        artists: [],
        explicit: false,
        externalUrls: ExternalUrls(spotify: ""),
        href: "href",
        id: "id",
        name: "name",
        previewUrl: "previewUrl",
        trackNumber: 0,
        uri: "uri",
        duration_ms: 0);
    if (response.statusCode == 200) {
      final tracksAlbumModel = TracksAlbumModel.fromJson(response.body);
      tracksAlbumModel.data.items.forEach((track) {
        track.id == idTrack ? trackBuscado = track : null;
      });
    } else {
      print("No hay snapshot revise el token");
    }
    return Track(
        artists: trackBuscado.artists,
        explicit: trackBuscado.explicit,
        externalUrls: trackBuscado.externalUrls,
        href: trackBuscado.href,
        id: trackBuscado.id,
        name: trackBuscado.name,
        previewUrl: trackBuscado.previewUrl,
        trackNumber: trackBuscado.trackNumber,
        uri: trackBuscado.uri,
        duration_ms: trackBuscado.duration_ms);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      _opacityLevel = 1;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (FavoritesData.getKeys().isEmpty) {
      return const Center(
        child: Text("Nada por aqui"),
      );
    }

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: _opacityLevel,
      child: ListView.separated(
        itemCount: FavoritesData.getKeys().length,
        separatorBuilder: (context, index) => const Divider(
          height: 5,
        ),
        itemBuilder: (context, index) {
          futureFavorites = getTrackFavorite(index);
          return FutureBuilder<Track>(
            future: futureFavorites,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListTile(
                  title: Text(snapshot.data!.name,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 18)),
                  leading: const Icon(Icons.music_note,
                      size: 40, color: DefaultTheme.primary),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.favorite),
                    ],
                  ),
                  onTap: () {},
                  visualDensity: const VisualDensity(vertical: 3.9),
                  isThreeLine: false,
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else {
                return Center(
                  child: Container(
                      width: 50,
                      height: 50,
                      child: Stack(children: [
                        Center(child: const Icon(Icons.music_note)),
                        Center(child: const CircularProgressIndicator())
                      ])),
                );
              }
            },
          );
        },
      ),
    );
  }
}
