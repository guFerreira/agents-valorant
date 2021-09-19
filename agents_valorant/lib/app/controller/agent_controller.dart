import 'package:agents_valorant/app/model/agent_model.dart';
import 'package:agents_valorant/app/service/agent_service.dart';

class AgentController {
  AgentService agentService = AgentService();

  Future<List<Agent>> getAgents(String language) async {
    return await agentService.getAgents(language);
  }
}
