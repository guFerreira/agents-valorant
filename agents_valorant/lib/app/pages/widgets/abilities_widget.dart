import 'package:flutter/cupertino.dart';

import 'package:agents_valorant/app/model/agent_model.dart';
import 'package:flutter/material.dart';

class AbilitiesWidget extends StatefulWidget {
  @override
  _AbilitiesWidgetState createState() => _AbilitiesWidgetState();

  Agent? agent;
  AbilitiesWidget({
    Key? key,
    this.agent,
  }) : super(key: key);
  int _indexSelected = 0;
}

class _AbilitiesWidgetState extends State<AbilitiesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, top: 20, bottom: 10),
                child: Text(
                  "Abilities",
                  style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Center(
              child: Row(
                children: _getAbilitiesList(),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "${this.widget.agent!.abilities[widget._indexSelected].displayName}",
                    style: TextStyle(fontSize: 30, color: Colors.red),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 30),
                  child: Text(
                      "${this.widget.agent!.abilities[widget._indexSelected].description}",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _getAbilitiesList() {
    List<Widget> abilities = [];

    for (int i = 0; i < 4; i++) {
      abilities.add(_getAbilitie(i));
      if (i < 3) {
        abilities.add(SizedBox(
          width: 20,
        ));
      }
    }
    return abilities;
  }

  _getAbilitie(int index) {
    return Center(
      child: Container(
        width: 80,
        height: 80,
        child: InkWell(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(widget.agent!.abilities[index].displayIcon),
          )),
          onTap: () {
            setState(() {
              widget._indexSelected = index;
            });
          },
        ),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
