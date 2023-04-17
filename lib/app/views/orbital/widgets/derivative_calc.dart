import 'dart:developer';

import 'package:elfarqadan_app/app/config/enums.dart';
import 'package:elfarqadan_app/app/config/helpers/context_helpers.dart';
import 'package:elfarqadan_app/app/config/helpers/string_helpers.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class DifferentiationCalculator extends StatefulWidget {
  const DifferentiationCalculator({super.key});

  @override
  State<DifferentiationCalculator> createState() => _DifferentiationCalculatorState();
}

class _DifferentiationCalculatorState extends State<DifferentiationCalculator> {
  TextEditingController equationCtrl = TextEditingController();
  TextEditingController varCtrl = TextEditingController();
  String resEquation = "";
  Quantity selectedFrom = Quantity.distance;
  Quantity selectedTo = Quantity.acceleration;

  void setToInitial() {
    setState(() {
      equationCtrl.clear();
      varCtrl.clear();
      selectedFrom = Quantity.distance;
      selectedTo = Quantity.acceleration;
      resEquation = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Let's differentiate some equations and solve 'em!"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: context.width * 0.3,
              child: DropdownButton<Quantity>(
                alignment: Alignment.center,
                value: selectedFrom,
                items: Quantity.values
                    .map(
                      (e) => DropdownMenuItem<Quantity>(
                        value: e,
                        alignment: Alignment.center,
                        child: Text(
                          e.name.toCapitalized(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (val) {
                  if (val!.name != selectedTo.name) {
                    setState(() {
                      selectedFrom = val;
                    });
                    resEquation = "";
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          "Can't differentiate between the same quantities!!!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              width: context.width * 0.6,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: equationCtrl,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Equation",
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
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text("Differentiate to"),
            SizedBox(
              width: context.width * 0.3,
              child: DropdownButton<Quantity>(
                alignment: Alignment.center,
                value: selectedTo,
                items: Quantity.values
                    .sublist(selectedFrom.index + 1)
                    .map(
                      (e) => DropdownMenuItem<Quantity>(
                        value: e,
                        alignment: Alignment.center,
                        child: Text(
                          e.name.toCapitalized(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (val) {
                  if (val!.name != selectedFrom.name) {
                    setState(() {
                      selectedTo = val;
                      resEquation = "";
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          "Can't differentiate between the same quantities!!!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            const Text("At x ="),
            SizedBox(
              width: context.width * 0.15,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: varCtrl,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "x",
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            if (equationCtrl.text.isNotEmpty && resEquation.isNotEmpty && varCtrl.text.isNotEmpty)
              IconButton(
                onPressed: () {
                  setToInitial();
                },
                icon: const Icon(Icons.clear),
              ),
            OutlinedButton(
              onPressed: () {
                if (equationCtrl.text.isNotEmpty &&
                    selectedTo.index > selectedFrom.index &&
                    varCtrl.text.isNotEmpty) {
                  Parser p = Parser();
                  Expression equation = p.parse(equationCtrl.text);
                  Expression resultant = equation;

                  for (var i = selectedFrom.index; i < selectedTo.index; i++) {
                    log(selectedFrom.name);
                    resultant = resultant.derive("x");
                  }
                  ContextModel cm = ContextModel();
                  num x = num.parse(varCtrl.text);
                  cm.bindVariableName("x", Number(x));
                  setState(() {
                    resEquation = resultant.simplify().evaluate(EvaluationType.REAL, cm).toString();
                    log(resultant.simplify().evaluate(EvaluationType.REAL, cm).toString());
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        "Enter missing values!!!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                }
              },
              child: const Text("Calc"),
            ),
            Text(
              resEquation +
                  (selectedTo.index == 2 && resEquation.isNotEmpty
                      ? " m/s^2"
                      : selectedTo.index == 1 && resEquation.isNotEmpty
                          ? " m/s"
                          : ""),
            ),
          ],
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
