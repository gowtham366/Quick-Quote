class LineDetail {
  final String lobName;
  final String folderPath;
  final String imgPath;
  final bool hasPreQualificationQues;
  LineDetail({this.lobName,this.folderPath,this.imgPath,this.hasPreQualificationQues});

  factory LineDetail.fromJson(Map<String,dynamic> json){
    return LineDetail(
      lobName: json['lobName'],
      folderPath: json['dataDir'],
      imgPath: json['imageDir'],
      hasPreQualificationQues: json['preQualificationQuestionAvail']
    );
  }
}
