import 'package:flutter/material.dart';
import 'cowsay.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cowSay = new CowSayBuilder();
    cowSay.writeln("Hello world");
    cowSay.writeln("I made a flutter thing");
    cowSay.writeln("Glorious code reuse!");
    cowSay.writeln("Woooo 100 days of code!!!");

    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
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

