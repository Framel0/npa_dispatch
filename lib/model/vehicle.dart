class Vehicle {
  int id;
  String code;
  String name;

  Vehicle({this.id, this.code, this.name});

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json["Id"];
    code = json["Code"];
    name = json["Name"];
  }
}
