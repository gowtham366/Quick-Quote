import 'package:quick_quote/jsonModels/CovTerm.dart';

class Coverage {
  final String name;
  final String pattenCode;
  final bool isMandatoryCoverage;
  final bool isStandardCoverage;
  final bool isExtendedCoverage;
  final bool isFlexibleCoverage;
  final bool isAdditionalCoverage;
  List<CovTerm> covTerms;
  double coverageCost = 0;
  bool isSelectedByUser = false;

  Coverage(
      {this.name,
      this.pattenCode,
      this.isMandatoryCoverage,
      this.isStandardCoverage,
      this.isExtendedCoverage,
      this.isFlexibleCoverage,
      this.isAdditionalCoverage,
      this.covTerms,
      this.isSelectedByUser});

  factory Coverage.parseJson(Map<String, dynamic> json) {
    //Creating the the list of covTerm objects which are associated to the coverage.
    var list = json['covTerms'] as List;
    List<CovTerm> covTerms = list.map((i) => CovTerm.parseJson(i));
    return Coverage(
        name: json['coverageName'],
        pattenCode: json['pattenCode'],
        isMandatoryCoverage: json['isMandatoryCoverage'],
        isStandardCoverage: json['isStandardCoverage'],
        isExtendedCoverage: json['isExtendedCoverage'],
        isFlexibleCoverage: json['isFlexibleCoverage'],
        isAdditionalCoverage: json['isAdditionalCoverage'],
        covTerms: covTerms,
        isSelectedByUser: json['isMandatoryCoverage']);
  }

//Adding Getters and Setters
  Map<String, dynamic> get coverageMap {
    return {
      "name": this.name,
      "pattenCode": this.pattenCode,
      "isMandatoryCoverage": this.isMandatoryCoverage,
      "isStandardCoverage": this.isStandardCoverage,
      "isExtendedCoverage": this.isExtendedCoverage,
      "isFlexibleCoverage": this.isFlexibleCoverage,
      "isAdditionalCoverage": this.isAdditionalCoverage,
      "covTerms": this.covTerms,
      "isSelectedByUser": this.isSelectedByUser
    };
  }

String get Name{
  return this.name;
}
String get PattenCode{
  return this.pattenCode;
}
bool get IsMandatoryCoverage{
  return this.isMandatoryCoverage;
}
bool get IsStandardCoverage{
  return this.isStandardCoverage;
}
bool get IsExtendedCoverage{
  return this.isExtendedCoverage;
}
bool get IsAdditionalCoverage{
  return this.IsAdditionalCoverage;
}
List<CovTerm> get CovTerms{
  return this.covTerms;
}
double get CoverageCost{
  return this.coverageCost;
}
bool get IsSelectedByUser{
  return this.isSelectedByUser;
}

}
