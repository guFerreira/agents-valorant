import 'package:agents_valorant/app/model/agent_model.dart';
import 'package:agents_valorant/app/model/wraper_agent.dart';
import 'package:agents_valorant/app/repository/interface/interface_agent_repository.dart';
import 'package:http/http.dart' as http;

class AgentRepository implements IAgentRepository {
  String url = "https://valorant-api.com/v1/agents?language=";

  @override
  Future<List<Agent>> findAgents(String language) async {
    url = url + language;
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      WraperAgent wraperAgent = WraperAgent.fromJson(response.body);
      return wraperAgent.data;
    }

    throw UnimplementedError();
  }
}
