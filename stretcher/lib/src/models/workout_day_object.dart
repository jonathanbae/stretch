import 'package:stretcher/src/models/workout_stretch_object.dart';

class WorkoutDayObject {
  final String dayOfWeek;
  List<WorkoutStretchObject> workoutOnDay = [];

  WorkoutDayObject(this.dayOfWeek);

  addWorkoutToDay(WorkoutStretchObject workoutStretchObject){
    workoutOnDay.add(workoutStretchObject);
  }
}