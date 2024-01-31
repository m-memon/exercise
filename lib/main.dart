import "package:flutter/material.dart";
import "src/screens/exercise_list.dart";

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExerciseListScreen(),
    ), // MaterialApp
  ); // runApp
} // void main