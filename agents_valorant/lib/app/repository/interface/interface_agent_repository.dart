import 'package:agents_valorant/app/model/agent_model.dart';

abstract class IAgentRepository {
  Future<List<Agent>> findAgents(String language);
}
