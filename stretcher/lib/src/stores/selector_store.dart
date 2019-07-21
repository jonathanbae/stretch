import 'package:flutter/material.dart';
import 'package:stretcher/src/models/workout_object.dart';

enum CurrentView {
  week,
  day,
  content,
}

class SelectorStore {
  /***********************
   ****** Fields ********
   ***********************/
  /// View to be shown on home
  CurrentView currentView = CurrentView.week;
  String currentWeek;
  /// Store all the weeks
  Map<String, WorkoutObject> dateWeekMap = {};

  /// Store actual object content
  Map<String, Object> workoutMap = {};

  ///big font style
  TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  SelectorStore() {
    _initializeDates();
  }

  /***********************
   ****** Methods ********
   ***********************/

  /// Initialize all of the days present
  void _initializeDates() {
    /// Initialize the 14 weeks of data
    for (int i = 1; i <= 14; i++) {
      String weekId = 'Week ' + i.toString();
      dateWeekMap[weekId] = new WorkoutObject(weekId);
    }
  }

  void selectWeek(String weekId) {
    currentView = CurrentView.day;
    currentWeek = weekId;
  }

  /***********************
   ****** Getters ********
   ***********************/
  ///big Font Style
  TextStyle get biggerFont => _biggerFont;
}
