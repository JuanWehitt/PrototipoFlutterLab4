import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:prototipo_flutter_lab4/model/album.dart';
import '../main.dart';

class AlbumsProvider extends ChangeNotifier {
  String _apiToken = dotenv.env['API_TOKEN_SPOTIFY'].toString();
  final String _baseUrl = 'localhost:3000';
  final String _idArtist = "4gzpq5DPGxSnKTe4SA8HAU";
  List<Album> albums = [];
  bool loadData = false;

  AlbumsProvider() {
    _apiToken = MyApp().token;
    getInfo();
  }

  getInfo() async {
    final url = Uri.http(_baseUrl, "/artist/$_idArtist/albums");
    print(url);
    try {
      final response =
          await http.get(url, headers: {'access_token': _apiToken});
      final albumModel = AlbumModel.fromJson(response.body);
      if (albumModel.code == 200) {
        this.loadData = true;
        this.albums = [...albumModel.data.items];
        //print(albumModel.toString());
      } else {
        print("no hay datos revise el token");
      }
    } catch (e) {
      print('error $e');
    }
    notifyListeners();
  }
}
