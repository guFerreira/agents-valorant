import 'package:flutter/cupertino.dart';

import 'package:agents_valorant/app/model/agent_model.dart';
import 'package:flutter/material.dart';

class InfoAgentWidget extends StatefulWidget {
  Agent? agent;

  InfoAgentWidget({
    Key? key,
    this.agent,
  }) : super(key: key);

  @override
  _InfoAgentWidgetState createState() => _InfoAgentWidgetState();
}

class _InfoAgentWidgetState extends State<InfoAgentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.red,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 14.0, bottom: 30, right: 14, left: 14),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Informations',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.agent!.description,
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
