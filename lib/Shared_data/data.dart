import 'package:shared_preferences/shared_preferences.dart';

class FavoritesData {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static List<String> getKeys() {
    List<String> lista = [];
    _prefs.getKeys().forEach((element) {
      !element.contains("note", 0) ? lista.add(element) : null;
    });
    return lista;
  }

  static addFavorite(String idAlbum, String idTrack) {
    _prefs.setString(idTrack, idAlbum);
  }

  static quitFavorite(String idAlbum, String idTrack) {
    _prefs.remove(idTrack);
  }

  static String? getFavoriteAlbum(String idTrack) {
    return _prefs.getString(idTrack);
  }

  static bool getFavorite(String idTrack) {
    return _prefs.getString(idTrack) != null ? true : false;
  }
}

class Notes {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static addNote(String id, String note) {
    _prefs.setString('note$id', note);
  }

  static quitNote(String id) {
    _prefs.remove(id);
  }

  static String? getNote(String id) {
    return _prefs.getString('note$id');
  }
}
