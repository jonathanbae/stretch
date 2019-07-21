import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:stretcher/src/stores/selector_store.dart';

class DateSelector extends StatefulWidget {
  final SelectorStore selectorStore;

  DateSelector(this.selectorStore);

  @override
  DateSelectorState createState() => DateSelectorState();
}

class DateSelectorState extends State<DateSelector> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(
              color: Colors.black,
            ),
        padding: const EdgeInsets.all(16.0),
        itemCount: widget.selectorStore.dateWeekSet.length,
        itemBuilder: _buildDateRow);
  }

  Widget _buildDateRow(BuildContext context, int index) {
    bool completed = true;

    return ListTile(
      title: Text(
        widget.selectorStore.dateWeekSet.elementAt(index),
        style: widget.selectorStore.biggerFont,
      ),
      trailing: Icon(
        completed ? Icons.check_box : Icons.check_box_outline_blank,
        color: completed ? Colors.lightGreenAccent : null,
      ),
      onTap: () {
        setState(() {
          if (completed) {
          } else {}
        });
      },
    );
  }
}
