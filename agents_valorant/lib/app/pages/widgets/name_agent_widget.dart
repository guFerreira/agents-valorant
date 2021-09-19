import 'package:flutter/cupertino.dart';

import 'package:agents_valorant/app/model/agent_model.dart';
import 'package:flutter/material.dart';

class NameAgentWidget extends StatefulWidget {
  Agent? agent;
  double height = 50;
  double width = 180;

  NameAgentWidget({
    this.agent,
  });

  @override
  _NameAgentWidgetState createState() => _NameAgentWidgetState();
}

class _NameAgentWidgetState extends State<NameAgentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.red[600],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${widget.agent!.displayName}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
