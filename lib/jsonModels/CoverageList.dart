import 'package:quick_quote/jsonModels/Coverage.dart';

class CoverageList {
  List<Coverage> coverageList;

  CoverageList({this.coverageList});

  factory CoverageList.fromJson(Map<String, dynamic> json) {
    var list = json['coverages'] as List;
    List<Coverage> coverageList = list.map((i) => Coverage.parseJson(i));
    return CoverageList(coverageList: coverageList);
  }
}
