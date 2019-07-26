class CovTerm {
  final String name;
  final String pattenCode;
  String limit;

  CovTerm({this.name, this.pattenCode, this.limit});

  factory CovTerm.parseJson(Map<String, dynamic> json) {
    return CovTerm(
        name: json['covTermName'],
        pattenCode: json['covTermPattenCode'],
        limit: json['limit']);
  }

  Map<String, String> get covTermMap {
    return {
      "Name": this.name,
      "pattenCode": this.pattenCode,
      "limit": this.limit
    };
  }

  String get Name {
    return this.name;
  }

  String get PattenCode {
    return this.pattenCode;
  }

  String get Limit {
    return this.limit;
  }

  void set Limit(String limit) {
    this.limit = limit;
  }
}
