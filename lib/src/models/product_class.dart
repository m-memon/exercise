import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  @override
  MyProduct createState() => MyProduct();
}

class MyProduct extends State<Product> {
  // MyProduct
  String itemName;
  String itemDescription;
  String imageLink;
  double textWidth;
  double imageWidth;
  double height;
  Color backgroundColors;
  Color itemNameFontColors;
  Color descriptionFontColors;
  TextStyle nameTextStyle;
  TextStyle descriptionTextStyle;
  double imageOpacity;
  double nameOpacity;
  double descriptionOpacity;
  BorderRadius borderRadius;
  MyProduct({
    // MyProduct Initilize
    this.itemName = '',
    this.itemDescription = '',
    this.imageLink = '',
    this.textWidth = double.infinity,
    this.imageWidth = double.infinity,
    this.height = double.infinity,
    this.backgroundColors = Colors.transparent,
    this.itemNameFontColors = Colors.black,
    this.descriptionFontColors = Colors.black,
    this.nameTextStyle = const TextStyle(),
    this.descriptionTextStyle = const TextStyle(),
    this.imageOpacity = 95.0,
    this.nameOpacity = 95.0,
    this.descriptionOpacity = 95.0,
    this.borderRadius = BorderRadius.zero,
  }); // MyProduct Initilize

  @override
  Widget build(BuildContext context) {
    // build
    dynamic imageTester() {
      // imageTester
      if (imageLink.isEmpty) {
        // if imageLink.isEmpty
        return AssetImage(
            'assets/images/default_images/no_image_available.png');
      } else {
        if (imageLink.startsWith("assets")) {
          // if Image Link Is Valid
          return AssetImage('$imageLink');
        } else if (imageLink.startsWith("http") ||
            imageLink.startsWith("https") ||
            imageLink.startsWith("data:")) {
          return NetworkImage('$imageLink');
        } else {
          return AssetImage(
              'assets/images/default_images/no_image_available.png');
        } // if Image Link Is Valid
      } // if imageLink.isEmpty
    } // imageTester

    double _height = height / 100;
    return MaterialApp(
        // MaterialApp
        home: Scaffold(
      // Scaffold
      body: Container(
        // Full Body Container
        width: imageWidth + textWidth,
        height: _height * 100,
        decoration: BoxDecoration(
          // Full Body BoxDecoration
          color: Colors.transparent,
          borderRadius: borderRadius,
        ), // Full Body BoxDecoration
        child: Row(
          // Full Body Row
          children: [
            // Full Body Row children
            Container(
              // Image Container
              width: imageWidth,
              height: _height * 100,
              decoration: BoxDecoration(
                // Image Box Decoration
                borderRadius: BorderRadius.only(
                    // Image BorderRadius.only
                    topLeft: borderRadius.topLeft,
                    bottomLeft:
                        borderRadius.bottomLeft), // Image BorderRadius.only
                color:
                    imageLink.isEmpty ? backgroundColors : Colors.transparent,
                image: DecorationImage(
                  // Image Decoration
                  image: imageTester(),
                  fit: BoxFit.cover,
                  opacity: imageOpacity,
                ), // Image Decoration
              ), // Image Box Decoration
            ), // Image Container
            Container(
              // Text Body Container
              width: textWidth,
              height: _height * 100,
              decoration: BoxDecoration(
                  // Text Body BoxDecoration
                  color: backgroundColors,
                  borderRadius: BorderRadius.only(
                      // Text BorderRadius.only
                      topRight: borderRadius.topRight,
                      bottomRight:
                          borderRadius.bottomRight) // Text BorderRadius.only
                  ), // Text Body BoxDecoration
              child: Column(
                // Text Body Column
                children: [
                  // Text Body Column children
                  Container(
                    // Product Name Container
                    width: textWidth,
                    height: _height * 34,
                    decoration: BoxDecoration(
                      // Product Name BoxDecoration
                      color: backgroundColors,
                      borderRadius:
                          BorderRadius.only(topRight: borderRadius.topRight),
                    ), // Product Name BoxDecoration
                    child: Text(
                      // Product Name Text
                      '$itemName',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        // Product Name TextStyle
                        backgroundColor: backgroundColors,
                        fontSize: _height * 17,
                        color: itemNameFontColors,
                        fontWeight: FontWeight.bold,
                      ), // Product Name TextStyle
                    ), // Product Name Text
                  ), // Product Name Container
                  Container(
                    // Product Description Container
                    width: textWidth,
                    height: _height * 66,
                    decoration: BoxDecoration(
                      // Product Description BoxDecoration
                      color: backgroundColors,
                      borderRadius: BorderRadius.only(
                          // Product BorderRadius.only
                          bottomRight: borderRadius
                              .bottomRight), // Product BorderRadius.only
                    ), // Product Description BoxDecoration
                    child: Text(
                      // Product Description Text
                      '$itemDescription',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        // Product Description TextStyle
                        backgroundColor: backgroundColors,
                        color: descriptionFontColors,
                        fontSize: _height * 10,
                        fontWeight: FontWeight.bold,
                      ), // Product Description TextStyle
                    ), // Product Description Text
                  ), // Product Description Container
                ], // Text Body Column children
              ), // Text Body Column
            ), // Text Body Container
          ], // Full Body Row children
        ), // Full Body Row
      ), // Full Body Container
    ) // Scaffold
        ); // MaterialApp
  } // build
} // MyProduct