import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import '../model/artist.dart';
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coldplay'),
        centerTitle: true,
        elevation: 10.0,
      ),
      drawer: const DrawerMenu(),
      // ignore: prefer_const_constructors
      body: BodyHome(),
    );
  }
}

class BodyHome extends StatefulWidget {
  const BodyHome({
    Key? key,
  }) : super(key: key);

  @override
  State<BodyHome> createState() => _ArtistFutureState();
}

class _ArtistFutureState extends State<BodyHome> {
  late Future<Artist> futureArtist;

  Future<Artist> fetchArtist() async {
    String _apiToken = dotenv.env['API_TOKEN_SPOTIFY'].toString();
    final String _baseUrl = 'localhost:3000';
    final String _idArtist = "4gzpq5DPGxSnKTe4SA8HAU";

    _apiToken = MyApp().token;

    final url = Uri.http(_baseUrl, "/artist/$_idArtist");
    final response = await http.get(url, headers: {'access_token': _apiToken});
    final artist = ArtistModel.fromJson(response.body);

    if (artist.code == 200) {
      return artist;
    } else {
      print("No hay resultados revise el token");
      throw Exception('Failed to load artist');
    }
  }

  @override
  void initState() {
    super.initState();
    futureArtist = fetchArtist();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Artist>(
        future: futureArtist,
        builder: (BuildContext context, AsyncSnapshot<Artist> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            //print(snapshot.data);
            children = <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(snapshot.data!.data.images[0].url),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.blueGrey.withOpacity(0.9), BlendMode.color),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 300),
                    child: Column(children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite,
                            size: 50,
                            color: Colors.red,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              " ${snapshot.data!.data.followers.total} ",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Text("seguidores en",
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'PaytoneOne',
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    blurRadius: 3.0,
                                    color: Colors.black,
                                    offset: Offset(3.0, 3.0),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Container(
                                width: 193,
                                height: 76,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(15),
                                  //color: Colors.black54,
                                  image: DecorationImage(
                                    image:
                                        AssetImage("images/spotify_logo.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ]),
                  ),
                ),
              ),
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Esperando resultados...'),
              ),
            ];
          }
          return Container(
            child: children.first,
          );
        });
  }

/*
  @override
  Widget build(BuildContext context) {
    final artist = Provider.of<ArtistProvider>(context);

    if (!artist.loadData) {
      return const Center(
        child: SizedBox(
          width: 60,
          height: 60,
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(artist.artista.images[0].url),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.blueGrey.withOpacity(0.9), BlendMode.color),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 300),
          child: Column(children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite,
                  size: 50,
                  color: Colors.red,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    " ${artist.artista.followers.total} ",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                const Text("seguidores en",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'PaytoneOne',
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 3.0,
                          color: Colors.black,
                          offset: Offset(3.0, 3.0),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Container(
                      width: 193,
                      height: 76,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                        //color: Colors.black54,
                        image: DecorationImage(
                          image: AssetImage("images/spotify_logo.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ))
              ],
            ),
          ]),
        ),
      ),
    );
  }*/
}
