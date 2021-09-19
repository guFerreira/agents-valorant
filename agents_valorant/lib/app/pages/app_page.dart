import 'package:agents_valorant/app/pages/agent_info_page.dart';
import 'package:agents_valorant/app/pages/agents_page.dart';
import 'package:agents_valorant/app/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valorant Agents',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      initialRoute: "/home",
      routes: {
        "/home": (context) => HomePage(),
        "/agents": (context) => AgentsPage(),
        "/agentInfo": (context) => AgentInfoPage(),
      },
    );
  }
}
