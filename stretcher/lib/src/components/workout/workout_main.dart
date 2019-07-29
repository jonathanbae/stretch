import 'package:flutter/material.dart';
import 'package:stretcher/src/components/workout/workout_timer.dart';
import 'package:stretcher/src/models/workout_day_object.dart';
import 'package:stretcher/src/models/workout_stretch_object.dart';
import 'package:stretcher/src/static_files/static_styles.dart';
import 'package:stretcher/src/stores/selector_store.dart';

class WorkoutView extends StatefulWidget {
  final WorkoutDayObject workoutOfDay;
  final SelectorStore selectorStore;

  WorkoutView(this.workoutOfDay, this.selectorStore);

  @override
  WorkoutViewState createState() => WorkoutViewState();
}

class WorkoutViewState extends State<WorkoutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.selectorStore.currentWeek + ' ' + widget.selectorStore.currentDay),
      ),
      body: Column(
        children: <Widget>[
          WorkoutTimer(new Duration(seconds: (widget.workoutOfDay.totalWorkoutTime * 60).round()),
              widget.workoutOfDay.switchWorkoutMultiplier, widget.workoutOfDay.totalWorkoutTime),
          new Expanded(
            child: _buildDayList(),
          ),
        ],
      ),
    );
  }

  Widget _buildDayList() {
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(
              color: Colors.black,
            ),
        padding: const EdgeInsets.all(16.0),
        itemCount: widget.workoutOfDay.workoutsOnDay.length,
        itemBuilder: _buildDateRow);
  }

  Widget _buildDateRow(BuildContext context, int index) {
    WorkoutStretchObject currentWorkout = widget.workoutOfDay.workoutsOnDay.elementAt(index);

    return ListTile(
      title: Text(
        currentWorkout.exercise,
        style: StretcherStyles().biggerFont,
      ),
      subtitle: Text(currentWorkout.leftRight + ' ' + currentWorkout.superSetNumber),
      trailing: Text(currentWorkout.time),
      onTap: () {},
    );
  }
}
