import 'dart:convert';

class Role {
  String displayName;
  String displayIcon;

  Role({
    required this.displayName,
    required this.displayIcon,
  });

  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName,
      'displayIcon': displayIcon,
    };
  }

  factory Role.fromMap(Map<String, dynamic> map) {
    return Role(
      displayName: map['displayName'],
      displayIcon: map['displayIcon'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Role.fromJson(String source) => Role.fromMap(json.decode(source));
}
