import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double size = 0;
  String inputValue = "";
  String calculatedValue = "";
  String operator = "";

  @override
  Widget build(BuildContext context) {
    // make button smaller
    size = MediaQuery.of(context).size.width / 15;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                // Display section
                Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Text(
                    inputValue,
                    style: const TextStyle(color: Colors.white, fontSize: 40),
                    textAlign: TextAlign.right,
                  ),
                ),

                // Divider
                Divider(
                  color: Colors.grey[700],
                  thickness: 1.5,
                  indent: 10,
                  endIndent: 10,
                ),

                const SizedBox(height: 8),

                // Buttons grid
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        calciButton("7", Colors.transparent),
                        calciButton("8", Colors.transparent),
                        calciButton("9", Colors.transparent),
                        calciButton("/", Colors.orange),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        calciButton("4", Colors.transparent),
                        calciButton("5", Colors.transparent),
                        calciButton("6", Colors.transparent),
                        calciButton("*", Colors.orange),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        calciButton("1", Colors.transparent),
                        calciButton("2", Colors.transparent),
                        calciButton("3", Colors.transparent),
                        calciButton("-", Colors.orange),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        calciButton("0", Colors.transparent),
                        calciButton(".", Colors.transparent),
                        calciButton("=", Colors.orange),
                        calciButton("+", Colors.orange),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Clear button
                calciButton("Clear", Colors.blueGrey.shade800),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget calciButton(String text, Color bgColor) {
    return InkWell(
      onTap: () {
        if (text == "Clear") {
          setState(() {
            inputValue = "";
            calculatedValue = "";
            operator = "";
          });
        } else if (text == "+" || text == "-" || text == "*" || text == "/") {
          setState(() {
            calculatedValue = inputValue;
            inputValue = "";
            operator = text;
          });
        } else if (text == "=") {
          setState(() {
            double calci = double.tryParse(calculatedValue) ?? 0;
            double input = double.tryParse(inputValue) ?? 0;

            if (operator == "+") {
              inputValue = (calci + input).toString();
            } else if (operator == "-") {
              inputValue = (calci - input).toString();
            } else if (operator == "*") {
              inputValue = (calci * input).toString();
            } else if (operator == "/") {
              inputValue = (input != 0) ? (calci / input).toString() : "Error";
            }
          });
        } else {
          setState(() {
            inputValue = inputValue + text;
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(150),
          border: Border.all(color: Colors.white),
        ),
        margin: const EdgeInsets.all(4),
        height: size,
        width: size,
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
