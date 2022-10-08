import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:audioplayers/audioplayers.dart';

class WrongPage extends StatelessWidget {
  final _myBox = Hive.box('myBox');
  String playerName = 'Player Name';
  final player = AudioPlayer();

  WrongPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    playerName = (_myBox.get(1));
    player.play(AssetSource('wrong-buzzer.mp3'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Incorrect!!'),
      ),
      body: SizedBox(
        child: Center(
          child: Text('Hi $playerName \n Wrong Answer Try Again!',
              style: const TextStyle(fontSize: 25.0),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
