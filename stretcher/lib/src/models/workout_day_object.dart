import 'package:stretcher/src/models/workout_stretch_object.dart';

class WorkoutDayObject {
  final String dayOfWeek;
  List<WorkoutStretchObject> workoutsOnDay = [];

  WorkoutDayObject(this.dayOfWeek);

  addWorkoutToDay(WorkoutStretchObject workoutStretchObject) {
    workoutsOnDay.add(workoutStretchObject);
  }

  ///Return a duration in seconds of the total workout. Add 10 seconds per stretch to transition
  Duration getWorkoutsDurations() {
    double totalDurationMultiplier = 0.0;
    int countOfStretches = 0;
    for (WorkoutStretchObject workout in workoutsOnDay) {
      totalDurationMultiplier += double.parse(workout.time);
      countOfStretches++;
    }
    return new Duration(seconds: (totalDurationMultiplier * 60).round() + (countOfStretches * 10));
  }
}
