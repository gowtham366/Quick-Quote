import 'package:flutter_web/material.dart';
import 'package:flutter_web/foundation.dart';
import 'dart:async';

class CustomWidgetBuilder extends StatefulWidget {
  final dynamic _question;
  final Map<String, dynamic> _inputsMap;
  final Function _polInfoSetState;

  CustomWidgetBuilder(this._question, this._inputsMap, this._polInfoSetState);

  @override
  _CustomWidgetBuilderState createState() => _CustomWidgetBuilderState();
}

class _CustomWidgetBuilderState extends State<CustomWidgetBuilder> {
  var textController = TextEditingController();
  bool isSwitched = false;
  String dropdownValue;
  var selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2016),
        lastDate: DateTime(2019));

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Widget _buildInputWidget(BuildContext context) {
    if (widget._question['type'] == 'text') {
      widget._inputsMap.putIfAbsent(widget._question['id'], () => '');
      return Container(
        width: 200,
        child: TextField(
          onChanged: (val) {
            widget._inputsMap.update(widget._question['id'], (_) => val);
            debugPrint(widget._question['id']);
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      );
    } else if (widget._question['type'] == 'switch') {
      widget._inputsMap.putIfAbsent(widget._question['id'], () => widget._question['availableOptions'][0]);
      return Row(
        children: <Widget>[
          Text(
            widget._question['availableOptions'][0],
            style: TextStyle(fontSize: 16),
          ),
          Switch(
            value: isSwitched,
            onChanged: (value) {
              isSwitched = value;
              setState(() {
                if (isSwitched) {
                  widget._inputsMap.update(widget._question['id'],
                      (_) => widget._question['availableOptions'][1]);
                } else {
                  widget._inputsMap.update(widget._question['id'],
                      (_) => widget._question['availableOptions'][0]);
                }
              });
            },
          ),
          Text(
            widget._question['availableOptions'][1],
            style: TextStyle(fontSize: 16),
          ),
        ],
      );
    } else if (widget._question['type'] == 'dropdown') {
      widget._inputsMap.putIfAbsent(widget._question['id'], () => widget._question['availableOptions'][0]);
      return DropdownButton<String>(
        value: dropdownValue,
        onChanged: (selected) {
          setState(() {
            dropdownValue = selected;
          });
          widget._inputsMap
              .update(widget._question['id'], (_) => dropdownValue);
        },
        items: widget._question['availableOptions']
            .map<DropdownMenuItem<String>>((String dropdownItem) {
          return DropdownMenuItem<String>(
            child: Text(dropdownItem),
            value: dropdownItem,
          );
        }).toList(),
      );
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
            onPressed: () => showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now().subtract(Duration(days: 30)),
              lastDate: DateTime.now().add(Duration(days: 30)),
            ),
            child: Text('Pick Date'),
          ),
        ],
      );
    } else if(widget._question['type'] == 'switchDepends') {
      widget._inputsMap.putIfAbsent(widget._question['id'], () => widget._question['availableOptions'][0]);
      return Row(
        children: <Widget>[
          Text(
            widget._question['availableOptions'][0],
            style: TextStyle(fontSize: 16),
          ),
          Switch(
            value: isSwitched,
            onChanged: (value) {
              isSwitched = value;
              widget._polInfoSetState(isSwitched, widget._question);
            },
          ),
          Text(
            widget._question['availableOptions'][1],
            style: TextStyle(fontSize: 16),
          ),
        ],
      );
    } else if (widget._question['type'] == 'dropdownSwitch') {
      widget._inputsMap.putIfAbsent(widget._question['id'], () => '');
      return DropdownButton<String>(
        value: dropdownValue,
        onChanged: (selected) {
          setState(() {
            dropdownValue = selected;
          });
          widget._inputsMap
              .update(widget._question['id'], (_) => dropdownValue);
        },
        items: widget._question['availableOptions']
                [widget._inputsMap[widget._question['dependentOnId']]]
            .map<DropdownMenuItem<String>>((dynamic dropdownItem) {
          return DropdownMenuItem<String>(
            child: Text(dropdownItem),
            value: dropdownItem,
          );
        }).toList(),
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
