class WorkoutObject {
  List<String> daysOfWeek = [];
  final String weekId;

  WorkoutObject(this.weekId){
    _initialize();
  }

  _initialize(){
    daysOfWeek  = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  }
}