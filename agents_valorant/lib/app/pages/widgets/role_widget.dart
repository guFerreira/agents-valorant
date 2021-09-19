import 'package:flutter/cupertino.dart';

import 'package:agents_valorant/app/model/agent_model.dart';
import 'package:flutter/material.dart';

class RoleWidget extends StatefulWidget {
  Agent? agent;
  double height = 50;
  double width = 180;
  RoleWidget({
    this.agent,
  });

  @override
  _RoleWidgetState createState() => _RoleWidgetState();
}

class _RoleWidgetState extends State<RoleWidget> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      alignment: Alignment.centerLeft,
      child: Container(
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(widget.agent!.role.displayIcon),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${widget.agent!.role.displayName}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
