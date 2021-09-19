import 'dart:convert';

import 'package:agents_valorant/app/model/abilitie_model.dart';
import 'package:agents_valorant/app/model/agent_model.dart';
import 'package:agents_valorant/app/model/role_model.dart';

class WraperAgent {
  int status;
  List<Agent> data;

  WraperAgent({
    required this.status,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory WraperAgent.fromMap(Map<String, dynamic> map) {
    return WraperAgent(
      status: map['status'],
      data: List<Agent>.from(map['data'].map((x) {
        return Agent.fromMap(x);
      })),
    );
  }

  String toJson() => json.encode(toMap());

  factory WraperAgent.fromJson(String source) =>
      WraperAgent.fromMap(json.decode(source));
}
