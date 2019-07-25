import 'LineDetail.dart';
class LineDetails{
  final List<LineDetail> lineDetails;

  LineDetails({this.lineDetails});

  factory LineDetails.fromJson(Map<String,dynamic> json){
    var list = json['lobDetails'] as List;
    print(list.runtimeType);
    List<LineDetail> lineDetailList = list.map((i) => LineDetail.parseJson(i)).toList();
    return LineDetails(
      lineDetails: lineDetailList
      );
  }
} 