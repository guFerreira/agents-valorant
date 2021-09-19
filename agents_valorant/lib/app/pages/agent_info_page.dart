import 'package:agents_valorant/app/model/agent_model.dart';
import 'package:agents_valorant/app/model/role_model.dart';
import 'package:agents_valorant/app/pages/widgets/abilities_widget.dart';
import 'package:agents_valorant/app/pages/widgets/information_agent_widget.dart';
import 'package:agents_valorant/app/pages/widgets/name_agent_widget.dart';
import 'package:agents_valorant/app/pages/widgets/role_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgentInfoPage extends StatefulWidget {
  @override
  _AgentInfoPageState createState() => _AgentInfoPageState();
}

class _AgentInfoPageState extends State<AgentInfoPage> {
  Agent? agent;

  _getArgs() {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      Map data = ModalRoute.of(context)!.settings.arguments as Map;
      agent = data['agent'];
    }
  }

  @override
  Widget build(BuildContext context) {
    _getArgs();
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      height: 340,
                      child: Image.network(agent!.bustPortrait),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            NameAgentWidget(
                              agent: agent!,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            RoleWidget(
                              agent: agent!,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              InfoAgentWidget(
                agent: agent!,
              ),
              AbilitiesWidget(
                agent: agent!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
