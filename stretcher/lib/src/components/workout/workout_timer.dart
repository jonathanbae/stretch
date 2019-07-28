import 'package:flutter/material.dart';
import 'package:stretcher/src/static_files/static_styles.dart';

class WorkoutTimer extends StatefulWidget {
  WorkoutTimer();

  @override
  WorkoutTimerState createState() => WorkoutTimerState();
}

class WorkoutTimerState extends State<WorkoutTimer> with TickerProviderStateMixin {
  AnimationController controller;
  Widget playIcon;

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
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
    return Row(
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
//                setIconForRun(forceButtonToggle: true);
              } else {
                controller.reverse(from: controller.vz   ? 1.0 : controller.value);
              }
            },
          ),
        ),
      ],
    );
  }
}
