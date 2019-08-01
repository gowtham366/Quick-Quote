import 'package:flutter_web/material.dart';
import 'dart:async' show Future;
import 'package:flutter_web/services.dart' show rootBundle;
import 'package:quick_quote/jsonModels/CoverageList.dart';
import 'package:quick_quote/screens/policy_info.dart';
import 'dart:convert';
import '../jsonModels/LineDetailList.dart';
import 'dart:developer';

class ZipValidationScreen extends StatelessWidget {
  
  final zipController = TextEditingController();

  final List<String> zipList = ['12345', '23456', '34567'];

  static final _formKey = GlobalKey<FormState>();

  void checkAvailability(zipController, context) {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PolicyInfoScreen(zipController.text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zip Validation'),
        centerTitle: true,
      ),
      body: Form(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Enter ZIP Code',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  // color: Colors.grey.withOpacity(0.1),
                ),
                child: TextFormField(
                  key: _formKey,
                  controller: zipController,
                  validator: (value) =>
                      !zipList.contains(value) ? 'Unavailable' : null,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    labelText: 'ZIP Code',
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              RaisedButton(
                child: Text(
                  'Check Availability',
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () => checkAvailability(zipController, context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> coverageDetailsFromAssets() async {
    return await rootBundle.loadString('data\lob\pet\coverages.json');
  }

  Future coverageDetails() async {
    String jsonString = await coverageDetailsFromAssets();
    final jsonResponse = json.decode(jsonString);
    CoverageList coverageList = new CoverageList.fromJson(jsonResponse);
    //return coverageList.coverageList.forEach(f)
    List<String> list;
    coverageList.coverageList.map((i) => list.add(i.Name));
    return list;
  }
}
