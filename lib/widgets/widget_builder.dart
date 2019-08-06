import 'package:flutter_web/material.dart';
import 'dart:async';

class CustomWidgetBuilder extends StatefulWidget {
  final dynamic _question;
  final Map<String, dynamic> _inputsMap;

  CustomWidgetBuilder(this._question, this._inputsMap);

  @override
  _CustomWidgetBuilderState createState() => _CustomWidgetBuilderState();
}

class _CustomWidgetBuilderState extends State<CustomWidgetBuilder> {
  var textController = TextEditingController();

  bool isSwitched = false;

  String dropdownValue;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2016),
        lastDate: DateTime(2019));
  }

  Widget _buildInputWidget(BuildContext context) {
    if (widget._question['type'] == 'text') {
      return Container(
        width: 200,
        child: TextField(
          onChanged: (val) {
            if (widget._inputsMap.containsKey(widget._question['id'])) {
              widget._inputsMap.update(widget._question['id'], (_) => val);
            } else {
              widget._inputsMap.putIfAbsent(widget._question['id'], () => val);
            }
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      );
    } else if (widget._question['type'] == 'switch') {
      return Row(
        children: <Widget>[
          Text(
            widget._question['availableOptions'][0],
            style: TextStyle(fontSize: 16),
          ),
          Switch(
            value: isSwitched,
            onChanged: (value) {
              isSwitched = !isSwitched;
              if (widget._inputsMap.containsKey(widget._question['id'])) {
                widget._inputsMap
                    .update(widget._question['id'], (_) => isSwitched);
              } else {
                widget._inputsMap
                    .putIfAbsent(widget._question['id'], () => isSwitched);
              }
            },
          ),
          Text(
            widget._question['availableOptions'][1],
            style: TextStyle(fontSize: 16),
          ),
        ],
      );
    } else if (widget._question['type'] == 'dropdown') {
      if (widget._question['hasMultipleOptions']) {
      } else {
        return DropdownButton<String>(
          value: dropdownValue,
          onChanged: (selected) {
            setState(() {
              dropdownValue = selected;
            });
            if (widget._inputsMap.containsKey(widget._question['id'])) {
                widget._inputsMap
                    .update(widget._question['id'], (_) => dropdownValue);
              } else {
                widget._inputsMap
                    .putIfAbsent(widget._question['id'], () => dropdownValue);
              }
          },
          items: widget._question['availableOptions']
              .map<DropdownMenuItem<String>>((String dropdownItem) {
            return DropdownMenuItem<String>(
              child: Text(dropdownItem),
              value: dropdownItem,
            );
          }).toList(),
        );
      }
    } else if (widget._question['type'] == 'number') {
      return Container(
        width: 200,
        child: TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      );
    } else if (widget._question['type'] == 'date') {
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
            widget._question['question'],
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
