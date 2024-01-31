import "dart:async";

import "package:exercise/src/models/exercise_model.dart";
import "package:flutter/material.dart";

class ExerciseDetailsScreen extends StatefulWidget {
  // class ExerciseDetailsScreen extends StatefulWidget
  ExerciseModel exerciseModel;
  ExerciseDetailsScreen({Key? key, required this.exerciseModel})
      : super(key: key);

  @override
  State<ExerciseDetailsScreen> createState() => _ExerciseDetailsScreenState();
} // class ExerciseDetailsScreen extends StatefulWidget

class _ExerciseDetailsScreenState extends State<ExerciseDetailsScreen> {
  // class _ExerciseDetailsScreenState extends State<ExerciseDetailsScreen>
  bool isRuning = false;
  int passedSeconds = 0;
  int minutes = 0;
  int hourse = 0;
  int days = 0;
  String stopWatch = "00";
  Color stopWatchColor = Colors.blue;

  void startTimer() {
    // void startTimer()
    Future.delayed(Duration(seconds: 1), () {
      // Future.delayed
      setState(() {
        // setState
        if (passedSeconds == 59) {
          // Reset On 60 Seconds
          passedSeconds = 0;
          if (stopWatchColor == Colors.blue) {
            // stopWatchColor
            stopWatchColor = Colors.green;
          } else if (stopWatchColor == Colors.green) {
            stopWatchColor = Colors.red;
          } else if (stopWatchColor == Colors.red) {
            stopWatchColor = Colors.blue;
          } // stopWatchColor
          if (minutes == 59) {
            // Reset On 60 Minuts
            minutes = 0;
            if (hourse == 23) {
              // Reset On 23 Hourse
              hourse = 0;
              days = days + 1;
            } else {
              hourse = hourse + 1;
            } // Reset On 23 Hourse
          } else {
            minutes = minutes + 1;
          } // Reset On 60 Minuts
        } else {
          passedSeconds = passedSeconds + 1;
          if (stopWatchColor == Colors.blue) {
            // stopWatchColor
            stopWatchColor = Colors.green;
          } else if (stopWatchColor == Colors.green) {
            stopWatchColor = Colors.red;
          } else if (stopWatchColor == Colors.red) {
            stopWatchColor = Colors.blue;
          } // stopWatchColor
        } // Reset On 60 Seconds
        if (days > 0) {
          stopWatch =
              "${days.toString().padLeft(2, "0")} : ${hourse.toString().padLeft(2, "0")} : ${minutes.toString().padLeft(2, "0")} : ${passedSeconds.toString().padLeft(2, "0")}";
        } else if (hourse > 0) {
          stopWatch =
              "${hourse.toString().padLeft(2, "0")} : ${minutes.toString().padLeft(2, "0")} : ${passedSeconds.toString().padLeft(2, "0")}";
        } else if (minutes > 0) {
          stopWatch =
              "${minutes.toString().padLeft(2, "0")} : ${passedSeconds.toString().padLeft(2, "0")}";
        } else {
          stopWatch = passedSeconds.toString().padLeft(2, "0");
        }
        if (isRuning == true) {
          this.startTimer();
        }
      }); // setState
    }); // Future.delayed
  } // void startTimer()

