import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _ttTelephoneNumber = '56545454';
  String get ttTelephoneNumber => _ttTelephoneNumber;
  set ttTelephoneNumber(String value) {
    _ttTelephoneNumber = value;
  }
}
