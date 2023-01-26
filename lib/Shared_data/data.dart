import 'package:shared_preferences/shared_preferences.dart';

class Favorites {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static List<String> getKeys() {
    return _prefs.getKeys().toList();
  }

  static addFavorite(String idAlbum, String idTrack) {
    List<String>? lista = _prefs.getStringList(idAlbum) ?? [];
    !lista.contains(idTrack) ? lista.add(idTrack) : null;
    _prefs.setStringList(idAlbum, lista);
    //print('Agrego $id  ${_prefs.getStringList('favorites')!.length}');
  }

  static quitFavorite(String idAlbum, String idTrack) {
    List<String>? lista = _prefs.getStringList(idAlbum) ?? [];
    lista.contains(idTrack) ? lista.remove(idTrack) : null;
    _prefs.setStringList(idAlbum, lista);
    //print("intento quitar" + id);
  }

  static bool getFavorite(String idAlbum, String idTrack) {
    //print(_prefs.getStringList('favorites'));

    List<String>? lista = _prefs.getStringList(idAlbum) ?? [];
    //print('esta $lista');
    return lista.contains(idTrack);
  }

/*
  static addFavorite(String id) {
    List<String>? lista = _prefs.getStringList('favorites') ?? [];
    !lista.contains(id) ? lista.add(id) : null;
    _prefs.setStringList('favorites', lista);
    //print('Agrego $id  ${_prefs.getStringList('favorites')!.length}');
  }

  static quitFavorite(String id) {
    List<String>? lista = _prefs.getStringList('favorites') ?? [];
    lista.contains(id) ? lista.remove(id) : null;
    _prefs.setStringList('favorites', lista);
    //print("intento quitar" + id);
  }

  static bool getFavorite(String id) {
    //print(_prefs.getStringList('favorites'));
    if (_prefs.getStringList('favorites') != null) {
      List<String>? lista = _prefs.getStringList('favorites') ?? [];
      //print('esta $lista');
      return lista.contains(id);
    } else {
      //print('NO esta $id');
      return false;
    }
  }*/
}

class Notes {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static addNote(String id, String note) {
    _prefs.setString(id, note);
  }

  static quitNote(String id) {
    _prefs.remove(id);
  }

  static String? getNote(String id) {
    return _prefs.getString(id);
  }
}
