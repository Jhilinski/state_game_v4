import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'state_capitals.dart';

import 'package:audioplayers/audioplayers.dart';

class CorrectPage extends StatelessWidget {
  final _myBox = Hive.box('myBox');
  String playerName = '';
  final player = AudioPlayer();

  CorrectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool? isAudio = (_myBox.get(2));
    final List args =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    String correctState = args[0];
    print('isAudio-c $isAudio');
    if (isAudio != false){
    player.play(AssetSource('success-fanfare-trumpets.mp3'));
    }
    
    List stateCapsKeys = args.toList();
    //print('State Cap Keys $stateCapsKeys');
    stateCapsKeys.shuffle();

    playerName = (_myBox.get(1));
    String? stateCap;
    stateCap = getCapital(args[0]);
    String? button1Text = getCapital(stateCapsKeys[0]);
    String? button2Text = getCapital(stateCapsKeys[1]);
    String? button3Text = getCapital(stateCapsKeys[2]);
    List correctAnswer = [correctState, stateCap];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Correct Answer!'),
        automaticallyImplyLeading: false,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/states_name/$correctState.png'),
            Text(
              'You GotThe Right State $playerName!!\n$correctState\nWhat is the Capital City?',
              style: const TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    if (stateCap == button1Text) {
                      Navigator.of(context)
                          .pushNamed('/all_correct', arguments: correctAnswer);
                      // statement(s) will execute if the Boolean expression is true.
                    } else {
                      Navigator.of(context).pushNamed('/wrong');
                      // statement(s) will execute if the Boolean expression is false.
                    }
                  },
                  child: Text(button1Text!),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (stateCap == button2Text) {
                      Navigator.of(context)
                          .pushNamed('/all_correct', arguments: correctAnswer);
                      // statement(s) will execute if the Boolean expression is true.
                    } else {
                      Navigator.of(context).pushNamed('/wrong');
                      // statement(s) will execute if the Boolean expression is false.
                    }
                  },
                  child: Text(button2Text!),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (stateCap == button3Text) {
                      Navigator.of(context)
                          .pushNamed('/all_correct', arguments: correctAnswer);
                      // statement(s) will execute if the Boolean expression is true.
                    } else {
                      Navigator.of(context).pushNamed('/wrong');
                      // statement(s) will execute if the Boolean expression is false.
                    }
                  },
                  child: Text(button3Text!),
                ),
              ],
            ),
            const SizedBox(width: 200.0, height: 10.0),
            ElevatedButton(
              child: const Text('Next State'),
              onPressed: () {
                Navigator.of(context).pushNamed('/page_one');
              },
            ),
          ],
        ),
      ),
    );
    //print(stateCap);
  }
}

// © 2022 SimCon All Rights Reserved