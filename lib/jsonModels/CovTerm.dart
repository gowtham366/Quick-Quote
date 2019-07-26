class CovTerm {
  final String name;
  final String pattenCode;
  final String limit;

  CovTerm({this.name, this.pattenCode, this.limit});

  factory CovTerm.parseJson(Map<String, dynamic> json) {
    return CovTerm(
        name: json['covTermName'],
        pattenCode: json['covTermPattenCode'],
        limit: json['limit']);
  }
}
