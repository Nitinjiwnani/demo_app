class UserDataModel {
  String? id;
  String? name;
  String? atype;

  UserDataModel({this.id, this.name, this.atype});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    atype = json['atype'];
  }
}
