import 'package:flutter/material.dart';
import "package:flutter_rating_bar/flutter_rating_bar.dart";

class SecondPage extends StatefulWidget {
  SecondPage({required this.bmi});
  double bmi;
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.black,
      appBar: AppBar(
     title: Text("Result"),
      ),
      body: Row( mainAxisAlignment: MainAxisAlignment.center,children:[Column(
        children:  [

                Container(
                    height: 62.5,
                    width: 150,
                    color: Colors.yellow,
                    child: Text( textAlign: TextAlign.center,
                        "Under Weight\n<18.5"
                    )
                ),
                Container(
                    height: 62.5,
                    width: 150,
                    color: Colors.green,
                    child: Text( textAlign: TextAlign.center,
                        "Normal Weight\n18.5-24.9"
                    )
                ),
                Container(
                    height: 62.5,
                    width: 150,
                    color: Colors.lightBlue,
                    child: Text( textAlign: TextAlign.center,
                        "Over Weight\n25.0-29.9"
                    )
                ),
                Container(
                    height: 62.5,
                    width: 150,
                    color: Colors.orange,
                    child: Text( textAlign: TextAlign.center,
                        "Obese Type I\n30.0-34.9"
                    )
                ),
                Container(
                    height: 62.5,
                    width: 150,
                    color: Colors.deepOrange,
                    child: Text( textAlign: TextAlign.center,
                        "Obese Type II\n35.0-39.0"
                    )
                ) ,Container(
                    height: 62.5,
                    width: 150,
                    color: Colors.red,
                    child: Text( textAlign: TextAlign.center,
                        "Obese Type III\n40<"
                    )

          ),
          Container(
          color: Color.fromARGB(255, 9, 91, 28),
          height: 100,
          width: 200,
          child: Text(
            "Your BMI is ${widget.bmi.toStringAsFixed(2)}",
            style: TextStyle(fontSize: 30,color: Colors.white,  ),
          ),

        ),
          Container(
            color: Color.fromARGB(255, 9, 91, 28),
            height: 50,
            width: 200,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Colors.green)),
              onPressed: (() {
                Navigator.pop(context);


              }),
              child: const Text(
                "Recalculate",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
        RatingBar.builder(
          initialRating: 3,
          itemCount: 5,
          itemBuilder: (context, index){
            switch (index) {
              case 0:
                return Icon(
                  Icons.sentiment_very_dissatisfied,
                  color: Colors.red,
                );
              case 1:
                return Icon(
                  Icons.sentiment_dissatisfied,
                  color: Colors.redAccent,
                );
              case 2:
                return Icon(
                  Icons.sentiment_neutral,
                  color: Colors.amber,
                );
              case 3:
                return Icon(
                  Icons.sentiment_satisfied,
                  color: Colors.lightGreen,
                );
              case 4:
                return Icon(
                  Icons.sentiment_very_satisfied,
                  color: Colors.green,

                );
              default: return Container();
            } ;
          },
          onRatingUpdate: (rating) {
            print(rating);
          })
           ],
      )
      ])
    );
  }
}

