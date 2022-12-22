import 'package:prototipo_flutter_lab4/model/track.dart';

class Album {
  String _nombre = '';
  int _cantTracks = 0;
  List<Track> _tracks = [];

  Album(String nombre) {
    _nombre = nombre;
  }

  void addTrack(Track track) {
    _tracks.add(track);
  }

  void deleteTrack(Track track) {
    _tracks.remove(track);
  }

  Track getTrack(int index) {
    return _tracks.elementAt(index);
  }

  int get cantTracks => _cantTracks;

  set cantTracks(int cantTracks) {
    _cantTracks = cantTracks;
  }

  String get nombre => _nombre;

  set nombre(String nombre) {
    _nombre = nombre;
  }
}
