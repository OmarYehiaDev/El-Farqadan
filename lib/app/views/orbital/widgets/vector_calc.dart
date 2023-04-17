import 'dart:developer';

import 'package:elfarqadan_app/app/config/helpers/context_helpers.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' hide Colors;

import '../../../config/enums.dart';

class VectorCalculator extends StatefulWidget {
  final Operation operation;
  const VectorCalculator({
    super.key,
    required this.operation,
  });

  @override
  State<VectorCalculator> createState() => _VectorCalculatorState();
}

class _VectorCalculatorState extends State<VectorCalculator> {
  TextEditingController vectorOneCtrl = TextEditingController();
  TextEditingController vectorTwoCtrl = TextEditingController();
  String res = "";
  String strOperator() {
    switch (widget.operation) {
      case Operation.add:
        return "+";
      case Operation.sub:
        return "-";
      case Operation.cross:
        return "×";
      case Operation.dot:
        return ".";
    }
  }

  void calcResult<T extends Vector>(vecA, T vecB) {
    switch (widget.operation) {
      case Operation.add:
        setState(() {
          res = (vecA + vecB).toString();
        });
        break;
      case Operation.sub:
        setState(() {
          res = (vecA - vecB).toString();
        });
        break;
      case Operation.cross:
        setState(() {
          setState(() {
            res = (vecA.cross(vecB)).toString();
          });
        });
        break;
      case Operation.dot:
        setState(() {
          res = (vecA.dot(vecB)).toString();
        });
        break;
    }
  }

  void setToInitial() {
    setState(() {
      vectorOneCtrl.clear();
      vectorTwoCtrl.clear();
      res = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Vector A ${strOperator()} Vector B"),
        const Text("Enter components separated by comma ( , )"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("Vector A"),
            SizedBox(
              width: context.width * 0.4,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: vectorOneCtrl,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("Vector B"),
            SizedBox(
              width: context.width * 0.4,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: vectorTwoCtrl,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (vectorOneCtrl.text.isNotEmpty && vectorTwoCtrl.text.isNotEmpty && res.isNotEmpty)
                IconButton(
                  onPressed: () {
                    setToInitial();
                  },
                  icon: const Icon(Icons.clear),
                ),
              OutlinedButton(
                onPressed: () {
                  dynamic vecA;
                  dynamic vecB;
                  List<double> vectorOne = [];
                  List<double> vectorTwo = [];
                  if (vectorOneCtrl.text.isNotEmpty && vectorTwoCtrl.text.isNotEmpty) {
                    for (String element in vectorOneCtrl.text.split(",")) {
                      vectorOne.add(double.parse(element));
                    }
                    for (String element in vectorTwoCtrl.text.split(",")) {
                      vectorTwo.add(double.parse(element));
                    }
                    if (vectorOne.length == 3) {
                      vecA = Vector3.array(vectorOne);
                    } else {
                      vecA = Vector2.array(vectorOne);
                    }
                    if (vectorTwo.length == 3) {
                      vecB = Vector3.array(vectorTwo);
                    } else {
                      vecB = Vector2.array(vectorTwo);
                    }
                    if (vecB is Vector2 && vecA is Vector2) {
                      log((vecA + vecB).toString());
                      calcResult<Vector2>(vecA, vecB);
                    } else if (vecB is Vector3 && vecA is Vector3) {
                      log((vecA + vecB).toString());
                      calcResult<Vector3>(vecA, vecB);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            "Vectors must be the same length!!!",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          "Enter vectors first!!!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    );
                  }
                },
                child: const Text("Calcualte Vector C"),
              ),
              Text(res),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Divider(
            endIndent: context.width * 0.3,
            indent: context.width * 0.3,
            height: 16,
            thickness: 1,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
