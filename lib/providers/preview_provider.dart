import 'package:flutter/material.dart';

class PreviewProvider extends ChangeNotifier {
  bool _play = false;

  bool get playing => _play;

  void play() {
    _play = true;
    notifyListeners();
  }

  void pause() {
    _play = false;
    notifyListeners();
  }
}
