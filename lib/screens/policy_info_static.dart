import 'package:flutter_web/material.dart';
import 'package:quick_quote/dataLists/GlobalConstants.dart';
import 'package:quick_quote/dataLists/PolicyInfoQuestions.dart';
import 'package:quick_quote/screens/coverages_screen.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:quick_quote/screens/prequal_question.dart';
import 'package:quick_quote/widgets/widget_builder.dart';

class PolicyInfoScreen extends StatelessWidget {
  final String zipCode;
  var list = Map<String, Object>();
  var sectionTitleList = [];
  var basicInfo = [];
  var additionalDetails = [];
  var rateModifiers = [];

  static final tab1Key = GlobalKey<FormState>();
  static final tab2Key = GlobalKey<FormState>();
  static final tab3Key = GlobalKey<FormState>();

  PolicyInfoScreen(this.zipCode) {
    list = PolicyInfoQuestions.policyInfoQuestionsList
        .firstWhere((listItem) => listItem['LOB'] == GlobalConstants.lobName);
    sectionTitleList = list['sectionTitle'];
    basicInfo = list['BasicInformation'];
    additionalDetails = list['AdditionalDetails'];
    rateModifiers = list['RateModifiers'];
  }

  void _handleButtonPress(context, Map<String, String> inputsMap) {
    if (tab1Key.currentState.validate() &&
        tab2Key.currentState.validate() &&
        tab3Key.currentState.validate()) {
      tab1Key.currentState.save();
      tab2Key.currentState.save();
      tab3Key.currentState.save();
      GlobalConstants.transactionInputMap = inputsMap;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreQualQuestionsScreen(),
        ),
      );
    }
  }

  Map<String, String> inputsMap = GlobalConstants.petInputMap;

  @override
  Widget build(BuildContext context) {
    basicInfo.map((question) {});
    return DefaultTabController(
      length: sectionTitleList.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
              tabs: sectionTitleList.map((sectionTitle) {
            return Tab(
              child: Text(
                sectionTitle,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            );
          }).toList()),
          title: Text(
            'Policy Info',
            style: TextStyle(fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: TabBarView(
          children: <Widget>[
            Tab1(tab1Key, inputsMap),
            Tab2(tab2Key, inputsMap),
            Tab3(tab3Key, inputsMap),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _handleButtonPress(context, inputsMap),
          child: Icon(Icons.done_all),
        ),
      ),
    );
  }
}

var questionStyle = TextStyle(fontSize: 25);
var switchStyle = TextStyle(fontSize: 16);

class Tab1 extends StatefulWidget {
  var _tab1Key;
  Map<String, String> _inputsMap;
  Tab1(this._tab1Key, this._inputsMap);

  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  var petAgeList = [
    '6 months',
    '1 year',
    '2 years',
    '3 years',
    '4 years',
    '5 years',
    '6 years'
  ];

  var dogBreeds = ['Boxer', 'Mastiff'];
  var catBreeds = ['Angora', 'Housecat'];
  DateTime selectedDate = DateTime.now();

  var petNameController = TextEditingController();
  bool petTypeSwitch = false;
  bool petSexSwitch = false;
  String petAgeDropdown = '6 months';
  bool pureBreedSwitch = false;
  String breedDropdown;
  var pedCertNumController = TextEditingController();
  var purPriceController = TextEditingController();
  var dateOfPurchase;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2020));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget._inputsMap.update('dateOfPurchase', (_) => picked.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Form(
          key: widget._tab1Key,
          child: ListView(
            children: <Widget>[
              Text(
                'Pet Name',
                style: questionStyle,
              ),
              TextFormField(
                validator: (value) => value == null ? 'Required' : null,
                onEditingComplete: () {
                  widget._inputsMap
                      .update('petName', (_) => petNameController.text);
                },
                controller: petNameController,
                decoration: InputDecoration(
                  labelText: 'Pet Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Pet Type',
                style: questionStyle,
              ),
              Row(
                children: <Widget>[
                  Text('Dog', style: switchStyle),
                  Switch(
                    value: petTypeSwitch,
                    onChanged: (value) {
                      setState(() {
                        petTypeSwitch = value;
                        breedDropdown = null;
                        if (value) {
                          widget._inputsMap.update('petType', (_) => 'Cat');
                        } else {
                          widget._inputsMap.update('petType', (_) => 'Dog');
                        }
                      });
                    },
                  ),
                  Text(
                    'Cat',
                    style: switchStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Sex of Pet',
                style: questionStyle,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Male',
                    style: switchStyle,
                  ),
                  Switch(
                    value: petSexSwitch,
                    onChanged: (value) {
                      setState(() {
                        petSexSwitch = value;
                        if (value) {
                          widget._inputsMap.update('petSex', (_) => 'Female');
                        } else {
                          widget._inputsMap.update('petSex', (_) => 'Male');
                        }
                      });
                    },
                  ),
                  Text(
                    'Female',
                    style: switchStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pet Age',
                    style: questionStyle,
                  ),
                  DropdownButton(
                    value: petAgeDropdown,
                    onChanged: (selected) {
                      setState(() {
                        petAgeDropdown = selected;
                        widget._inputsMap.update('petAge', (_) => selected);
                      });
                    },
                    items: petAgeList.map((dropdownItem) {
                      return DropdownMenuItem<String>(
                        child: Text(dropdownItem),
                        value: dropdownItem,
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Pure Breed Status',
                style: questionStyle,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Yes',
                    style: switchStyle,
                  ),
                  Switch(
                    value: pureBreedSwitch,
                    onChanged: (value) {
                      setState(() {
                        pureBreedSwitch = value;
                        if (value) {
                          widget._inputsMap
                              .update('pureBreedStatus', (_) => 'No');
                        } else {
                          widget._inputsMap
                              .update('pureBreedStatus', (_) => 'Yes');
                        }
                      });
                    },
                  ),
                  Text(
                    'No',
                    style: switchStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Pet Breed',
                    style: questionStyle,
                  ),
                  DropdownButton(
                    value: breedDropdown,
                    onChanged: (selected) {
                      setState(() {
                        breedDropdown = selected;
                        widget._inputsMap.update('petBreed', (_) => selected);
                      });
                    },
                    items: petTypeSwitch
                        ? catBreeds.map((breed) {
                            return DropdownMenuItem(
                              value: breed,
                              child: Text(breed),
                            );
                          }).toList()
                        : dogBreeds.map((breed) {
                            return DropdownMenuItem(
                              value: breed,
                              child: Text(breed),
                            );
                          }).toList(),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Pedigree Certificate No.',
                style: questionStyle,
              ),
              TextFormField(
                validator: (value) => value == null ? 'Required' : null,
                onEditingComplete: () {
                  widget._inputsMap.update(
                      'pedigreeCertNo', (_) => pedCertNumController.text);
                },
                controller: pedCertNumController,
                decoration: InputDecoration(
                  labelText: 'Cert No.',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Purchase Price of Pet',
                style: questionStyle,
              ),
              TextFormField(
                validator: (value) => value == null ? 'Required' : null,
                onEditingComplete: () {
                  widget._inputsMap.update(
                      'petPurchasePrice', (_) => purPriceController.text);
                },
                controller: purPriceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Date of Purchase',
                style: questionStyle,
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () => _selectDate(context),
                      child: Text('Select date'),
                    ),
                  ),
                  Text(
                    (DateFormat.yMMMd().format(selectedDate)).toString(),
                    style: switchStyle,
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

class Tab2 extends StatefulWidget {
  var _tab2Key;
  Map<String, String> _inputsMap;
  Tab2(this._tab2Key, this._inputsMap);

  @override
  _Tab2State createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  var petWeightController = TextEditingController();
  bool declawedStatusSwitch = false;
  bool outdoorSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: widget._tab2Key,
        child: ListView(
          children: <Widget>[
            Text(
              'Weight of the Pet',
              style: questionStyle,
            ),
            TextFormField(
              validator: (value) => value == null ? 'Required' : null,
              onEditingComplete: () {
                widget._inputsMap
                    .update('petWeight', (_) => petWeightController.text);
              },
              controller: petWeightController,
              decoration: InputDecoration(
                labelText: 'Weight',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Declawed Status',
              style: questionStyle,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Yes',
                  style: switchStyle,
                ),
                Switch(
                  value: declawedStatusSwitch,
                  onChanged: (value) {
                    setState(() {
                      declawedStatusSwitch = value;
                      if (value) {
                        widget._inputsMap.update('declawedStatus', (_) => 'No');
                      } else {
                        widget._inputsMap
                            .update('declawedStatus', (_) => 'Yes');
                      }
                    });
                  },
                ),
                Text(
                  'No',
                  style: switchStyle,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Outdoor',
              style: questionStyle,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Yes',
                  style: switchStyle,
                ),
                Switch(
                  value: outdoorSwitch,
                  onChanged: (value) {
                    setState(() {
                      outdoorSwitch = value;
                      if (value) {
                        widget._inputsMap.update('outdoor', (_) => 'No');
                      } else {
                        widget._inputsMap.update('outdoor', (_) => 'Yes');
                      }
                    });
                  },
                ),
                Text(
                  'No',
                  style: switchStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Tab3 extends StatefulWidget {
  var _tab3Key;
  Map<String, String> _inputsMap;
  Tab3(this._tab3Key, this._inputsMap);
  @override
  _Tab3State createState() => _Tab3State();
}

class _Tab3State extends State<Tab3> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  bool neuteredSwitch = false;
  bool microchippedSwitch = false;
  bool mcVisibility = false;
  var microchipNumController = TextEditingController();
  bool weightMgmtSwitch = false;

  Widget _buildWidget(bool visibility) {
    if (visibility) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Microchip Number',
            style: questionStyle,
          ),
          TextFormField(
            validator: (value) => value == null ? 'Required' : null,
            onEditingComplete: () {
              widget._inputsMap.update(
                  'microchipNumber', (_) => microchipNumController.text);
            },
            controller: microchipNumController,
            decoration: InputDecoration(
              labelText: 'Num',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: widget._tab3Key,
        child: ListView(
          children: <Widget>[
            Text(
              'Neutered or Spayed?',
              style: questionStyle,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Yes',
                  style: switchStyle,
                ),
                Switch(
                  value: neuteredSwitch,
                  onChanged: (value) {
                    setState(() {
                      neuteredSwitch = value;
                      if (value) {
                        widget._inputsMap
                            .update('neuteredOrSpayed', (_) => 'No');
                      } else {
                        widget._inputsMap
                            .update('neuteredOrSpayed', (_) => 'Yes');
                      }
                    });
                  },
                ),
                Text(
                  'No',
                  style: switchStyle,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Microchipped?',
              style: questionStyle,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Yes',
                  style: switchStyle,
                ),
                Switch(
                  value: microchippedSwitch,
                  onChanged: (value) {
                    setState(() {
                      microchippedSwitch = value;
                      mcVisibility = value;
                      if (value) {
                        widget._inputsMap.update('microchipped', (_) => 'No');
                      } else {
                        widget._inputsMap.update('microchipped', (_) => 'Yes');
                      }
                    });
                  },
                ),
                Text(
                  'No',
                  style: switchStyle,
                ),
              ],
            ),
            _buildWidget(mcVisibility),
            SizedBox(
              height: 15,
            ),
            Text(
              'Weight Control Management',
              style: questionStyle,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Yes',
                  style: switchStyle,
                ),
                Switch(
                  value: weightMgmtSwitch,
                  onChanged: (value) {
                    setState(() {
                      weightMgmtSwitch = value;
                      if (value) {
                        widget._inputsMap
                            .update('weightControlMgmt', (_) => 'No');
                      } else {
                        widget._inputsMap
                            .update('weightControlMgmt', (_) => 'Yes');
                      }
                    });
                  },
                ),
                Text(
                  'No',
                  style: switchStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
