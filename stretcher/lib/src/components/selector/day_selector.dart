import 'package:flutter/material.dart';
import 'package:stretcher/src/models/workout_object.dart';
import 'package:stretcher/src/static_files/static_styles.dart';

class DaySelector extends StatefulWidget {
  final WorkoutObject workoutObject;
  DaySelector(this.workoutObject);

  @override
  DaySelectorState createState() => DaySelectorState();
}

class DaySelectorState extends State<DaySelector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.workoutObject.weekId),
      ),
      body: _buildDayList(),
    );
  }

  Widget _buildDayList(){
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(
              color: Colors.black,
            ),
        padding: const EdgeInsets.all(16.0),
        itemCount: widget.workoutObject.daysOfWeek.length,
        itemBuilder: _buildDateRow);
  }

  Widget _buildDateRow(BuildContext context, int index) {
    return ListTile(
      title: Text(
        widget.workoutObject.daysOfWeek[index],
        style: StretcherStyles().biggerFont,
      ),
      trailing: Icon(
          Icons.keyboard_arrow_right
      ),
    );
  }
}
