//@dart=2.9

class User {
  int id;
  String shortName;
  String fullName;
  List<Family> family;

  User({this.id, this.shortName, this.fullName, this.family});

  User.copy(User from)
      : this(id: from.id, shortName: from.shortName, fullName: from.fullName);

  User.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            shortName: json['shortName'],
            fullName: json['fullName'],
            family: (json['family'] as List)
                .map((e) => Family.fromJson(e))
                .toList());

  Map<String, dynamic> toJson() => {
        'id': id,
        'shortName': shortName,
        'fullName': fullName,
        'family': [family]
      };
}

class Family {
  String name;
  String contactNo;

  Family({this.contactNo, this.name});
  Family.fromJson(Map<String, dynamic> json)
      : this(name: json['name'], contactNo: json['contactNo']);
  Map<String, dynamic> tojson() => {'name': name, 'contactNo': contactNo};
}
