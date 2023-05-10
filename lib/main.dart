import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void playSound(int x) {
    final player = AudioCache();
    player.play("note$x.wav");
  }

  Widget buildKey({int? y, Color? color}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          playSound(y!);
          setState(() {});
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color, //There is a problem here
        ),
        child: Text(
          "$y",
          style: const TextStyle(
            fontSize: 40,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Xylophone App",
      theme: ThemeData(fontFamily: 'UnifrakturMaguntia'),
      home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: const Text("Xylophone"),
            backgroundColor: Colors.lightBlue,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // for (int i = 1; i <= 7; i++) //we have only 7 notes
              //   buildKey(y: i, color: "red"),
              buildKey(y: 1, color: Colors.red),
              buildKey(y: 2, color: Colors.orange),
              buildKey(y: 3, color: Colors.yellow),
              buildKey(y: 4, color: Colors.green),
              buildKey(y: 5, color: Colors.teal),
              buildKey(y: 6, color: Colors.blue),
              buildKey(y: 7, color: Colors.purple),
            ],
          )),
    );
  }
}
