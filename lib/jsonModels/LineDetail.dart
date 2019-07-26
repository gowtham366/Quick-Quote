class LineDetail {
  final String lobName;
  final String folderPath;
  final String imgPath;
  final bool hasPreQualificationQues;
  LineDetail(
      {this.lobName,
      this.folderPath,
      this.imgPath,
      this.hasPreQualificationQues});

  factory LineDetail.parseJson(Map<String, dynamic> json) {
    return LineDetail(
        lobName: json['lobName'],
        folderPath: json['dataDir'],
        imgPath: json['imageDir'],
        hasPreQualificationQues: json['preQualificationQuestionAvail']);
  }

  Map<String, dynamic> get LineDetailMap {
    return {
      "LOBName": this.lobName,
      "filePath":this.folderPath,
      "imagePath":this.imgPath,
      "hasPreQualificationQues":this.hasPreQualificationQues
    };
  }

  String get LOBName{
    return this.lobName;
  }
  String get FolderPath{
    return this.folderPath;
  }

  String get ImagePath{
    return this.imgPath;
  }

  bool get HasPreQualificationQues{
    return this.hasPreQualificationQues;
  }

}
