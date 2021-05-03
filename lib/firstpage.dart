import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:quiz_cat_app/questions.dart';
import 'package:quiz_cat_app/quiz_Brain.dart';
import 'package:quiz_cat_app/scorepage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List <Icon> Scorekeeper = [];
  /*List <String> Questions = [
    "Marrakesh is the capital of Morocco?" ,//false
    "An octopus has three hearts?" ,//true
    "Mount Kilimanjaro is the highest mountain in the world?", //false
    "Nepal is the only country in the world which have a non-rectangular flag?", //true
    "The Mona Liza was stolen from the Louvre in 1911?", //true
    "The Great Wall of China is visible from space?", //false

  ];

  List <bool> Answers = [
    false,
    true,
    false,
    true,
    true,
    false
  ];*/
  //int questionNum= 0 ;
  int scoreSum =0;
   QuizBrain quizBrain = QuizBrain();
   void chickAnswer(bool rightAnswer){

     bool correctAnswer = quizBrain.getQuetionAns();
     setState(() {

       if (quizBrain.isFinished() == true) {

         Alert(
           context: context,
           title: 'Finished!',
           desc: "You've reached the end of the quiz.",
           buttons: [
             DialogButton(
               child: Text(
                 "Score",
                 style: TextStyle(color: Colors.white, fontSize: 20),
               ),
               onPressed: () => Navigator.push(context,
                   MaterialPageRoute(builder: (context) => ScorePage(scoreSum))),
               color: Color.fromRGBO(0, 179, 134, 1.0),
             ),
             DialogButton(
               child: Text(
                 "Reset",
                 style: TextStyle(color: Colors.white, fontSize: 20),
               ),
               onPressed: () => Navigator.push(context,
                   MaterialPageRoute(builder: (context) => HomePage())),
               gradient: LinearGradient(colors: [
                 Color.fromRGBO(116, 116, 191, 1.0),
                 Color.fromRGBO(52, 138, 199, 1.0)
               ]),
             )
           ],
         ).show();



         Scorekeeper.clear();
         quizBrain.reset();


       }
     if(correctAnswer == rightAnswer){
       Scorekeeper.add(Icon(Icons.check , color: Colors.green,),);
       scoreSum++;

     }else {
       Scorekeeper.add(Icon(Icons.close , color: Colors.red,),);
     }

       quizBrain.questionServer();
       //  questionNum++  ;

     });
   }





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
              image: AssetImage('assets/images/catlogo.png')),

        ),
        child: Column(
          children: [


            Padding(
              padding: const EdgeInsets.only(top: 90 , bottom: 70),
              child: Text(quizBrain.getQuetionText(), style: TextStyle(fontSize: 25 , color: Color.fromRGBO(194,52,28, 1)), textAlign: TextAlign.center,),
            ),

          //Text("Does sun raise at morning?", style: TextStyle(fontSize: 25 , color: Color.fromRGBO(194,52,28, 1)),),

          Transform.scale(
            scale: 1.7,

              child: Padding(
                padding: const EdgeInsets.all(30),
                child: FlatButton(onPressed: (){
                  chickAnswer(true);
                }, child: Text("True" , style: TextStyle(color: Colors.white),) , color: Color.fromRGBO(0, 179, 134, 1.0),),
              )),


            Transform.scale(
                scale: 1.7,

                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: FlatButton(onPressed: (){

                    chickAnswer(false);
                  }, child: Text("False" , style: TextStyle(color: Colors.white),) , color: Color.fromRGBO(21, 2, 32, 1.0),),
                )),
            Row(
              children: Scorekeeper,

            ),

            //final player = AudioCache();
            //                     player.play('music.mp3');


          ],
        ),
      ),

    );
  }
}



