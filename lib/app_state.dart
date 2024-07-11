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

  List<String> _EmptyList = [];
  List<String> get EmptyList => _EmptyList;
  set EmptyList(List<String> value) {
    _EmptyList = value;
  }

  void addToEmptyList(String value) {
    EmptyList.add(value);
  }

  void removeFromEmptyList(String value) {
    EmptyList.remove(value);
  }

  void removeAtIndexFromEmptyList(int index) {
    EmptyList.removeAt(index);
  }

  void updateEmptyListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    EmptyList[index] = updateFn(_EmptyList[index]);
  }

  void insertAtIndexInEmptyList(int index, String value) {
    EmptyList.insert(index, value);
  }
}
