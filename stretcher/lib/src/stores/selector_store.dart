import 'dart:convert';

//import static json files
import 'package:stretcher/src/models/workout_day_object.dart';
import 'package:stretcher/src/models/workout_stretch_object.dart';
import 'package:stretcher/src/static_files/day_json.dart';

// Object imports
import 'package:stretcher/src/models/workout_week_object.dart';

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
  Map<String, WorkoutWeekObject> dateWeekMap = {};

  /// Store actual object content
  Map<String, Object> workoutMap = {};

  SelectorStore() {
    _initializeDates();
    _initializeDayDataMaps();
  }

  /***********************
   ****** Methods ********
   ***********************/

  /// Initialize all of the days present
  void _initializeDates() {
    /// Initialize the 14 weeks of data
    for (int i = 1; i <= 14; i++) {
      String weekId = 'Week ' + i.toString();
      dateWeekMap[weekId] = new WorkoutWeekObject(weekId);
    }
  }

  /// Go through all static json files and build each day
  void _initializeDayDataMaps() {
    //Monday
    List<dynamic> mondayDecode = json.decode(monday);
    _createDayData(mondayDecode, 'Monday');
  }

  _createDayData(List<dynamic> decodedWorkouts, String dayOfWeek) {
    WorkoutDayObject tempDayWorkout;
    //Iterate over json decoded values
    for (Map<String, dynamic> decodedRow in decodedWorkouts) {
      // Create temporary stretch object
      WorkoutStretchObject tempStretch = new WorkoutStretchObject.fromJson(decodedRow);
      //If start of new week, create new object
      if (decodedRow['Week'] != '') {
        tempDayWorkout = new WorkoutDayObject(dayOfWeek);
        //Add to map of workouts if the key exists
        String weekKey = 'Week ' + decodedRow['Week'];
        if (dateWeekMap.containsKey(weekKey)) dateWeekMap[weekKey].addWorkoutToMap(tempDayWorkout, dayOfWeek);
      }
      tempDayWorkout.addWorkoutToDay(tempStretch);
    }
  }

  void selectWeek(String weekId) {
    currentView = CurrentView.day;
    currentWeek = weekId;
  }

/***********************
 ****** Getters ********
 ***********************/
}
