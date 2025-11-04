import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(ColorChanger());

class ColorChanger extends StatelessWidget {
   const ColorChanger({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorChangerScreen(),
    );
  }
}


class ColorChangerScreen extends StatefulWidget {
  @override
  _ColorChangerScreenState createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  Color color = Colors.green;
  int red = 0, green = 0, blue = 0;

  int directionIndex = 0;

  
  final List<List<Alignment>> directions = [
    [Alignment.topCenter, Alignment.bottomCenter], // Vertical
    [Alignment.centerLeft, Alignment.centerRight], // Horizontal
    [Alignment.topLeft, Alignment.bottomRight],    // Left-Right
    [Alignment.topRight, Alignment.bottomLeft],    // Right-Left
  ];

  final List<String> directionNames = [
    "Vertical",
    "Horizontal",
    "Left-Right",
    "Right-Left",
  ];

  void changeColor() {
    setState(() {
      red = Random().nextInt(256);
      green = Random().nextInt(256);
      blue = Random().nextInt(256);
      color = Color.fromRGBO(red, green, blue,1.0);
    });
  }

  void changeDirection() {
    setState(() {
      directionIndex = (directionIndex + 1) % directions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: directions[directionIndex][1],
            end: directions[directionIndex][0],
            colors: [color,color.withOpacity(0.1), color],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Colors.white,
                    ),
                  ),
                onPressed: changeColor,
                child: Text('Change Color', style: TextStyle(color: Colors.white) ),
              ),
              SizedBox(height: 10),
              Text(
                'Red: $red Green: $green Blue: $blue',
                style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Colors.white,
                    ),
                  ),
                onPressed: changeDirection,
                child: Text('Change Direction', style: TextStyle(color: Colors.white) ) ,
              ),
              SizedBox(height: 10),
              Text(
                'Direction: ${directionNames[directionIndex]}',
                style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

