import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:prototipo_flutter_lab4/model/albums_Artist.dart';
import '../main.dart';
import '../model/album.dart';

class AlbumsProvider extends ChangeNotifier {
  String _apiToken = dotenv.env['API_TOKEN_SPOTIFY'].toString();
  final String _baseUrl = dotenv.env['HOST'].toString(); //'localhost:3000';
  final String _idArtist =
      dotenv.env['IDARTIST'].toString(); //"4gzpq5DPGxSnKTe4SA8HAU";
  List<Album> albums = [];
  int total = 0;
  int limit = 0;
  int offset = 0;
  bool loadData = false;
  int pointer = 0;
  String? idAlbumSeleccionado;

  AlbumsProvider() {
    //_apiToken = MyApp().token;
    getInfo(offset);
  }

  getInfo(int offset) async {
    final url = Uri.http(_baseUrl, '/artist/$_idArtist/albums',
        {"include_groups": "album,single", "offset": "$offset"});
    offset == 0 ? albums = [] : null;
    try {
      final response =
          await http.get(url, headers: {'access_token': _apiToken});
      if (response.statusCode == 200) {
        final albumModel = AlbumModel.fromJson(response.body);
        this.albums.addAll(albumModel.data.items);

        this.total = albumModel.data.total;
        this.offset = albumModel.data.offset;
        this.limit = albumModel.data.limit;
        if (!next()) {
          loadData = true;
          this.albums.sort(
              (a, b) => a.releaseDate.year.compareTo(b.releaseDate.year) * -1);
          offset = 0;
        } else {
          siguientePagina();
        }
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
    return (total - (limit + offset) >= 0);
  }

  siguientePagina() {
    int nuevoOffset = limit + offset + 1;
    getInfo(nuevoOffset);
  }

  int getPointerAlbumById(String idAlbum) {
    int albumBuscado = -1;
    int index = -1;
    for (var album in albums) {
      index++;
      (idAlbum.compareTo(album.id)) == 0 ? albumBuscado = index : null;
    }
    return albumBuscado;
  }

  Album getAlbumById(String idAlbum) {
    Album? albumBuscado;
    for (var album in albums) {
      (idAlbum.compareTo(album.id)) == 0 ? albumBuscado = album : null;
    }
    return albumBuscado!;
  }
}
