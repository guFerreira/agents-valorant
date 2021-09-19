import 'dart:convert';

import 'package:agents_valorant/app/model/abilitie_model.dart';
import 'package:agents_valorant/app/model/role_model.dart';

class Agent {
  String uuid;
  String displayName;
  String description;
  String bustPortrait;
  String killfeedPortrait;
  Role role;
  List<Abilitie> abilities;

  Agent({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.bustPortrait,
    required this.killfeedPortrait,
    required this.role,
    required this.abilities,
  });

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'displayName': displayName,
      'description': description,
      'bustPortrait': bustPortrait,
      'killfeedPortrait': killfeedPortrait,
      'role': role.toMap(),
      'abilities': abilities.map((x) => x.toMap()).toList(),
    };
  }

  factory Agent.fromMap(Map<String, dynamic> map) {
    return Agent(
      uuid: map['uuid'],
      displayName: map['displayName'],
      description: map['description'],
      bustPortrait: map['bustPortrait'] ?? '',
      killfeedPortrait: map['killfeedPortrait'],
      role: Role.fromMap(map['role'] ?? {}),
      abilities: List<Abilitie>.from(
          map['abilities']?.map((x) => Abilitie.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Agent.fromJson(String source) => Agent.fromMap(json.decode(source));
}
