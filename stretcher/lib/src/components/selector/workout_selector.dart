import 'package:flutter/material.dart';
import 'package:stretcher/src/components/selector/day_selctor.dart';

import 'package:stretcher/src/components/selector/week_selector.dart';
import 'package:stretcher/src/stores/selector_store.dart';

class WorkoutSelector extends StatefulWidget {
  final SelectorStore selectorStore;

  WorkoutSelector(this.selectorStore);

  @override
  WorkoutSelectorState createState() => WorkoutSelectorState();
}

class WorkoutSelectorState extends State<WorkoutSelector> {
  @override
  Widget build(BuildContext context) {
    Widget contentWidget;
    switch (widget.selectorStore.currentView) {
      case CurrentView.week:
        contentWidget = WeekSelector(widget.selectorStore);
        break;
      case CurrentView.day:
        contentWidget = DaySelector(widget.selectorStore.dateWeekMap[widget.selectorStore.currentWeek]);
        break;
      case CurrentView.content:
        break;
    }

    return contentWidget;
  }
}
