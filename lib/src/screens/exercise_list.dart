import "package:exercise/src/screens/exercise_detail.dart";
import "package:flutter/material.dart";
import "package:exercise/src/models/exercise_model.dart";
import "package:exercise/src/models/product_class.dart";
import "package:lottie/lottie.dart";

class ExerciseListScreen extends StatelessWidget {
  ExerciseListScreen({Key? key}) : super(key: key);

  List<ExerciseModel> exerciseList = [
    // List<ExerciseModel> exerciseList
    ExerciseModel(
      // Index 1
      name: "Push-ups",
      description:
          "Bodyweight exercise engaging upper body muscles, involving pushing up from a prone position.",
      imageUrl: "assets/images/icon_images/Push-up.png",
    ), // Index 1
    ExerciseModel(
      // Index 2
      name: "Burpees",
      description:
          "Full-body exercise combining squat, plank, and jump for a high-intensity workout.",
      imageUrl: "assets/images/icon_images/Burpees.png",
    ), // Index 2
    ExerciseModel(
      // Index 3
      name: "Stretching",
      description:
          "Stretching enhances flexibility and promotes overall muscle health",
      imageUrl: "assets/images/icon_images/Stretching.png",
    ), // Index 3
    ExerciseModel(
      // Index 4
      name: "Crunches",
      description:
          "Abdominal exercise involving flexing and contracting the core muscles.",
      imageUrl: "assets/images/icon_images/Crunches.png",
    ), // Index 4
    ExerciseModel(
      // Index 5
      name: "Jumping Jacks",
      description:
          "Dynamic full-body exercise involving jumping and simultaneous arm and leg movements.",
      imageUrl: "assets/images/icon_images/Jumping Jacks.png",
    ), // Index 5
    ExerciseModel(
      // Index 6
      name: "Bicep Curls",
      description:
          "Isolating and strengthening the biceps through controlled arm curling movements with weights.",
      imageUrl: "assets/images/icon_images/Bicep Curls.png",
    ), // Index 6
    ExerciseModel(
      // Index 7
      name: "Tricep Dips",
      description:
          "Sculpt and strengthen your arms with this effective bodyweight exercise.",
      imageUrl: "assets/images/icon_images/Tricep Dips.png",
    ), // Index 7
  ]; // List<ExerciseModel> exerciseList

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          // AppBar Text
          "Exercise App",
          style: TextStyle(
            // AppBar TextStyle
            color: Colors.white.withOpacity(1),
            fontWeight: FontWeight.bold,
          ), // AppBar TextStyle
        ), // AppBar Text
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue.withOpacity(1.0),
      ), // AppBar
      body: Column(
        // Full Body Column
        children: [
          // Full Body children
          Expanded(
            // Lottie File Expanded
            flex: 2,
            child: Container(
              // Lottie File Container
              child: Lottie.asset("assets/lottie/exercise.json"),
            ), // Lottie File Container
          ), // Lottie File Expanded
          Expanded(
            // ListView.builder Expanded
            flex: 3,
            child: ListView.builder(
                itemCount: exerciseList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      // Title Text
                      exerciseList[index].name,
                      maxLines: 1,
                      style: TextStyle(
                        // Title TextStyle
                        color: Colors.black.withOpacity(1),
                        fontWeight: FontWeight.bold,
                      ), // Title TextStyle
                    ), // Title Text
                    leading: Image.asset(
                      // Image.asset
                      exerciseList[index].imageUrl,
                      fit: BoxFit.cover,
                    ), // Image.asset
                    subtitle: Text(
                      // Subtitle Text
                      exerciseList[index].description,
                      maxLines: 1,
                      style: TextStyle(
                        // Subtitle TextStyle
                        color: Colors.black.withOpacity(1),
                        fontWeight: FontWeight.normal,
                      ), // Subtitle TextStyle
                    ), // Subtitle Text
                    onTap: () {
                      // onTap
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExerciseDetailsScreen(
                                    exerciseModel: exerciseList[index],
                                  )));
                    }, // onTap
                  ); // ListTile
                }), // ListView.builder
          ), // ListView.builder Expanded
        ], // Full Body children
      ), // Full Body Column
    ); // Scaffold
  } // Widget Build
} // void main 