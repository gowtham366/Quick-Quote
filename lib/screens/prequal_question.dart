import 'package:flutter_web/material.dart';
import 'package:quick_quote/dataLists/GlobalConstants.dart';

var questionStyle = TextStyle(fontSize: 25);
var switchStyle = TextStyle(fontSize: 16);

class PreQualQuestionsScreen extends StatefulWidget {
  @override
  _PreQualQuestionsScreenState createState() => _PreQualQuestionsScreenState();
}

class _PreQualQuestionsScreenState extends State<PreQualQuestionsScreen> {
  var _inputsMap = GlobalConstants.petInputMap;
  bool medicalIllSwitch = false;
  bool medicalSurgSwitch = false;
  var noOfPetsDropdown = '1';
  bool otherWorkSwitch = false;
  bool behProblemSwitch = false;
  bool prevInsSwitch = false;

  var noOfPetsList = ['1', '2', '3 or more'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PreQualQuestions'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          child: ListView(
            children: <Widget>[
              Text(
                'Does your pet suffer from any medical illness/conditions?',
                style: questionStyle,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Yes',
                    style: switchStyle,
                  ),
                  Switch(
                    value: medicalIllSwitch,
                    onChanged: (value) {
                      setState(() {
                        medicalIllSwitch = value;
                        if (value) {
                          _inputsMap.update('medicalIllnessCond', (_) => 'No');
                        } else {
                          _inputsMap.update('medicalIllnessCond', (_) => 'Yes');
                        }
                      });
                    },
                  ),
                  Text(
                    'No',
                    style: switchStyle,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
              Text(
                'Did your pet undergo any medical surgery/treatment in the last 12 months?',
                style: questionStyle,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Yes',
                    style: switchStyle,
                  ),
                  Switch(
                    value: medicalSurgSwitch,
                    onChanged: (value) {
                      setState(() {
                        medicalSurgSwitch = value;
                        if (value) {
                          _inputsMap.update('undergoMediSurg', (_) => 'No');
                        } else {
                          _inputsMap.update('undergoMediSurg', (_) => 'Yes');
                        }
                      });
                    },
                  ),
                  Text(
                    'No',
                    style: switchStyle,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pet Age',
                    style: questionStyle,
                  ),
                  DropdownButton(
                    value: noOfPetsDropdown,
                    onChanged: (selected) {
                      setState(() {
                        noOfPetsDropdown = selected;
                        _inputsMap.update('noOfPetsResideWithPet', (_) => selected);
                      });
                    },
                    items: noOfPetsList.map((dropdownItem) {
                      return DropdownMenuItem<String>(
                        child: Text(dropdownItem),
                        value: dropdownItem,
                      );
                    }).toList(),
                  ),
                ],
              ),
              Text(
                'Is your pet used for any work like security, guarding,Track Racing, hunting or any other sport?',
                style: questionStyle,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Yes',
                    style: switchStyle,
                  ),
                  Switch(
                    value: otherWorkSwitch,
                    onChanged: (value) {
                      setState(() {
                        otherWorkSwitch = value;
                        if (value) {
                          _inputsMap.update('petUsedForOtherWork', (_) => 'No');
                        } else {
                          _inputsMap.update(
                              'petUsedForOtherWork', (_) => 'Yes');
                        }
                      });
                    },
                  ),
                  Text(
                    'No',
                    style: switchStyle,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
              Text(
                'Has your pet had history of behavioral problems or showing violent tendencies?',
                style: questionStyle,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Yes',
                    style: switchStyle,
                  ),
                  Switch(
                    value: behProblemSwitch,
                    onChanged: (value) {
                      setState(() {
                        behProblemSwitch = value;
                        if (value) {
                          _inputsMap.update('behavioralProblems', (_) => 'No');
                        } else {
                          _inputsMap.update('behavioralProblems', (_) => 'Yes');
                        }
                      });
                    },
                  ),
                  Text(
                    'No',
                    style: switchStyle,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
              Text(
                'Had your Pet Insurance been cancelled by your previous insurer ever?',
                style: questionStyle,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Yes',
                    style: switchStyle,
                  ),
                  Switch(
                    value: prevInsSwitch,
                    onChanged: (value) {
                      setState(() {
                        prevInsSwitch = value;
                        if (value) {
                          _inputsMap.update(
                              'insCancelledByPrevIns', (_) => 'No');
                        } else {
                          _inputsMap.update(
                              'insCancelledByPrevIns', (_) => 'Yes');
                        }
                      });
                    },
                  ),
                  Text(
                    'No',
                    style: switchStyle,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
