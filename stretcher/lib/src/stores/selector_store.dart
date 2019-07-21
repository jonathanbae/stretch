import 'package:flutter/material.dart';

class SelectorStore {
  /***********************
   ****** Fields ********
   ***********************/

  /// Store all the weeks
  List<String> dateWeekList = [];

  /// Store actual object content
  Map<String, Object> workoutMap = {};

  TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  SelectorStore() {
    _initializeDates();
  }

  /***********************
   ****** Methods ********
   ***********************/

  /// Initialize the 14 weeks of data
  void _initializeDates() {
    for (int i = 1; i <= 14; i++) {
      String weekValue = 'Week ' + i.toString();
      dateWeekList.add(weekValue);
    }
  }

  /***********************
   ****** Getters ********
   ***********************/
  ///big Font Style
  TextStyle get biggerFont => _biggerFont;
}
