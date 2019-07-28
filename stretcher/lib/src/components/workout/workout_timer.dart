import 'package:flutter/material.dart';
import 'package:stretcher/src/static_files/static_styles.dart';

class WorkoutTimer extends StatefulWidget {
  WorkoutTimer(this.workoutDuration);

  final Duration workoutDuration;

  @override
  WorkoutTimerState createState() => WorkoutTimerState();
}

class WorkoutTimerState extends State<WorkoutTimer> with TickerProviderStateMixin {
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
      duration: widget.workoutDuration,
      value: 1,
    );
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
        Text(
          "Count Down",
          style: StretcherStyles().workoutFont,
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
