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
    bool? isAudio = (_myBox.get(2));
    print('isAudio $isAudio');
    if (isAudio != false){
      player.play(AssetSource('wrong-buzzer.mp3')); 
    }
    

    return Scaffold(
      appBar: AppBar(
        title: const Text('Incorrect!!'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Column(
              children: [
                Center(
                  child: Text('Hi $playerName \n Wrong Answer Try Again!',
                      style: const TextStyle(fontSize: 25.0),
                      textAlign: TextAlign.center),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('<<<<Back'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
