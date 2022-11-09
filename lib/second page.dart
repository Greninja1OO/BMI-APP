import 'package:flutter/material.dart';
import "package:flutter_rating_bar/flutter_rating_bar.dart";
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SecondPage extends StatefulWidget {
  SecondPage({required this.bmi});
  double bmi;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String str='';

  @override
  Widget build(BuildContext context) {
    if(widget.bmi<18.5)
      str="Under Weight";
    else if(widget.bmi<25)
      str="Normal Weight";
    else if(widget.bmi<30)
      str="Over Weight";
    else if(widget.bmi<35)
      str="Obese Type I";
    else if(widget.bmi<40)
      str="Obese Type II";
    else if(widget.bmi>=40)
      str="Obese Type III";
    return Scaffold( backgroundColor: Colors.black,
      appBar: AppBar(
     title: Text("Result"),
      ),
      body: Row( mainAxisAlignment: MainAxisAlignment.center,children:[Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:  [ Container(height: 400,width: 350, decoration: BoxDecoration(color: Color(0xff63666A),
        borderRadius: const BorderRadius.all(const Radius.circular(80))
    ),child: Column( crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children:[const Text("Your BMI score is", style: TextStyle(fontSize: 30,color: Colors.white),
        ),SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(minimum: 0, maximum: 55,
                  ranges: <GaugeRange>[
                    GaugeRange(startValue: 0, endValue: 18.5, color:Colors.yellow),
                    GaugeRange(startValue: 18.5,endValue: 25,color: Colors.green),
                    GaugeRange(startValue: 25,endValue: 30,color: Colors.lightBlue),
                    GaugeRange(startValue: 30, endValue: 35, color:Colors.orange),
                    GaugeRange(startValue: 35,endValue: 40,color: Colors.deepOrange),
                    GaugeRange(startValue: 40, endValue: 55, color:Colors.red),
                  ],
                  pointers: <GaugePointer>[
                    NeedlePointer(value: widget.bmi)],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(widget: Container(alignment: Alignment.center,child:
                    Text('\n${widget.bmi.toStringAsFixed(2)}\nYou are\n$str',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,)),
                        angle: 90, positionFactor: 0.5
                    )]
              )])
        ])),
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
          initialRating: 0,
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

