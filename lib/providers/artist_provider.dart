import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:prototipo_flutter_lab4/model/artist.dart';

class ArtistProvider extends ChangeNotifier {
  final String _apiToken = dotenv.env['API_TOKEN_SPOTIFY'].toString();
  final String _baseUrl = dotenv.env['HOST'].toString();
  final String _idArtist = "2ye2Wgw4gimLv2eAKyk1NB";
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
    //_apiToken = MyApp().token;
    this.getInfo();
  }

  getInfo() async {
    final url = Uri.http(_baseUrl, "/artist/$_idArtist");
    try {
      final response =
          await http.get(url, headers: {'access_token': _apiToken});
      if (response.statusCode == 200) {
        final artist = ArtistModel.fromJson(response.body);
        this.loadData = true;
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
