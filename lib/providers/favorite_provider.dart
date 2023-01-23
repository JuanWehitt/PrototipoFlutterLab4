import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  bool _meGusta = false;

  FavoriteProvider() {
    _meGusta = false;
  }

  bool get meGusta => _meGusta;

  set meGusta(bool value) {
    _meGusta = value;
    notifyListeners();
  }

  void toggle() {
    _meGusta = !_meGusta;
    notifyListeners();
  }

  void meGustaMucho() {
    _meGusta = true;
    notifyListeners();
  }

  void noMeGusta() {
    _meGusta = false;
    notifyListeners();
  }
}
