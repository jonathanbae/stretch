import 'package:flutter/material.dart';

import 'package:stretcher/src/stores/selector_store.dart';
import 'package:stretcher/src/components/selector/workout_selector.dart';

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
        // Add the 3 lines from here...
        primaryColor: Colors.teal,
      ), // ... to here.
      home: Scaffold(
        appBar: AppBar(
          title: Text('Startup Name Generator'),
          actions: <Widget>[
            // Add 3 lines from here...
//        IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
          ], // ... to here.
        ),
        body: WorkoutSelector(_selectorStore),
      ),
    );
  }
}
