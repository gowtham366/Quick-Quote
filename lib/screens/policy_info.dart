import 'package:flutter_web/material.dart';

class PolicyInfoScreen extends StatelessWidget {

  final String zipCode;
  PolicyInfoScreen(this.zipCode);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Policy Info'),
        centerTitle: true,
      ),
    );
  }
}