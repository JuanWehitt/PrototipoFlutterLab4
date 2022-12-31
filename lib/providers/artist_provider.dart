import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:prototipo_flutter_lab4/model/artist.dart';

class ArtistProvider extends ChangeNotifier {
  String _apiToken = dotenv.env['API_TOKEN_SPOTIFY'].toString();
  final String _baseUrl = 'localhost:3000';
  final String _idArtist = "4gzpq5DPGxSnKTe4SA8HAU";
  //Artist artist;
  //List<PhotoInfo> photos = [];

  ArtistProvider() {
    _apiToken =
        "BQCm4TX4WGZt4ka4K9uHO7rym3JXEvVNi-C8H961DuZMqL_YzYJSHvATXb7dXcbjdN--VArNbBddAaZOTfwrPkVsJUCBGrldU02j6l2M1WQcXgaLrg4frxK6HvNHK-ITM7WKVWkFeVBw67VC6NgRKm0tYy2qTNwilKqEuwmy6ZdLA5PFTAH9rIOmPxyCqRD5xYweL_Nxpyfmc_aNCHji0g";
    print('ArtistProvider   init....................');
    this.getInfo();
  }

  getInfo() async {
    final url = Uri.http(_baseUrl, "/artist/$_idArtist");
    //final url = Uri.parse(_baseUrl + "/artist/$_idArtist");
    //print(url);
    print(_apiToken);
    final response = await http.get(url, headers: {'access_token': _apiToken});
    //print(url);
    var data;
    data = json.decode(response.body);
    if (data['code'] == 200) {
      data = ArtistModel.fromJson(response.body);
      print(data);
    } else {
      print("No hay resultados revise el token");
      //print(data);
    }
    //final data = NewPhotosModel.fromJson(response.body);

    //this.photos = [...data];

    notifyListeners();
  }
}
