import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class LoadAlbumsProvider extends ChangeNotifier {
  final String _apiToken = dotenv.env['API_TOKEN_SPOTIFY'].toString();
  final String _baseUrl = 'localhost:3000';
  final String _idArtist = "4gzpq5DPGxSnKTe4SA8HAU";
  //List<PhotoInfo> photos = [];

  LoadAlbumsProvider() {
    if (kDebugMode) {
      print('PhotosProvider   init....................');
    }
    getInfo();
  }

  getInfo() async {
    final url = Uri.parse(_baseUrl + "/artist/$_idArtist/albums");
    final response = await http.get(url, headers: {'acces_token': _apiToken});

    print(response.body);

    //final data = json.decode(response.body);

    //final data = NewPhotosModel.fromJson(response.body);

    //this.photos = [...data];

    notifyListeners();
  }
}
