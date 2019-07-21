import 'package:flutter/material.dart';
import 'package:stretcher/src/stores/selector_store.dart';

class WeekSelector extends StatefulWidget {
  final SelectorStore selectorStore;

  WeekSelector(this.selectorStore);

  @override
  WeekSelectorState createState() => WeekSelectorState();
}

class WeekSelectorState extends State<WeekSelector> {
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

    return ListTile(
      title: Text(
        currentWeek,
        style: widget.selectorStore.biggerFont,
      ),
      trailing: Icon(
          Icons.keyboard_arrow_right
      ),
      onTap: () {
        //TODO when the row is clicked on, go to day view
        setState(() {
          widget.selectorStore.selectWeek(currentWeek);
        });
      },
    );
  }
}
