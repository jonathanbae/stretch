import 'package:stretcher/src/models/workout_day_object.dart';

class WorkoutWeekObject {
  Map<String, WorkoutDayObject> workoutsOnDays = {};
  final String weekId;

  WorkoutWeekObject(this.weekId);

  addWorkoutToMap(WorkoutDayObject workoutDayObject, String day) {
    workoutsOnDays[day] = workoutDayObject;
  }
}
