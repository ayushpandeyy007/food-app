import 'package:flutter/material.dart';

class VietnamesePage extends StatefulWidget {
  @override
  _VietnamesePageState createState() => _VietnamesePageState();
}

class _VietnamesePageState extends State<VietnamesePage> {
  Set<String> _favoriteFoods = Set<String>();

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
                    _buildFoodCard(context, 'Yomari',
                        'assets/Images/Yomari.jpg', _buildYomariContent),
                    _buildFoodCard(context, 'Nepali Pizza - Chatamari',
                        'assets/Images/Chatamari.jpg', _buildChatamariContent),
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

  Widget _buildFoodCard(BuildContext context, String title, String imagePath,
      Widget Function() contentBuilder) {
    bool isFavorite = _favoriteFoods.contains(title);

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return Container(
              height: MediaQuery.of(context).size.height *
                  0.75, // Adjust the height as needed
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
                  Expanded(
                    child: SingleChildScrollView(
                      child: contentBuilder(),
                    ),
                  ),
                ],
              ),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          if (isFavorite) {
                            _favoriteFoods.remove(title);
                          } else {
                            _favoriteFoods.add(title);
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildYomariContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/Images/Yomari.jpg', fit: BoxFit.cover),
        SizedBox(height: 10),
        Text(
          'Ingredients:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            'Dough:\n'
            '• Rice Flour: This is the main ingredient for the dough. It provides the unique texture of Yomari.\n'
            '• Water: To mix with the rice flour and form a smooth dough.\n\n'
            'Filling:\n'
            '• Sesame Seeds: Often toasted for a richer flavor.\n'
            '• Jaggery: Provides sweetness and a rich, caramel-like flavor. It can be replaced with brown sugar or other sweeteners if jaggery is unavailable.\n'
            '• Grated Coconut: Adds texture and flavor to the filling.\n\n'
            'Optional Ingredients:\n'
            '• Cardamom Powder: For additional flavor in the filling.\n'
            '• Ghee (Clarified Butter): Sometimes used in the filling for added richness.',
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Steps:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            'Prepare the Dough:\n'
            '1. Mix rice flour with warm water to form a smooth dough. The dough should be soft and pliable.\n\n'
            'Prepare the Filling:\n'
            '2. Mix toasted sesame seeds, jaggery, and grated coconut in a bowl. Add cardamom powder and ghee if desired.\n\n'
            'Shape and Fill the Yomari:\n'
            '3. Take a small portion of the dough and shape it into a cone or fish shape.\n'
            '4. Fill the hollow part with the prepared filling and seal the top.\n\n'
            'Steam the Yomari:\n'
            '5. Place the filled Yomari in a steamer and steam for about 20-25 minutes or until the dough is cooked through.',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildChatamariContent() {
    // Add content for Chatamari here similar to the Yomari content
    return Container();
  }
}
