import 'package:stretcher/src/models/workout_day_object.dart';

class WorkoutWeekObject {
  Map <String, List<WorkoutDayObject>> workoutsOnDays = {};
  final String weekId;

  WorkoutWeekObject(this.weekId);

  addWorkoutToMap(WorkoutDayObject workoutDayObject, String day) {
    if(workoutsOnDays.containsKey(day)) {
      workoutsOnDays[day].add(workoutDayObject);
    } else {
      workoutsOnDays[day] = [workoutDayObject];
    }
  }
}