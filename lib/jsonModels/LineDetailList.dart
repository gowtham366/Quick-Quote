import 'LineDetail.dart';

class LineDetailList {
  final List<LineDetail> lineDetails;

  LineDetailList({this.lineDetails});

  factory LineDetailList.fromJson(Map<String, dynamic> json) {
    var list = json['lobDetails'] as List;
    print(list.runtimeType);
    List<LineDetail> lineDetailList =
        list.map((i) => LineDetail.parseJson(i)).toList();
    return LineDetailList(lineDetails: lineDetailList);
  }
}
