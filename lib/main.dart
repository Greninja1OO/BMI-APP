import 'dart:ui' as ui;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double height = 100;
  double weight = 50;
  double bmi = 0.0;
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    bmi = (weight*10000) / (height*height);
    return Scaffold( backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Health Check"),
      ),
      body: Column( crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Text(
          " BMI Calculator",
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, foreground: Paint()
            ..shader= ui.Gradient.linear(
                const Offset(0,200),
                const Offset(200,400),
                <Color>[
                  Colors.purpleAccent,
                  Colors.blueAccent

                ]

            )),

        ),
        Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [ Row(
          children: <Widget>[
            Icon(
              Icons.male_rounded,size: 70,
              color: Colors.blue,
            ),
            Container(
              width: 100,
            ),
            Icon(
              Icons.female_rounded,size: 70,
              color: Colors.blue,
            )
          ]



        ),

          Container(decoration: BoxDecoration(color: Color(0xff63666A),
            borderRadius: const BorderRadius.all(const Radius.circular(80))
          ),
            height: 150,
            width: 350,

            child: Column(

              children: [
                Text(
                  "Height\n${height.toStringAsFixed(2)} cm",
                  textScaleFactor: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),

                ),
                Slider(
                  value: height,
                  min: 0,
                  max: 250,
                  onChanged: (value) {
                    setState(() { flag=false;
                      height = value;
                    });
                  },
                )
              ],
            ),
          ),
          Container(
            height: 10,
            width: 100,
          ),
          Container(decoration: BoxDecoration(color: Color(0xff63666A),
              borderRadius: const BorderRadius.all(const Radius.circular(80))
          ),

            height: 125,
            width: 350,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: (() => {
                    setState(() { flag=false;
                      weight--;
                    })
                  }),
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                Text(
                  "Weight\n${(weight).toStringAsFixed(2)} kg",
                  textScaleFactor: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                FloatingActionButton(
                  onPressed: (() => {
                    setState(() { flag=false;
                      weight++;
                    })
                  }),
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                )
              ],
            ),
          ),Container(
            height: 10
          ),
          Container(decoration: BoxDecoration(color: Color(0xff63666A),
              borderRadius: const BorderRadius.all(const Radius.circular(80))
          ),

              height: 100,
              width: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [ Visibility(
                    child: Text(
                      "Your BMI is ${bmi.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 30,color: Colors.white,  ),
                ), visible: flag),
                  Container(
                    color: Color.fromARGB(255, 9, 91, 28),
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.green)),
                      onPressed: (() { setState(() { flag=true;
                      bmi = (weight * 10000) / (height * height);

                      });
                      }),
                      child: const Text(
                        "Calculate",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
        Column( mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
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
          )]
        ),
    ]),]),);
  }
}
