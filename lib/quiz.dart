import 'package:flutter/material.dart';

/*
class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz'),backgroundColor: Colors.orange,),
      body: Center(child: Text('Quiz',style: TextStyle(fontSize: 22),),
      ),

    );
  }

}*/
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  //int counter;
  //Quiz(this.counter);
  //const Quiz({Key? key}) : super(key: key);
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  //this code for counter value

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz'),backgroundColor: Colors.orange,),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Counter=${widget.counter}',style: TextStyle(fontSize: 22),),
            ElevatedButton(
              child: Text('Add'),
              onPressed: () {
                setState(() {
                  ++widget.counter;
                });
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
                elevation: 5, // Elevation
              ),

            )
          ],

        ),
      ),

    );
  }*/

  //

  int currentQuestion = 0;
  int score = 0;
  final quiz = [
    {
      'title': 'Question1',
      'answers': [
        {'answer': 'Answer 11', 'isCorrect': false},
        {'answer': 'Answer 12', 'isCorrect': false},
        {'answer': 'Answer 13', 'isCorrect': true},
      ]
    },
    {
      'title': 'Question2',
      'answers': [
        {'answer': 'Answer 21', 'isCorrect': true},
        {'answer': 'Answer 22', 'isCorrect': false},
        {'answer': 'Answer 23', 'isCorrect': false},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
          backgroundColor: Colors.orange,
        ),
        body: (this.currentQuestion >= quiz.length)
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Score : ${(score / quiz.length * 100).round()} %',
                        style:
                            TextStyle(fontSize: 22, color: Colors.deepOrange)),
                    ElevatedButton(
                      child: Text(
                        'Restart ...',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      onPressed: () {
                        setState(() {
                          currentQuestion = 0;
                          score = 0;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.deepOrangeAccent,// Text color
                        elevation: 5, // Elevation
                      ),
                    )
                  ],
                ),
              )
            : ListView(
                children: <Widget>[

                  ListTile(
                    title: Center(child: Text('Question : ${currentQuestion+1}/${quiz.length}',style:
                    TextStyle(fontSize: 22,fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent))) ,
                  ),
                  ListTile(
                    title: Text ('${quiz[currentQuestion]['title']} ?',
                      style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,),),),
                  ...(quiz[currentQuestion]['answers'] as List<Map<String,Object>>).map((answer){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrangeAccent,// Text color// Elevation
                        ),
                        onPressed: (){
                          setState(() {
                            if(answer['isCorrect']==true) ++score;
                            ++currentQuestion;
                          });
                        },
                        child:Container(
                          child: Align( alignment: Alignment.centerLeft,
                              child: Text(answer['answer'] as String,style: TextStyle(color: Colors.white,fontSize: 22,fontWeight:
                              FontWeight.bold),)),padding: EdgeInsets.all(10),),
                      ),
                    );
                  })
                ],
              )
    );
  }
}
