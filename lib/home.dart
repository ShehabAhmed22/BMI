import 'dart:math';
import 'package:bmi/result.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool ismale = true;
  int weight = 70;
  int age = 20;
  double heighvalue = 170;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          " Body Mass Index ",
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    X1(context, "male"),
                    const SizedBox(
                      width: 20,
                    ),
                    X1(context, "female"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: Colors.blueGrey),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Height",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.black),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text('${heighvalue.toStringAsFixed(1)}'),
                          const Text("cm",style: TextStyle(fontSize: 20,color: Colors.black),)

                        ],

                      ),
                      Slider(
                          min: 70,
                          max: 220,
                          value: heighvalue,
                          onChanged: (newvalue) =>
                              setState(() => heighvalue = newvalue))
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    X2(context, "weight"),
                    const SizedBox(
                      width: 20,
                    ),
                    X2(context, "age"),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.teal,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 16,
              child: TextButton(
                  onPressed: () {
                    var res = weight / pow(heighvalue/100, 2);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return Result(
                            age,
                            ismale,
                            res,
                          );
                        }));
                  },
                  child: const Text("Calculate",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))),
            )
          ],
        ),
      ),
    );
  }

  Expanded X1(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            ismale = (type == "male") ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: (ismale == true && type == "male" ||
                  (ismale == false && type == "female"))
                  ? Colors.teal
                  : Colors.blueGrey),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                type == "male" ? Icons.male : Icons.female,
                size: 100,
              ),
              Text(
                type == "male" ? 'male' : "female",
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded X2(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.blueGrey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              type == "age" ? "Age" : "Weight",
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              type == 'age' ? "$age" : "$weight",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: type == 'age' ? "age--" : "weight--",
                  onPressed: () =>
                      setState(() => type == 'age' ? age-- : weight--),
                  child: const Icon(Icons.remove),
                  mini: true,
                ),
                FloatingActionButton(
                  heroTag: type == 'age' ? "age++" : "weight++",
                  onPressed: () =>
                      setState(() => type == 'age' ? age++ : weight++),
                  child: const Icon(
                    Icons.add,
                    size: 35,
                  ),
                  mini: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
