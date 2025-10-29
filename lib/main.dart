// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   double size = 0;
//   String inputValue = "";
//   String calculatedValue = "";
//   String operator = "";

//   @override
//   Widget build(BuildContext context) {
//     // make button smaller
//     size = MediaQuery.of(context).size.width /5;

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.blueGrey[900],
//         body: SingleChildScrollView(
//           //  child: Padding(
//             // padding: const EdgeInsets.all(50),
//             child: 
//             Column(
//               children: [
//                 // Display section
//                 Container(
//                   alignment: Alignment.bottomRight,
//                    padding: const EdgeInsets.all(20),
//                   child: Text(
//                     inputValue,
//                     style: const TextStyle(color: Colors.white, fontSize: 40),
//                     // textAlign: TextAlign.right,
//                   ),
//                 ),

//                 // Divider
//                 Divider(
//                   color: Colors.grey[700],
//                   thickness: 2,
//                   indent: 15,
//                   endIndent: 15,
//                 ),

//                 const SizedBox(height: 8),

//                 // Buttons grid
//                 Column(
//                   children: [
//                     Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         calciButton("7", Colors.transparent),
//                         calciButton("8", Colors.transparent),
//                         calciButton("9", Colors.transparent),
//                         calciButton("/", Colors.orange),
//                       ],
//                     ),
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: [
//                         calciButton("4", Colors.transparent),
//                         calciButton("5", Colors.transparent),
//                         calciButton("6", Colors.transparent),
//                         calciButton("*", Colors.orange),
//                       ],
//                     ),
//                     Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         calciButton("1", Colors.transparent),
//                         calciButton("2", Colors.transparent),
//                         calciButton("3", Colors.transparent),
//                         calciButton("-", Colors.orange),
//                       ],
//                     ),
//                     Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         calciButton("0", Colors.transparent),
//                         calciButton(".", Colors.transparent),
//                         calciButton("=", Colors.orange),
//                         calciButton("+", Colors.orange),
//                       ],
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: 8),

//                 // Clear button
//                 calciButton("AC", Colors.blueGrey.shade800),
//               ],
//             ),
//           ),
//         ),
//         );
    
//   }

//   Widget calciButton(String text, Color bgColor) {
//     return InkWell(
//       onTap: () {
//         if (text == "AC") {
//           setState(() {
//             inputValue = "";
//             calculatedValue = "";
//             operator = "";
//           });
//         } else if (text == "+" || text == "-" || text == "*" || text == "/") {
//           setState(() {
//             calculatedValue = inputValue;
//             inputValue = "";
//             operator = text;
//           });
//         } else if (text == "=") {
//           setState(() {
//             double calci = double.parse(calculatedValue); //?? 0;
//             double input = double.parse(inputValue); //?? 0;

//             if (operator == "+") {
//               inputValue = (calci + input).toString();
//             } else if (operator == "-") {
//               inputValue = (calci - input).toString();
//             } else if (operator == "*") {
//               inputValue = (calci * input).toString();
//             } else if (operator == "/") {
//               inputValue = (calci / input).toString();
//             }              //(input != 0) ?   : "Error";
//           });
//         } else {
//           setState(() {
//             inputValue = inputValue + text;
//           });
//         }
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: bgColor,
//           borderRadius: BorderRadius.circular(150),
//           border: Border.all(color: Colors.white),
//         ),
//         margin: const EdgeInsets.all(10),
//         height: size,
//         width: size,
//         alignment: Alignment.center,
//         child: Text(
//           text,
//           style:TextStyle(color: Colors.white, fontSize: 30),
//         ),
//       ),
//     );
//   }
// }



// ------------------------------------------------------------------------------------------------------------



import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String inputValue = "";
  String result = "";
  bool showScientific = false;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width / 5;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Display area
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        inputValue,
                        style: const TextStyle(color: Colors.white, fontSize: 36),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        result,
                        style: const TextStyle(color: Colors.grey, fontSize: 28),
                      ),
                    ],
                  ),
                ),
              ),

              // Toggle arrow
              GestureDetector(
                onTap: () {
                  setState(() {
                    showScientific = !showScientific;
                  });
                },
                child: Icon(
                  showScientific
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.grey[400],
                  size: 35,
                ),
              ),

              // Scientific drawer (slides down)
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: showScientific ? 100 : 0,
                color: Colors.grey[900],
                child: showScientific
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            sciButton("sin"),
                            sciButton("cos"),
                            sciButton("tan"),
                            sciButton("log"),
                            sciButton("ln"),
                            sciButton("√"),
                            sciButton("^"),
                            sciButton("π"),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
              ),

              const SizedBox(height: 10),
              buttonRow(["C", "%", "⌫", "÷"], size),
              buttonRow(["7", "8", "9", "×"], size),
              buttonRow(["4", "5", "6", "−"], size),
              buttonRow(["1", "2", "3", "+"], size),
              buttonRow(["00", "0", ".", "="], size),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonRow(List<String> texts, double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: texts.map((text) => calciButton(text, size)).toList(),
    );
  }

  Widget calciButton(String text, double size) {
    return InkWell(
      onTap: () => onPressed(text),
      child: Container(
        margin: const EdgeInsets.all(8),
        height: size,
        width: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 26),
        ),
      ),
    );
  }

  Widget sciButton(String text) {
    return InkWell(
      onTap: () => onScientificPressed(text),
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
        decoration: BoxDecoration(
          color: Colors.teal[700],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  void onPressed(String text) {
    setState(() {
      if (text == "C") {
        inputValue = "";
        result = "";
      } else if (text == "⌫") {
        if (inputValue.isNotEmpty) {
          inputValue = inputValue.substring(0, inputValue.length - 1);
        }
      } else if (text == "=") {
        calculate();
      } else {
        inputValue += text;
      }
    });
  }

  void onScientificPressed(String text) {
    setState(() {
      inputValue += text;
    });
  }

  void calculate() {
    try {
      String finalInput = inputValue
          .replaceAll('×', '*')
          .replaceAll('÷', '/')
          .replaceAll('−', '-')
          .replaceAll('√', 'sqrt')
          .replaceAll('π', 'pi');

      Parser p = Parser();
      Expression exp = p.parse(finalInput);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      setState(() {
        result = eval.toString();
      });
    } catch (e) {
      setState(() {
        result = "Error";
      });
    }
  }
}
