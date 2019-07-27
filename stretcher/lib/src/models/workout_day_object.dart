import 'package:stretcher/src/models/workout_stretch_object.dart';

class WorkoutDayObject {
  final String dayOfWeek;
  List<WorkoutStretchObject> workoutsOnDay = [];

  WorkoutDayObject(this.dayOfWeek);

  addWorkoutToDay(WorkoutStretchObject workoutStretchObject){
    workoutsOnDay.add(workoutStretchObject);
  }
}