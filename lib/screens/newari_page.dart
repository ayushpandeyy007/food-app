import 'package:flutter/material.dart';

class NewariPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Newari Cuisines'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Newari Cuisines',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Newari cuisine is a subset of Nepalese cuisine that has developed over centuries among the Newars of Kathmandu Valley. It consists of a wide variety of dishes and is characterized by its unique flavors and ingredients.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildFoodCard(
                        context, 'Yomari', 'assets/Images/Yomari.jpg'),
                    _buildFoodCard(context, 'Nepali Pizza - Chatamari',
                        'assets/Images/Chatamari.jpg'),
                    // Add more food cards here
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodCard(BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return DraggableScrollableSheet(
              expand: false,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 40,
                            height: 5,
                            margin: EdgeInsets.only(bottom: 8),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Image.asset(imagePath, fit: BoxFit.cover),
                        SizedBox(height: 10),
                        Text(
                          'Here\'s how to make $title:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Step-by-step instructions go here...',
                          style: TextStyle(fontSize: 16),
                        ),
                        // Add more details about the recipe here
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
      child: Container(
        width: double.infinity,
        height: 220, // Adjust height as needed
        margin: EdgeInsets.only(bottom: 16), // Space between cards
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    // fontWeight: FontWeight.bold,
                  ),
                  // textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
