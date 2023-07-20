import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nutribot',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 0, 0)),
        useMaterial3: true,
      ),
      home: Nutribot(),
    );
  }
}

class Nutribot extends StatefulWidget {
  @override
  _NutribotState createState() => _NutribotState();
}

class _NutribotState extends State<Nutribot> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(120, 119, 118, 118),
      // This widget defines the bar on upper edge
      appBar: AppBar(
        // This Widged adds the bar on the upper edge of the view
        backgroundColor: const Color.fromARGB(120, 119, 118, 118),
        title: RichText(
          // This makes it possible to adjust the properties of text more comprehensively
          text: const TextSpan(
            // This Widget allows to handle parts of the line separetly
            children: <TextSpan>[
              TextSpan(
                  text: 'Nutri',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 78, 255, 84),
                      fontSize: 30)),
              TextSpan(
                  text: 'Bot',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 96, 178, 245),
                      fontSize: 30)),
            ],
          ),
        ),
      ),

      // The main menu view:
      body: Padding(
        padding: EdgeInsets.all(screenWidth *
            0.08), // This Widget is used to determine how much space the background behind the containers take
        child: SingleChildScrollView(
          //  Makes scrolling possible
          child: Column(
              //  This Widget is used to make one column that has three containers in it
              mainAxisAlignment: MainAxisAlignment
                  .spaceEvenly, // This Widget defines how the three containers take their place in the the column
              children: <Widget>[
                // The first "Button"
                Container(
                  // This Widget is used to make the box frame that has text "Temperature and humidity" in it
                  constraints: const BoxConstraints(
                    // This Widget determines the size of the box
                    minHeight: 50,
                    maxHeight: 100,
                  ),
                  decoration: BoxDecoration(
                      // This Widget determines the styling attributes of the box
                      border: Border.all(
                          color: Colors.white,
                          width:
                              1), // This Widget determines the attributes of border or edge of the box
                      color: const Color.fromARGB(255, 73, 73,
                          73), // This This Widget determines the color of the box
                      borderRadius: BorderRadius.circular(
                          10)), // This Widget makes it possible to adjust the shape of the edge or the border of the box
                  padding: EdgeInsets.all(0.01 *
                      screenWidth), // This Widget adds padding inside the box
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      const Expanded(
                        flex: 5,
                        child: Text(
                          "Temperature and humidity",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            decoration: TextDecoration.none,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [Colors.red, Colors.blue],
                            //tileMode: TileMode.mirror,
                          ).createShader(bounds),
                          child: const Icon(
                            Icons.dew_point,
                            size: 50.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // The second "Button"
                Container(
                  constraints: const BoxConstraints(
                    minHeight: 50,
                    maxHeight: 100,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    color: const Color.fromARGB(255, 73, 73, 73),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: Text(
                          "Irrigation scheduling",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            decoration: TextDecoration.none,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Icon(
                          Icons.water_drop,
                          size: 50.0,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // The third "Button"
                Container(
                  constraints: const BoxConstraints(),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                    color: const Color.fromARGB(255, 73, 73, 73),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(50),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    crossAxisCount: 1,
                    childAspectRatio: screenWidth / 200,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 5,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 20.0,
                          bottom: 20.0,
                        ),
                        child: Text(
                          "Garden statistics",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            decoration: TextDecoration.none,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth / 2,
                        height: 200,
                        child: CustomPaint(
                          painter: HumidityPainter(),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth / 2,
                        height: 200,
                        child: CustomPaint(
                          painter: TemperaturePainter(),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth / 2,
                        height: 200,
                        child: CustomPaint(
                          painter: GrowthPainter(),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),

      // This widget defines the lower bar navigation menu:
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
      ),
    );
  }
}

class HumidityPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    var paint2 = Paint()..color = const Color.fromARGB(255, 255, 255, 255);

    // Create x-axis
    canvas.drawLine(Offset(0, size.height / 1.5),
        Offset(size.width, size.height / 1.5), paint2);

    // Create y-axis
    canvas.drawLine(Offset(size.width / 2, 35),
        Offset(size.width / 2, size.height - 30), paint2);

    var textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

// Text at the top of the graph
    textPainter.text = const TextSpan(
        text: 'Humidity %',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ));
    textPainter.layout();
    textPainter.paint(
        canvas,
        Offset(size.width / 2 - 35,
            10)); // This line sets the position of the text.

// Text at the bottom of the graph
    textPainter.text = const TextSpan(
        text: 'Prediction',
        style: TextStyle(color: Colors.white, fontSize: 16));
    textPainter.layout();
    textPainter.paint(canvas,
        Offset(size.width * 0.75 - textPainter.width / 2, size.height - 40));

// Text at the bottom of the graph
    textPainter.text = const TextSpan(
        text: 'Measured', style: TextStyle(color: Colors.white, fontSize: 16));
    textPainter.layout();
    textPainter.paint(canvas,
        Offset(size.width * 0.25 - textPainter.width / 2, size.height - 40));
    // Random function
    var random = Random();
    var path = Path();
    path.moveTo(0, size.height / 2);

    for (int i = 0; i < size.width.toInt(); i++) {
      path.lineTo(
          i.toDouble(), size.height / 1.7 + 0.5 * random.nextInt(50) - 25);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class TemperaturePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    var paint2 = Paint()..color = const Color.fromARGB(255, 255, 255, 255);

// Create x-axis
    canvas.drawLine(Offset(0, size.height / 1.5),
        Offset(size.width, size.height / 1.5), paint2);

    // Create y-axis
    canvas.drawLine(Offset(size.width / 2, 35),
        Offset(size.width / 2, size.height - 30), paint2);

    var textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

// Text at the top of the graph
    textPainter.text = const TextSpan(
        text: 'Temperature K',
        style: TextStyle(
          color: Colors.red,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ));
    textPainter.layout();
    textPainter.paint(
        canvas,
        Offset(size.width / 2 - 50,
            10)); // This line sets the position of the text.

// Text at the bottom of the graph
    textPainter.text = const TextSpan(
        text: 'Prediction',
        style: TextStyle(color: Colors.white, fontSize: 16));
    textPainter.layout();
    textPainter.paint(canvas,
        Offset(size.width * 0.75 - textPainter.width / 2, size.height - 40));

// Text at the bottom of the graph
    textPainter.text = const TextSpan(
        text: 'Measured',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ));
    textPainter.layout();
    textPainter.paint(canvas,
        Offset(size.width * 0.25 - textPainter.width / 2, size.height - 40));

    // Random funktio
    var random = Random();
    var path = Path();
    path.moveTo(0, size.height / 2);

    for (int i = 0; i < size.width.toInt(); i++) {
      path.lineTo(
          i.toDouble(), size.height / 1.5 + 0.2 * random.nextInt(50) - 25);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class GrowthPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    var paint2 = Paint()..color = const Color.fromARGB(255, 255, 255, 255);

    // Create x-axis
    canvas.drawLine(Offset(0, size.height / 1.5),
        Offset(size.width, size.height / 1.5), paint2);

    // Create y-axis
    canvas.drawLine(Offset(size.width / 2, 35),
        Offset(size.width / 2, size.height - 30), paint2);

    var textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

// Text at the top of the graph
    textPainter.text = const TextSpan(
        text: 'Mean length cm',
        style: TextStyle(
          color: Colors.green,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ));
    textPainter.layout();
    textPainter.paint(
        canvas,
        Offset(size.width / 2 - 60,
            10)); // This line sets the position of the text.

// Text at the bottom of the graph
    textPainter.text = const TextSpan(
        text: 'Prediction',
        style: TextStyle(color: Colors.white, fontSize: 16));
    textPainter.layout();
    textPainter.paint(canvas,
        Offset(size.width * 0.75 - textPainter.width / 2, size.height - 40));

// Text at the bottom of the graph
    textPainter.text = const TextSpan(
        text: 'Measured', style: TextStyle(color: Colors.white, fontSize: 16));
    textPainter.layout();
    textPainter.paint(
        canvas,
        Offset(size.width * 0.25 - textPainter.width / 2,
            size.height - 40)); // This line sets the position of the text.

// Continuous function:
    var path = Path();
    path.moveTo(0, size.height / 2 + sin(0));

    for (int i = 0; i < size.width.toInt(); i++) {
      path.lineTo(
          i.toDouble(), size.height / 2 - 0.3 * sin(i / 100) * 50 + i / 100);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
