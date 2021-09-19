import 'dart:async';

import 'package:agents_valorant/app/controller/agent_controller.dart';
import 'package:agents_valorant/app/model/agent_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgentsPage extends StatefulWidget {
  @override
  _AgentsPageState createState() => _AgentsPageState();
}

class _AgentsPageState extends State<AgentsPage> {
  AgentController agentController = AgentController();
  String language = 'pt_BR';

  _getArgs() {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      Map data = ModalRoute.of(context)!.settings.arguments as Map;
      this.language = data['language'];
    }
  }

  @override
  Widget build(BuildContext context) {
    _getArgs();
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18, left: 26),
            child: SizedBox(
              height: 15,
              width: 15,
              child: Container(
                color: Colors.redAccent[400],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 36, left: 56),
            child: SizedBox(
              height: 15,
              width: 15,
              child: Container(
                color: Colors.redAccent[400],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 30),
            child: Column(
              children: [
                SizedBox(
                  height: 36,
                ),
                _getRowTitlePage(),
                _getDivisor(),
              ],
            ),
          ),
          _getListViewAgents(),
        ],
      ),
    );
  }

  _getRowTitlePage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Agents',
          style: TextStyle(
              fontSize: 38, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Valorant_logo_-_pink_color_version.svg/1280px-Valorant_logo_-_pink_color_version.svg.png',
            height: 60,
          ),
        ),
      ],
    );
  }

  _getDivisor() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: new SizedBox(
        height: 20.0,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
            height: 3.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  _getListViewAgents() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 200),
      child: FutureBuilder<List<Agent>>(
        future: agentController.getAgents(language),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 18),
                  child: GestureDetector(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 65,
                      decoration: BoxDecoration(color: Colors.black),
                      child: Row(
                        children: [
                          Image.network(snapshot.data![index].killfeedPortrait),
                          Text(
                            snapshot.data![index].displayName,
                            style: TextStyle(
                                fontSize: 34,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        '/agentInfo',
                        arguments: {
                          'agent': snapshot.data![index],
                        },
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
