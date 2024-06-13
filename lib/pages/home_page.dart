import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 90.0, left: 10.0), // Add vertical and horizontal padding
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align text to the start (left)
          children: <Widget>[
            Text(
              'Make',
              style: TextStyle(
                fontSize: 34,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Healthy Cuisines',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'At your home!',
              style: TextStyle(
                fontSize: 34,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30), // Add some spacing between text and image
            Image.asset(
              'assets/Images/foodMap.jpg',
              width: 370, // You can adjust the width as needed
              // height: 320, // You can adjust the height as needed
              fit: BoxFit.fill, // Adjust the image fit as needed
            ),
          ],
        ),
      ),
    );
  }
}
