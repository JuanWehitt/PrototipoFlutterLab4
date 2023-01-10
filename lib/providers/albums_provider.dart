import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:prototipo_flutter_lab4/model/album.dart';
import 'package:prototipo_flutter_lab4/providers/providers.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class AlbumsProvider extends ChangeNotifier {
  String _apiToken = dotenv.env['API_TOKEN_SPOTIFY'].toString();
  final String _baseUrl = 'localhost:3000';
  final String _idArtist = "4gzpq5DPGxSnKTe4SA8HAU";
  List<Album> albums = [];
  int total = 0;
  int limit = 0;
  int offset = 0;
  bool loadData = false;
  int pointer = 0;

  AlbumsProvider() {
    _apiToken = MyApp().token;
    offset = 0;
    getInfo(offset);
  }

  getInfo(int offset) async {
    final url = Uri.http(_baseUrl, '/artist/$_idArtist/albums',
        {"include_groups": "album,single", "offset": "$offset"});
    print(url);
    try {
      final response =
          await http.get(url, headers: {'access_token': _apiToken});
      final albumModel = AlbumModel.fromJson(response.body);
      if (albumModel.code == 200) {
        this.albums.addAll(albumModel.data.items);
        //this.albums = [...albumModel.data.items];
        this.albums.sort(
            (a, b) => a.releaseDate.year.compareTo(b.releaseDate.year) * -1);
        this.total = albumModel.data.total;
        this.offset = albumModel.data.offset;
        this.limit = albumModel.data.limit;
        print("offset $offset - limit $limit - total $total ");
        this.loadData = true;
      } else {
        print("no hay datos revise el token");
      }
    } catch (e) {
      print('error $e');
    }
    notifyListeners();
  }

  //offset 0 - limit 50 - total 105 = 105-(50+0)= 55
  //offset 51 - limit 50 - total 105 = 105-(50+51)= 4 (offset = limit + offset + 1)
  //offset 102 - limit 50 - total 105 = 105-(50+102)= -50
  //total - (limit + offset) >= 0 entonces siguiente pagina con nuevo offset
  bool next() {
    bool hay = false;
    if (total - (limit + offset) >= 0) {
      hay = true;
    }
    return hay;
  }

  siguientePagina() {
    int nuevoOffset = limit + offset + 1;
    getInfo(nuevoOffset);
  }
}
