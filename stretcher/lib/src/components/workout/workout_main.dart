import 'dart:async';
import 'dart:math' as math;

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

class WorkoutViewState extends State<WorkoutView> with TickerProviderStateMixin {
  AnimationController controller;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.selectorStore.currentWeek + ' ' + widget.selectorStore.currentDay),
      ),
      body: Column(
        children: <Widget>[
          new Expanded(child: _buildTimer()),
          new Expanded(child: _buildTimerStartStop()),
          new Expanded(child: _buildDayList()),
        ],
      ),
    );
  }

  Widget _buildTimer() {
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Text(
            timerString,
            style: StretcherStyles().biggerFont,
          );
        });
  }

  Widget _buildTimerStartStop() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FloatingActionButton(
            child: AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, Widget child) {
                return Icon(controller.isAnimating ? Icons.pause : Icons.play_arrow);
              },
            ),
            onPressed: () {
              if (controller.isAnimating)
                controller.stop();
              else {
                controller.reverse(from: controller.value == 0.0 ? 1.0 : controller.value);
              }
            },
          )
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
      onTap: () {},
    );
  }
}
