import 'package:flutter_web/material.dart';
import 'package:quick_quote/dataLists/ZipList.dart';
import 'package:quick_quote/screens/policy_info_static.dart';

class ZipValidationScreen extends StatelessWidget {
  final zipController = TextEditingController();

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
        key: _formKey,
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
                  controller: zipController,
                  validator: (value) =>
                      !ZipList.zipList.contains(value) ? 'Unavailable' : null,
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
}