  @override
  Widget build(BuildContext context) {
    // Widget build
    double screenSizeWidth = MediaQuery.of(context).size.width / 1000;
    double screenSizeHeight = MediaQuery.of(context).size.height / 1000;
    return Scaffold(
      // Scaffold
      appBar: AppBar(
        // AppBar
        toolbarHeight: screenSizeHeight * 80,
        title: Text(
          // AppBar Text
          widget.exerciseModel.name,
          style: TextStyle(
            // AppBar TextStyle
            color: Colors.white.withOpacity(1),
            fontWeight: FontWeight.bold,
          ), // AppBar TextStyle
        ), // AppBar Text
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue,
      ), // AppBar
      body: SingleChildScrollView(
        // Full Body SingleChildScrollView
        child: Padding(
          // Full Body Padding
          padding: EdgeInsets.all(16),
          child: Column(
            // Full Body Column
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Full Body children
              Image.asset(
                // Image.asset
                widget.exerciseModel.imageUrl,
                width: double.infinity,
                height: screenSizeHeight * 300,
                fit: BoxFit.contain,
              ), // Image.asset
              SizedBox(
                // SizedBox For Gap 1
                height: screenSizeHeight * 40,
              ), // SizedBox For Gap 1
              Text(
                // Description Text
                widget.exerciseModel.description,
                style: TextStyle(
                  // Description TextStyle
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: screenSizeHeight * 15,
                ), // Description TextStyle
              ), // Description Text
              SizedBox(
                // SizedBox For Gap 2
                height: screenSizeHeight * 20,
              ), // SizedBox For Gap 2
              Container(
                // Stop Watch Container
                width: screenSizeHeight * 300,
                height: screenSizeHeight * 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // Stop Watch Box Decoration
                  color: Colors.white70.withOpacity(0.90),
                  shape: BoxShape.circle,
                  border: Border.all(
                      // Stop Watch Borders
                      color: Colors.blue,
                      width: 3), // Stop Watch Borders
                ), // Stop Watch Box Decoration
                child: Text(
                  // Stop Watch Text
                  "$stopWatch",
                  style: TextStyle(
                    // Stop Watch TextStyle
                    fontSize: screenSizeHeight * 37.5,
                    color: stopWatchColor,
                    fontWeight: FontWeight.bold,
                  ), // Stop Watch TextStyle
                ), // Stop Watch Text
              ), // Stop Watch Container
              SizedBox(
                // SizedBox For Gap 3
                height: screenSizeHeight * 20,
              ), // SizedBox For Gap 3
              Row(
                // Start Stop Row
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Start Stop Row children
                  ElevatedButton(
                    // Start Button
                    onPressed: () {
                      // Start Button onPressed
                      if (isRuning == false) {
                        // if (isRuning == false)
                        isRuning = true;
                        startTimer();
                      } // if (isRuning == false)
                    }, // Start Button onPressed
                    style: ElevatedButton.styleFrom(
                      // Start Button styleForm
                      backgroundColor: Colors.green,
                    ), // Start Button styleForm
                    child: Text(
                      // Start Button Text
                      "Start",
                      style: TextStyle(
                        // Start Button TextStyle
                        fontSize: screenSizeHeight * 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ), // Start Button TextStyle
                    ), // Start Button Text
                  ), // Start Button
                  SizedBox(
                    // SizedBox For Gap 4
                    width: screenSizeWidth * 20,
                  ), // SizedBox For Gap 4
                  ElevatedButton(
                    // Reset Button
                    onPressed: () {
                      // Reset Button onPressed
                      if (isRuning == true) {
                        // if (isRuning == true)
                        isRuning = false;
                      } // if (isRuning == true)
                      Future.delayed(Duration(seconds: 1), () {
                        // Future.delayed(Duration(seconds: 1), ()
                        setState(() {
                          // setState(()
                          passedSeconds = 0;
                          minutes = 0;
                          hourse = 0;
                          days = 0;
                          stopWatch = "00";
                          stopWatchColor = Colors.blue;
                        }); // setState(()
                      }); // Future.delayed(Duration(seconds: 1), ()
                    }, // Reset Button onPressed
                    style: ElevatedButton.styleFrom(
                      // Reset Button styleForm
                      backgroundColor: Colors.blue,
                    ), // Reset Button styleForm
                    child: Text(
                      // Reset Button Text
                      "Reset",
                      style: TextStyle(
                        // Reset Button TextStyle
                        fontSize: screenSizeHeight * 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ), // Reset Button TextStyle
                    ), // Reset Button Text
                  ), // Reset Button
                  SizedBox(
                    // SizedBox For Gap 5
                    width: screenSizeWidth * 20,
                  ), // SizedBox For Gap 5
                  ElevatedButton(
                    // Stop Button
                    onPressed: () {
                      // Stop Button onPressed
                      isRuning = false;
                      Future.delayed(Duration(seconds: 1), () {
                        // Future.delayed
                        setState(() {
                          // setState
                          stopWatchColor = Colors.blue;
                        }); // setState
                      }); // Future.delayed
                    }, // Stop Button onPressed
                    style: ElevatedButton.styleFrom(
                      // Stop Button styleForm
                      backgroundColor: Colors.red,
                    ), // Stop Button styleForm
                    child: Text(
                      // Stop Button Text
                      "Stop",
                      style: TextStyle(
                        // Stop Button TextStyle
                        fontSize: screenSizeHeight * 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ), // Stop Button TextStyle
                    ), // Stop Button Text
                  ), // Stop Button
                ], // Start Stop Row children
              ), // Start Stop Row
            ], // Full Body children
          ), // Full Body Column
        ), // Full Body Padding
      ), // Full Body SingleChildScrollView
    ); // Scaffold
  } // Widget build
} // class _ExerciseDetailsScreenState extends State<ExerciseDetailsScreen>
