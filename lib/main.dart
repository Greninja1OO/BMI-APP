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
  double a=250;
  double b=0;
  double c=0;
  double d=0;
  bool flag2= false;
  bool flag = false;
  String h="cm";
  String w="kg";
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
            width: 400,

            child: Column(

              children: [ Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,children:
[                Text(
                  "Height\n${height.toStringAsFixed(2)} $h",
                  textScaleFactor: 2,
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white),

                ),ElevatedButton(
  style: ButtonStyle(
      backgroundColor:
      MaterialStateProperty.all(Colors.green)),
  onPressed: (() { flag=!flag;
     if(flag)
       {h="feet";
         height=height*0.0328084;
       a=10;}
     else
       {h="cm";
         height=height/0.0328084;
       a=304.8;}
    setState(() {

    });
  }),
  child: const Text(
    "cm/feet",
    style: TextStyle(color: Colors.white, fontSize: 30),
  ),
),]),
                Slider(
                  value: height,
                  min: 0,
                  max: a,
                  onChanged: (value) {
                    setState(() {
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
            width: 400,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: (() => {
                    setState(() {
                      weight--;

                    })
                  }),
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ), Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly ,children: [ ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.green)),
                  onPressed: (() { flag2=!flag2;
                  if(flag2)
                 { w="lb";
                    weight=100;}
                  else
                  {w="kg";
                   weight=50;}
                  setState(() {

                  });
                  }),
                  child: const Text(
                    "kg/lb",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                Text(
                  "Weight ${(weight).toStringAsFixed(2)} $w",
                  textScaleFactor: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),]),
                FloatingActionButton(
                  onPressed: (() => {
                    setState(() {
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
              width: 400,
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
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>SecondPage(bmi:bmi)));
                        setState(() { if(flag)
                          b=height/0.0328084;
                          else
                            b=height;
                          if(flag2)
                            d=weight*0.454;
                          else
                            d=weight;
                      bmi = (d * 10000) / (b * b);

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
