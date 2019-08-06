import 'package:flutter_web/material.dart';
import 'package:quick_quote/dataLists/GlobalConstants.dart';
import 'package:quick_quote/dataLists/PolicyInfoQuestions.dart';
import 'package:quick_quote/screens/coverages_screen.dart';
import 'package:quick_quote/widgets/widget_builder.dart';

class PolicyInfoScreen extends StatefulWidget {
  final String zipCode;
  var list = Map<String, Object>();
  var sectionTitleList = [];
  var basicInfo = [];
  var additionalDetails = [];
  var rateModifiers = [];

  PolicyInfoScreen(this.zipCode) {
    list = PolicyInfoQuestions.policyInfoQuestionsList
        .firstWhere((listItem) => listItem['LOB'] == GlobalConstants.lobName);
    sectionTitleList = list['sectionTitle'];
    basicInfo = list['BasicInformation'];
    additionalDetails = list['AdditionalDetails'];
    rateModifiers = list['RateModifiers'];
  }

  @override
  _PolicyInfoScreenState createState() => _PolicyInfoScreenState();
}

class _PolicyInfoScreenState extends State<PolicyInfoScreen> {
  var inputsMap = Map<String, dynamic>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sectionTitleList.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
              tabs: widget.sectionTitleList.map((sectionTitle) {
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
            Container(
              child: Form(
                child: ListView(
                  children: widget.basicInfo.map((question) {
                    return CustomWidgetBuilder(question, inputsMap);
                  }).toList(),
                ),
              ),
            ),
            Container(
              child: Form(
                child: ListView(
                  children: widget.additionalDetails.map((question) {
                    return CustomWidgetBuilder(question, inputsMap);
                  }).toList(),
                ),
              ),
            ),
            Container(
              child: Form(
                child: ListView(
                  children: widget.rateModifiers.map((question) {
                    return CustomWidgetBuilder(question, inputsMap);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => PolicyCoveragesScreen())),
          child: Icon(Icons.done_all),
        ),
      ),
    );
  }
}
