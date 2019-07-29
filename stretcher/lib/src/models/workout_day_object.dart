import 'package:stretcher/src/models/workout_stretch_object.dart';

class WorkoutDayObject {
  final String dayOfWeek;
  List<WorkoutStretchObject> workoutsOnDay = [];

  /// Key is the superset number, value is if there is a superset
  Map<String, List<WorkoutStretchObject>> superSetsLeftRight = {};
  double totalWorkoutTime = 0;

  /// key: list of doubles from 0.0 to 1.0 used in the animation controller for the workouts
  /// value: the string of the stretch used
  Map<double, String> switchWorkoutMultiplier = {};

  WorkoutDayObject(this.dayOfWeek);

  addWorkoutToDay(WorkoutStretchObject workoutStretchObject) {
    workoutsOnDay.add(workoutStretchObject);
    // add to superset list if it exists
    if (workoutStretchObject.superSetNumber.isNotEmpty && workoutStretchObject.leftRight.isNotEmpty) {
      String superSetNumber = workoutStretchObject.superSetNumber;
      if (!superSetsLeftRight.containsKey(superSetNumber)) superSetsLeftRight[superSetNumber] = [];
      superSetsLeftRight[superSetNumber].add(workoutStretchObject);
    }
  }

  generateTotalTime() {
    for (WorkoutStretchObject stretch in workoutsOnDay) {
      if (stretch.addressed) continue;
      if (stretch.superSetNumber.isEmpty) {
        _addWorkoutToTotal(stretch);
      } else {
        _addLeftRightWorkout(stretch);
      }
    }
  }

  /// add the exercise and time
  _addWorkoutToTotal(WorkoutStretchObject workoutStretchObject) {
    _incrementTotalTime(double.tryParse(workoutStretchObject.time));
    String workoutName = workoutStretchObject.exercise + (workoutStretchObject.leftRight.isNotEmpty ? '(L/R)' : '');
    switchWorkoutMultiplier.putIfAbsent(totalWorkoutTime, () => workoutName);
  }

  /// function to add to the total time and add a workout to the map
  _incrementTotalTime(double time) {
    totalWorkoutTime += time;
  }

  /// grab all the values in the superset group
  _addLeftRightWorkout(WorkoutStretchObject workoutStretchObject) {
    if (superSetsLeftRight.containsKey(workoutStretchObject.superSetNumber)) {
      //Add the workout twice then address them
      for (int i = 1; i <= 2; i++) {
        for (WorkoutStretchObject stretch in superSetsLeftRight[workoutStretchObject.superSetNumber]) {
          _addWorkoutToTotal(stretch);
          if (i == 2) {
            stretch.addressed = true;
          }
        }
      }
    }
  }
}
