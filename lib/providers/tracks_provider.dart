import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:prototipo_flutter_lab4/Shared_data/data.dart';
import 'package:prototipo_flutter_lab4/main.dart';

import 'package:prototipo_flutter_lab4/model/tracks_Album.dart';

import '../model/track.dart';

class TracksProvider extends ChangeNotifier {
  String _apiToken = dotenv.env['API_TOKEN_SPOTIFY'].toString();
  final String _baseUrl = dotenv.env['HOST'].toString(); //'localhost:3000';
  String _idAlbum = "";
  bool loadData = false;
  List<Track> tracks = [];
  int pointer = -1;
  String? idTrackSeleccionado;

  TracksProvider() {
    //_apiToken = MyApp().token;
  }

  setAndLoadTracksAlbum(String idAlbum) {
    this._idAlbum = idAlbum;
    getInfo();
  }

  getInfo() async {
    final url = Uri.http(_baseUrl, "/albums/$_idAlbum/tracks");
    try {
      final response =
          await http.get(url, headers: {'access_token': _apiToken});
      if (response.statusCode == 200) {
        final tracksAlbumModel = TracksAlbumModel.fromJson(response.body);
        this.loadData = true;
        this.tracks = [...tracksAlbumModel.data.items];
        tracksAlbumModel.data.items.forEach((element) {
          element.favorite = FavoritesData.getFavorite(element.id);
        });

        notifyListeners();
      } else {
        print("No hay resultados revise el token");
      }
    } catch (e) {
      print('error $e');
    }
  }

  int getPointerTrackById(String idTrack) {
    int trackBuscado = -1;
    int index = -1;
    for (var track in tracks) {
      index++;
      (idTrack.compareTo(track.id)) == 0 ? trackBuscado = index : null;
    }
    return trackBuscado;
  }

  Track getTrackById(String idTrack) {
    Track? trackBuscado;
    for (var track in tracks) {
      (idTrack.compareTo(track.id)) == 0 ? trackBuscado = track : null;
    }
    return trackBuscado!;
  }
}
