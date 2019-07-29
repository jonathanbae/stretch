import 'package:flutter/material.dart';
import 'package:stretcher/src/static_files/static_styles.dart';
import 'package:flutter/services.dart';

class WorkoutTimer extends StatefulWidget {
  WorkoutTimer(this.workoutDuration, this.switchWorkoutMultiplier, this.totalWorkoutTime);

  final Duration workoutDuration;
  final Map<double, String> switchWorkoutMultiplier;
  final double totalWorkoutTime;

  @override
  WorkoutTimerState createState() => WorkoutTimerState();
}

class WorkoutTimerState extends State<WorkoutTimer> with TickerProviderStateMixin {
  AnimationController controller;
  List<double> switchTimes = new List<double>();
  int switchTimesIteratorCount = 0;

  String get timerString {
    double currentValue = controller.value == 0.0 ? 1.0 : controller.value;
    Duration duration = controller.duration * currentValue;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  String get currentWorkoutString {
    //Get the current value and check the map values
    if (switchTimesIteratorCount < switchTimes.length &&
        controller.value < switchTimes.elementAt(switchTimesIteratorCount) &&
        controller.value != 0.0) {
      _switchToNextWorkout();
    } else if (controller.value == 0.0) {
      //play concluding sound
      switchTimesIteratorCount = 0;
    }
    return widget.switchWorkoutMultiplier.values.elementAt(switchTimesIteratorCount);
  }

  _switchToNextWorkout(){
    //play the sound to switch
    SystemSound.play(SystemSoundType.click);
    // iterate to the next value in list
    switchTimesIteratorCount++;
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: widget.workoutDuration,
      value: 1,
    );
    _buildSwitchTimesValues();
  }

  _buildSwitchTimesValues() {
    //initialize first value
    for (double realTime in widget.switchWorkoutMultiplier.keys) {
      switchTimes.add(1 - (realTime / widget.totalWorkoutTime));
    }
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildTimer(),
        _buildTimerStartStop(),
      ],
    );
  }

  Widget _buildTimer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Container(
          child: AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, Widget child) {
                return Text(
                  currentWorkoutString,
                  style: StretcherStyles().workoutFont,
                );
              }),
        ),
        new Container(
          child: AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, Widget child) {
                return Text(
                  timerString,
                  style: StretcherStyles().timerFont,
                );
              }),
        ),
      ],
    );
  }

  Widget _buildTimerStartStop() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Container(
          child: FloatingActionButton(
            child: AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, Widget child) {
                return Icon(controller.isAnimating ? Icons.pause : Icons.play_arrow);
              },
            ),
            onPressed: () {
              if (controller.isAnimating) {
                controller.stop();
              } else {
                controller.reverse(from: controller.value == 0.0 ? 1.0 : controller.value);
              }
            },
          ),
        ),
      ],
      //TODO build a reset button
    );
  }
}
