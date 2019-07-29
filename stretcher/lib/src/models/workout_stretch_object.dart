class WorkoutStretchObject {
  final String exercise;
  final String time;
  final String leftRight;
  final String superSetNumber;
  /// used to keep track if this workout was used already (based on supersets)
  bool addressed = false;

  WorkoutStretchObject(this.exercise, this.time, this.leftRight, this.superSetNumber);

  WorkoutStretchObject.fromJson(Map<String, dynamic> json)
      : exercise = json['Exercise'],
        time = json['Time'],
        leftRight = json['L/R?'],
        superSetNumber = json['SuperSet #'];
}
