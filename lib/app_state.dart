import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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

  String _DeviceCurrentLoctationAddress = '';
  String get DeviceCurrentLoctationAddress => _DeviceCurrentLoctationAddress;
  set DeviceCurrentLoctationAddress(String value) {
    _DeviceCurrentLoctationAddress = value;
  }

  List<DocumentReference> _categories = [];
  List<DocumentReference> get categories => _categories;
  set categories(List<DocumentReference> value) {
    _categories = value;
  }

  void addToCategories(DocumentReference value) {
    categories.add(value);
  }

  void removeFromCategories(DocumentReference value) {
    categories.remove(value);
  }

  void removeAtIndexFromCategories(int index) {
    categories.removeAt(index);
  }

  void updateCategoriesAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    categories[index] = updateFn(_categories[index]);
  }

  void insertAtIndexInCategories(int index, DocumentReference value) {
    categories.insert(index, value);
  }

  bool _displayPlacePicker = false;
  bool get displayPlacePicker => _displayPlacePicker;
  set displayPlacePicker(bool value) {
    _displayPlacePicker = value;
  }
}
