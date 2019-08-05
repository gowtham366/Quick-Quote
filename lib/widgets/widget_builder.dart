import 'package:flutter_web/material.dart';
import 'dart:async';

class CustomWidgetBuilder extends StatelessWidget {
  final dynamic question;
  CustomWidgetBuilder(this.question);

  bool isSwitched = false;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2016),
        lastDate: DateTime(2019));
  }

  Widget _buildInputWidget(BuildContext context) {
    if (question['type'] == 'text') {
      return Container(
        width: 200,
        child: TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      );
    } else if (question['type'] == 'switch') {
      return Row(
        children: <Widget>[
          Text(
            question['availableOptions'][0],
            style: TextStyle(fontSize: 16),
          ),
          Switch(
            value: isSwitched,
            onChanged: (value) {},
          ),
          Text(
            question['availableOptions'][1],
            style: TextStyle(fontSize: 16),
          ),
        ],
      );
    } else if (question['type'] == 'dropdown') {
      return DropdownButton<String>(
        onChanged: (value) {},
        items: question['availableOptions']
            .map<DropdownMenuItem<String>>((String dropdownItem) {
          return DropdownMenuItem<String>(
            child: Text(dropdownItem),
          );
        }).toList(),
      );
    } else if (question['type'] == 'number') {
      return Container(
        width: 200,
        child: TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      );
    } else if (question['type'] == 'date') {
      return Row(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              _selectDate(context);
            },
            child: Icon(Icons.calendar_today),
          ),
          Text('Date Picked'),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            question['question'],
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          _buildInputWidget(context),
        ],
      ),
    );
  }
}
