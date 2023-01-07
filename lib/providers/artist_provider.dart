// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:prototipo_flutter_lab4/main.dart';
import 'package:prototipo_flutter_lab4/model/artist.dart';

class ArtistProvider extends ChangeNotifier {
  String _apiToken = dotenv.env['API_TOKEN_SPOTIFY'].toString();
  final String _baseUrl = 'localhost:3000';
  final String _idArtist = "4gzpq5DPGxSnKTe4SA8HAU";
  bool loadData = false;
  ArtistData artista = ArtistData(
      externalUrls: ExternalUrls(spotify: "spotify"),
      followers: Followers(href: "href", total: 0),
      genres: [],
      href: "href",
      id: "id",
      images: [],
      name: "name",
      popularity: 0,
      type: "type",
      uri: "uri");

  ArtistProvider() {
    _apiToken = MyApp().token;
    this.getInfo();
  }

  getInfo() async {
    final url = Uri.http(_baseUrl, "/artist/$_idArtist");

    try {
      final response =
          await http.get(url, headers: {'access_token': _apiToken});
      final artist = ArtistModel.fromJson(response.body);
      //print(response.body);
      if (artist.code == 200) {
        this.loadData = true;
        //print(artist.data.images[0].url);
        this.artista = artist.data;
      } else {
        print("No hay resultados revise el token");
      }
    } catch (e) {
      print('error $e');
    }
    notifyListeners();
  }
}
