import 'dart:convert';

//import static json files
import 'package:stretcher/src/models/workout_day_object.dart';
import 'package:stretcher/src/models/workout_stretch_object.dart';
import 'package:stretcher/src/static_files/day_json.dart';

// Object imports
import 'package:stretcher/src/models/workout_week_object.dart';

class SelectorStore {
  /***********************
   ****** Fields ********
   ***********************/

  /// View to be shown on home
  String currentWeek;
  String currentDay;

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
    //Monday
    List<dynamic> tuesdayDecode = json.decode(tuesday);
    _createDayData(tuesdayDecode, 'Tuesday');
    //Monday
    List<dynamic> wednesdayDecode = json.decode(wednesday);
    _createDayData(wednesdayDecode, 'Wednesday');
    //Monday
    List<dynamic> thursdayDecode = json.decode(thursday);
    _createDayData(thursdayDecode, 'Thursday');
    //Monday
    List<dynamic> fridayDecode = json.decode(friday);
    _createDayData(fridayDecode, 'Friday');
    //Monday
    List<dynamic> saturdayDecode = json.decode(saturday);
    _createDayData(saturdayDecode, 'Saturday');
    //Monday
    List<dynamic> sundayDecode = json.decode(sunday);
    _createDayData(sundayDecode, 'Sunday');

  }

  _createDayData(List<dynamic> decodedWorkouts, String dayOfWeek) {
    WorkoutDayObject tempDayWorkout;
    //Iterate over json decoded values
    for (Map<String, dynamic> decodedRow in decodedWorkouts) {
      // Create temporary stretch object
      WorkoutStretchObject tempStretch = new WorkoutStretchObject.fromJson(decodedRow);
      //If start of new week, create new object
      if (decodedRow['Week'] != '') {
        // generate time map before object is reset
        if(tempDayWorkout != null) tempDayWorkout.generateTotalTime();

        // set to a new week
        tempDayWorkout = new WorkoutDayObject(dayOfWeek);
        //Add to map of workouts if the key exists
        String weekKey = 'Week ' + decodedRow['Week'];
        if (dateWeekMap.containsKey(weekKey)) dateWeekMap[weekKey].addWorkoutToMap(tempDayWorkout, dayOfWeek);
      }
      tempDayWorkout.addWorkoutToDay(tempStretch);
    }
  }

  void selectWeek(String weekId) {
    currentWeek = weekId;
  }

  /// Get the current week object
  WorkoutWeekObject selectedWorkoutWeekObject(String currentWeek) {
    return dateWeekMap[currentWeek];
  }

  void selectDayOfWeek(String dayId) {
    currentDay = dayId;
  }

/***********************
 ****** Getters ********
 ***********************/

}
