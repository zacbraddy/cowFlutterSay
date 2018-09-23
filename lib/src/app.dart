import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: 
          Column(
            children: <Widget>[
              Text(
                'Should I attempt to remake the cowsay app I made in dart in flutter as well?',
                style: new TextStyle(fontSize: 30.0),
              ),
              Image.network('https://media.giphy.com/media/3oFzmkkwfOGlzZ0gxi/giphy.gif'),
            ],
          ),
      ),
    );
  }
}

