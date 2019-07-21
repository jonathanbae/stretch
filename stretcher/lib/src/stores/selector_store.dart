import 'package:flutter/material.dart';

class SelectorStore {
  List<String> dateWeekSet = [];
  TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  /// Store actual object content
  Map<String, Object> workoutMap = {};

  SelectorStore() {
    _initializeDates();
  }

  void _initializeDates() {
    for (int i = 1; i <= 14; i++) {
      dateWeekSet.add('Week ' + i.toString());
    }
  }

  /***********************
   ****** Getters ********
   ***********************/

  ///big Font Style
  TextStyle get biggerFont => _biggerFont;
}
