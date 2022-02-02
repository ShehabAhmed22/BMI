import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  double resulte;
  bool ismale;
  int age;

  Result(this.age,this.ismale, this.resulte, {Key? key}) : super(key: key);


  String get resultText {
    String res="";
    if (resulte <= 18.5) {
      res ="Underweight";
    } else if(resulte > 18.5 && resulte <=24.9) {
      res ="Normal";
    } else if (resulte > 25 && resulte <=29.5) {
      res ="OverWight";
    } else if (resulte >30) {
      res ="obese";
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: (const Text(
          "resulte",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        )),
      ),
      body: SafeArea(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 45, color: Colors.white),
          child: Container(
            color: Colors.black,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("age : ${age}"),
                  Text("Gender : ${ismale?"male":"female"}"),
                  Text("Result : ${resulte.toStringAsFixed(1)}"),
                  Text("Healthiness : ${resultText}"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
