import 'dart:convert';

import 'package:agents_valorant/app/model/agent_model.dart';

class WraperAgent {
  String status;
  List<Agent> data;

  WraperAgent({
    required this.status,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'data': data?.map((x) => x.toMap())?.toList(),
    };
  }

  factory WraperAgent.fromMap(Map<String, dynamic> map) {
    return WraperAgent(
      status: map['status'],
      data: List<Agent>.from(map['data']?.map((x) => Agent.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory WraperAgent.fromJson(String source) =>
      WraperAgent.fromMap(json.decode(source));
}
