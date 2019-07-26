import 'package:flutter_web/material.dart';
import 'dart:async' show Future;
import 'package:flutter_web/services.dart' show rootBundle;
import 'package:quick_quote/jsonModels/CoverageList.dart';
import 'dart:convert';
import '../jsonModels/LineDetailList.dart';
import 'dart:developer';

class PinValidationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final zipController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Pin Validation'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  // color: Colors.grey.withOpacity(0.1),
                ),
                child: TextField(
                  controller: zipController,
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
                child: Text('Check Availability'),
                onPressed: () {},
              ),
              Container(
                child: FutureBuilder(
                  future: coverageDetails(),
                  builder: (BuildContext context, snapshot) {
                   // return Text(context.);
                  },
                ),
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
