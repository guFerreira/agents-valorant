import 'package:agents_valorant/app/model/agent_model.dart';
import 'package:agents_valorant/app/repository/impl/agent_repository.dart';
import 'package:agents_valorant/app/repository/interface/interface_agent_repository.dart';

class AgentService {
  IAgentRepository agentRepository = AgentRepository();

  Future<List<Agent>> getAgents(String language) async {
    List<Agent> agents = await agentRepository.findAgents(language);
    return await _removeDuplicatedAgents(agents);
  }

  _removeDuplicatedAgents(List<Agent> agents) {
    //remove o sova duplicado
    for (int i = 0; i < agents.length; i++) {
      if (agents[i].bustPortrait == '' || agents[i].role.displayName == '') {
        agents.removeAt(i);
      }
    }
    return agents;
  }
}
