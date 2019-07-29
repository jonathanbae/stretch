import 'package:stretcher/src/models/workout_stretch_object.dart';

class WorkoutDayObject {
  final String dayOfWeek;
  List<WorkoutStretchObject> workoutsOnDay = [];
  double totalWorkoutTime = 0;
  int countOfStretches = 0;

  /// key: list of doubles from 0.0 to 1.0 used in the animation controller for the workouts
  /// value: the string of the stretch used
  Map<double, String> switchWorkoutMultiplier = {};

  WorkoutDayObject(this.dayOfWeek);

  addWorkoutToDay(WorkoutStretchObject workoutStretchObject) {
    workoutsOnDay.add(workoutStretchObject);
    double temp = double.tryParse(workoutStretchObject.time);
    if (temp != null) {
      totalWorkoutTime += temp;
    }
    countOfStretches++;
    switchWorkoutMultiplier.putIfAbsent(totalWorkoutTime, () => workoutStretchObject.exercise);
  }
}
