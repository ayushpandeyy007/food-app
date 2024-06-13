import 'package:flutter/material.dart';
import '../screens/newari_page.dart';
import '../screens/chinese_page.dart';
import '../screens/korean_page.dart';
import '../screens/italian_page.dart';
import '../screens/vietnamese_page.dart';
// Import other category pages similarly

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.category_outlined, size: 25), // Category icon
                SizedBox(width: 10),
                Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 24,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // 2 columns
                crossAxisSpacing: 15.0, // space between columns
                mainAxisSpacing: 15.0, // space between rows
                childAspectRatio:
                    2 / 1.5, // Adjust this ratio to decrease box size
                children: <Widget>[
                  _buildCategoryCard(context, 'Newari', NewariPage()),
                  _buildCategoryCard(context, 'Chinese', ChinesePage()),
                  _buildCategoryCard(context, 'Korean',
                      KoreanPage()), // Create KoreanPage similarly
                  _buildCategoryCard(context, 'Italian',
                      ItalianPage()), // Create ItalianPage similarly
                  _buildCategoryCard(context, 'Vietnamese',
                      VietnamesePage()), // Create VietnamesePage similarly
                  _buildCategoryCard(context, 'Korean',
                      KoreanPage()), // Reuse KoreanPage for the second Korean card
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
      BuildContext context, String category, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            category,
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CategoriesPage(),
  ));
}
