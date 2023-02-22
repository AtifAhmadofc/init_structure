

class ClassDataModel {
  ClassDataModel({
    this.id,
    required this.className,
    required this.instituteId,
    required this.instituteName,
  });

  final String? id;
  final String className;
  final String instituteId;
  final String instituteName;

  factory ClassDataModel.fromJson( json) => ClassDataModel(
        id: json.id,
        className: json["className"],
        instituteId: json["instituteId"],
        instituteName: json["instituteName"],
      );

  Map<String, dynamic> toJson()=>{
    "id":id,
    "className":className,
    "instituteId":instituteId,
    "instituteName":instituteName,
  };

}
