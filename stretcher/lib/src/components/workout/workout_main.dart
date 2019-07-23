import 'package:flutter/material.dart';
import 'package:stretcher/src/models/workout_stretch_object.dart';
import 'package:stretcher/src/static_files/static_styles.dart';
import 'package:stretcher/src/stores/selector_store.dart';

class WorkoutView extends StatefulWidget {
  final List<WorkoutStretchObject> workoutOfDay;
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
      body: _buildDayList(),
    );
  }

  Widget _buildDayList() {
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.black,
        ),
        padding: const EdgeInsets.all(16.0),
        itemCount: widget.workoutOfDay.length,
        itemBuilder: _buildDateRow);
  }

  Widget _buildDateRow(BuildContext context, int index) {
    WorkoutStretchObject currentWorkout = widget.workoutOfDay.elementAt(index);

    return ListTile(
      title: Text(
        currentWorkout.exercise,
        style: StretcherStyles().biggerFont,
      ),
      subtitle: Text(currentWorkout.leftRight + ' ' + currentWorkout.superSetNumber),
      trailing: Text(currentWorkout.time),
      onTap: () {
      },
    );
  }
}
