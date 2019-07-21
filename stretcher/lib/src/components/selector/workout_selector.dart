import 'package:flutter/material.dart';

import 'package:stretcher/src/components/selector/date_selector.dart';
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
    return DateSelector(widget.selectorStore);
  }
}
