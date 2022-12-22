class Track {
  int _id = 0;
  String _nombre = '';
  String _letra = '';
  String _misNotas = '';

  Track(int id, String nombre) {
    _nombre = nombre;
    _id = id;
  }

  String get misNotas => _misNotas;
  set misNotas(String misNotas) {
    _misNotas = misNotas;
  }

  int get id => _id;
  set id(int id) {
    _id = id;
  }

  String get nombre => _nombre;
  set nombre(String nombre) {
    _nombre = nombre;
  }

  String get letra => _letra;
  set letra(String letra) {
    _letra = letra;
  }
}
