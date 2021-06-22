import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var result = "";

  Widget btn(var textt) {
    String y = "Not / with 0 ";
    if (result.indexOf("/0") > -1) {
      setState(() {
        result = y;
      });
    } else {
      result = result;
    }
    return TextButton(
        onPressed: () {
          setState(() {
            result = result + textt;
          });
        },
        child: Text(
          textt,
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ));
  }

  clear() {
    setState(() {
      result = "";
    });
  }

  delete() {
    if (result.length > 0) {
      setState(() {
        result = result.substring(0, result.length - 1);
      });
    } else {
      result = result;
    }
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    });

    String s = result;

////*Removes everything after first '.0'
    if (result.indexOf(".0") > -1) {
      String a = s.substring(0, s.indexOf('.0'));
      setState(() {
        result = a;
      });
    } else {
      result = result;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                result,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  color: Colors.teal[500],
                  height: 80,
                  child: btn("7"),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.teal[500],
                  height: 80,
                  child: btn("8"),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.teal[500],
                  height: 80,
                  child: btn("9"),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.teal[200],
                  height: 80,
                  child: GestureDetector(
                    onLongPress: () {
                      HapticFeedback.vibrate();
                      clear();
                    },
                    child: IconButton(
                      onPressed: () {
                        delete();
                      },
                      icon: Icon(Icons.backspace_outlined),
                      color: Colors.white,
                      iconSize: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  color: Colors.teal[500],
                  height: 80,
                  child: btn("4"),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.teal[500],
                  height: 80,
                  child: btn("5"),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.teal[500],
                  height: 80,
                  child: btn("6"),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.teal[200],
                  height: 80,
                  child: btn("/"),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  color: Colors.teal[500],
                  height: 80,
                  child: btn("1"),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.teal[500],
                  height: 80,
                  child: btn("2"),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.teal[500],
                  height: 80,
                  child: btn("3"),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.teal[200],
                  height: 80,
                  child: btn("*"),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  color: Colors.teal[500],
                  height: 80,
                  child: btn("."),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.teal[500],
                  height: 80,
                  child: btn("0"),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.teal[500],
                  height: 80,
                  child: btn("00"),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.teal[200],
                  height: 80,
                  child: btn("-"),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  color: Colors.teal[200],
                  height: 80,
                  child: TextButton(
                      onPressed: () {
                        clear();
                      },
                      child: Text(
                        "C",
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      )),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.teal[200],
                  height: 80,
                  child: TextButton(
                      onPressed: () {
                        output();
                      },
                      child: Text(
                        "=",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                        ),
                      )),
                ),
              ),
              Expanded(
                child: Container(
                    color: Colors.teal[200], height: 80, child: btn("+")),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// class Home extends StatefulWidget {
//   Home({Key? key}) : super(key: key);

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   var result = "";
//   Widget btn(var textt) {
//     return ElevatedButton(
//         onPressed: () {
//           setState(() {
//             result = result + textt;
//           });
//         },
//         child: Text(textt));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: GridView.count(
//       crossAxisSpacing: 2,
//       mainAxisSpacing: 2,
//       crossAxisCount: 4,
//       children: <Widget>[
//         Container(
//           child: btn("1"),
//           color: Colors.teal[100],
//         ),
//         Container(
//           child: btn("2"),
//           color: Colors.teal[500],
//         ),
//         Container(
//           child: btn("3"),
//           color: Colors.teal[300],
//         ),
//         Container(
//           child: btn("4"),
//           color: Colors.teal[400],
//         ),
//         Container(
//           child: Text('Revolution is coming...'),
//           color: Colors.teal[500],
//         ),
//         Container(
//           child: Text('Revolution, they...'),
//           color: Colors.teal[600],
//         ),
//       ],
//     ));
//   }
// }

// class Home extends StatefulWidget {

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   var result = "";

//   Widget btn(var textt) {
//     return ElevatedButton(
//         onPressed: () {
//           setState(() {
//             result = result + textt;
//           });
//         },
//         child: Text(textt));
//   }

//   clear() {
//     setState(() {
//       result = "";
//     });
//   }

//   output() {
//     Parser p = Parser();
//     Expression exp = p.parse(result);
//     ContextModel cm = ContextModel();
//     double eval = exp.evaluate(EvaluationType.REAL, cm);

//     setState(() {
//       result = eval.toString();
//     });
//     String s = result;

// //Removes everything after first '.'
//     if (result.indexOf(".0") > -1) {
//       String a = s.substring(0, s.indexOf('.0'));
//       setState(() {
//         result = a;
//       });
//     } else {
//       result = result;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Text(
//             result,
//             style: TextStyle(
//               fontSize: 50,
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               btn("1"),
//               btn("2"),
//               btn("3"),
//               btn("4"),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               btn("5"),
//               btn("6"),
//               btn("7"),
//               btn("8"),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               btn("9"),
//               btn("0"),
//               btn("+"),
//               btn("-"),
//               btn("."),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               btn("*"),
//               btn("/"),
//               ElevatedButton(
//                   onPressed: () {
//                     clear();
//                   },
//                   child: Text("clear")),
//               ElevatedButton(
//                   onPressed: () {
//                     output();
//                   },
//                   child: Text("=")),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
