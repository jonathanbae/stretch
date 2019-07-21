import 'package:flutter/material.dart';
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
        itemCount: widget.selectorStore.dateWeekMap.keys.length,
        itemBuilder: _buildDateRow);
  }

  Widget _buildDateRow(BuildContext context, int index) {
    String currentWeek = widget.selectorStore.dateWeekMap.keys.elementAt(index);
    bool completed = widget.selectorStore.dateWeekMap[currentWeek];

    return ListTile(
      title: Text(
        currentWeek,
        style: widget.selectorStore.biggerFont,
      ),
      trailing: Icon(
        completed ? Icons.check_box : Icons.check_box_outline_blank,
        color: completed ? Colors.lightGreenAccent : null,
      ),
      onTap: () {
        setState(() {
          if (completed) {
            widget.selectorStore.dateWeekMap[currentWeek] = false;
          } else {
            widget.selectorStore.dateWeekMap[currentWeek] = true;
          }
        });
      },
    );
  }
}
