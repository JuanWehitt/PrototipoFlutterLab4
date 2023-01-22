import 'package:flutter/material.dart';

class TrackPageProvider extends ChangeNotifier {
  int _botonActual = 0;

  int get botonActual => _botonActual;

  set botonActual(int value) {
    _botonActual = value;
    notifyListeners();
  }
}
