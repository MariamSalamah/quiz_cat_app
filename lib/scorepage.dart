import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:quiz_cat_app/firstpage.dart';
import 'package:quiz_cat_app/quiz_Brain.dart';

class ScorePage extends StatefulWidget {
  int score;
  ScorePage(this.score);

  @override
  _ScorePageState createState() => _ScorePageState(score);
}

class _ScorePageState extends State<ScorePage> {
  int score;
  _ScorePageState(this.score);

  QuizBrain quizBrain = QuizBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              alignment: Alignment.center,
              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.1), BlendMode.dstIn),
              image: AssetImage('assets/images/catlogoat.png')),

        ),
        child: Column(
          children: [

            SizedBox(
              height: 40,
            ),
            Text("Your Score is " , style: TextStyle(color: Color.fromRGBO(0, 179, 134, 1.0), fontSize: 50),),

            SizedBox(
              height: 40,
            ),
            Text(score.toString() , style: TextStyle(color: Color.fromRGBO(0, 179, 134, 1.0), fontSize: 50),),
            SizedBox(
              height: 10,
            ),
            Text("out of 10" , style: TextStyle(color: Color.fromRGBO(116, 116, 191, 1.0), fontSize: 20),),
            SizedBox(
              height: 80,
            ),



            Row(
              children: [
                Transform.scale(
                    scale: 1.7,

                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15 , horizontal: 50),
                      child: FlatButton(onPressed: (){


                        if (score >= quizBrain.getsum()){
                          AudioPlayer.logEnabled = true;
                          final player = AudioCache();
                          player.play('music.wav');

                        }


                      }, child: Text("Listen" , style: TextStyle(color: Colors.white),) , color: Color.fromRGBO(0, 179, 134, 1.0)),
                    )),


                Transform.scale(
                    scale: 1.7,

                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15 , horizontal: 40 ),
                      child: FlatButton(onPressed: (){

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomePage()));

                      }, child: Text("Back" , style: TextStyle(color: Colors.white),) , color: Color.fromRGBO(116, 116, 191, 1.0),),
                    )),


              ],
            ),

            Text("The voice will not work if you didn't pass" , style: TextStyle(color: Color.fromRGBO(194,52,28, 1)))



          ],
        ),
      ),

    );
  }
}
