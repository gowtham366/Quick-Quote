import 'package:flutter_web/material.dart';
import 'package:quick_quote/dataLists/LineDetails.dart';
import 'package:quick_quote/widgets/lob_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CapInsurance',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 200,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: LineDetails.lineDetailsList.map((lineDetail) {
              return LOBCard(lineDetail);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
