import 'dart:convert';

class Abilitie {
  String slot;
  String displayName;
  String description;
  String displayIcon;

  Abilitie({
    required this.slot,
    required this.displayName,
    required this.description,
    required this.displayIcon,
  });

  Map<String, dynamic> toMap() {
    return {
      'slot': slot,
      'displayName': displayName,
      'description': description,
      'displayIcon': displayIcon,
    };
  }

  factory Abilitie.fromMap(Map<String, dynamic> map) {
    return Abilitie(
      slot: map['slot'],
      displayName: map['displayName'],
      description: map['description'],
      displayIcon: map['displayIcon'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Abilitie.fromJson(String source) =>
      Abilitie.fromMap(json.decode(source));
}
