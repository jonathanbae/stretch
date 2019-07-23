import 'package:flutter/material.dart';
import 'package:stretcher/src/components/selector/day_selector.dart';
import 'package:stretcher/src/components/selector/week_selector.dart';
import 'package:stretcher/src/components/workout/workout_main.dart';
import 'package:stretcher/src/models/workout_week_object.dart';

import 'package:stretcher/src/stores/selector_store.dart';

void main() {
  SelectorStore selectorStore = new SelectorStore();
  runApp(StretcherApp(selectorStore));
}

class StretcherApp extends StatelessWidget {
  StretcherApp(this._selectorStore);

  final SelectorStore _selectorStore;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Stretch',
        theme: ThemeData(
          primaryColor: Colors.teal,
        ),
        routes: {
          '/': (context) => WeekSelector(_selectorStore),
          '/day': (context) => DaySelector(_selectorStore.dateWeekMap[_selectorStore.currentWeek], _selectorStore),
          '/workout': (context) => _generateWorkoutView(),
        });
  }

  Widget _generateWorkoutView() {
    WorkoutWeekObject workoutWeek = _selectorStore.selectedWorkoutWeekObject(_selectorStore.currentWeek);
    return WorkoutView(workoutWeek.workoutsOnDays[_selectorStore.currentDay].workoutsOnDay,
        _selectorStore);
  }
}
