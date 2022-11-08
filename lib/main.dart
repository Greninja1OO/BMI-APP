import 'dart:ui' as ui;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:poject/second%20page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context)=>MyHomePage(),

      },
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Column(

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
                children: [
                  Container(
                    color: Color.fromARGB(255, 9, 91, 28),
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.green)),
                      onPressed: (() {
                        Navigator.pushNamed(context,'/second');

                        setState(() { flag=true;
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
    ]),]),);
  }
}
