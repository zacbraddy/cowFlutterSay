import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'cowsay.dart';

class ChuckCow extends StatefulWidget {
  createState() {
    return CowState();
  }
}

class CowState extends State<ChuckCow> {
  CowSayBuilder cowSay = new CowSayBuilder();

  void fetchChuck() async {
    final response = await get('https://api.chucknorris.io/jokes/random');

    setState(() {
      cowSay = new CowSayBuilder();
      cowSay.writeln(json.decode(response.body)['value']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
          floatingActionButton: FloatingActionButton(
            onPressed: fetchChuck,
            child: Icon(Icons.new_releases),
          ),
        body: 
          Column(
            children: <Widget>[
              Text(
                cowSay.toCowSay(),
                style: new TextStyle(fontSize: 18.0, fontFamily: 'Courier'),
              ),
            ],
          ),
      ),
    );
  }
}

