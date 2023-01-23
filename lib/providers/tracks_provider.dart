// ignore_for_file: avoid_print
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:prototipo_flutter_lab4/main.dart';

import 'package:prototipo_flutter_lab4/model/tracks_Album.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/track.dart';

class TracksProvider extends ChangeNotifier {
  String _apiToken = dotenv.env['API_TOKEN_SPOTIFY'].toString();
  final String _baseUrl = 'localhost:3000';
  //final String _idArtist = "4gzpq5DPGxSnKTe4SA8HAU";
  String _idAlbum = "";
  bool loadData = false;
  List<Track> tracks = [];
  int pointer = 0;

  TracksProvider() {
    _apiToken = MyApp().token;
    //this.getInfo();
  }

  setAndLoadTracksAlbum(String idAlbum) {
    this._idAlbum = idAlbum;
    //loadData = false;
    getInfo();
  }

  getInfo() async {
    final url = Uri.http(_baseUrl, "/albums/$_idAlbum/tracks");
    //print(url);

    ///albums/:id/tracks?limit=11&offset=5

    try {
      final response =
          await http.get(url, headers: {'access_token': _apiToken});
      //print("entro hasta aca");
      final tracksAlbumModel = TracksAlbumModel.fromJson(response.body);
      if (tracksAlbumModel.code == 200) {
        this.loadData = true;
        //print(tracksAlbumModel.data.items.length);
        this.tracks = [...tracksAlbumModel.data.items];

        setearFavoritos();
        notifyListeners();
      } else {
        print("No hay resultados revise el token");
      }
    } catch (e) {
      print('error $e');
    }
  }

  void setearFavoritos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.tracks.forEach((element) {
      prefs.get('f_${element.id}') != null ? element.setFavorite(true) : null;
    });
  }
}
