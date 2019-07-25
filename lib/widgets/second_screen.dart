import 'package:flutter_web/material.dart';
import 'dart:async' show Future;
import 'package:flutter_web/services.dart' show rootBundle;
import 'dart:convert';
import '../jsonModels/LineDetails.dart';

class PinValidationScreen extends StatelessWidget {
  Future<String> loadLineDetailsFromAssets() async {
    return await rootBundle.loadString('data\common\lineDetails.json');
  }
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
                onPressed: () {

                 // String jsonString = await loadLineDetailsFromAssets();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}
