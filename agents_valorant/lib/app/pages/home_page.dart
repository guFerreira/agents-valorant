import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamController<String> _languageStream = StreamController();

  List<String> listLanguage = [
    "ar-AE",
    "de-DE",
    "en-US",
    "es-ES",
    "es-MX",
    "fr-FR",
    "id-ID",
    "it-IT",
    "ja-JP",
    "ko-KR",
    "pl-PL",
    "pt-BR",
    "ru-RU",
    "th-TH",
    "tr-TR",
    "vi-VN",
    "zh-CN",
    "zh-TW"
  ];
  String _selected = 'Select Language';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Text(
                "Select Language",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 30,
              ),
              DropdownButton<String>(
                hint: Text("$_selected"),
                onChanged: (String? d) {
                  setState(() {
                    this._selected = d!;
                    print(_selected);
                    _languageStream.add(this._selected);
                  });
                },
                items:
                    listLanguage.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 30,
              ),
              StreamBuilder(
                stream: _languageStream.stream,
                initialData: '',
                builder: (context, snapshot) {
                  if (snapshot.data != '') {
                    return Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              '/agents',
                              arguments: {
                                'language': _selected,
                              },
                            );
                          },
                          child: Text('Agents'),
                        ),
                        Text("foi selecionado a linguagem $_selected"),
                      ],
                    );
                  }
                  return Text("Ainda não foi selecionado uma linguagem");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
