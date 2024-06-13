import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue,
      child: ListView(
        padding: EdgeInsets.fromLTRB(0, 55, 0, 0),
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.arrow_back,
              size: 40,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0), // Add padding here
            child: ListTile(
              leading: Icon(
                Icons.fastfood,
                color: Colors.white,
              ),
              title: Text(
                'Meals',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                // Implement your onTap functionality here
                print('Meals');
              },
              tileColor:
                  Colors.blue, // Adding a background color for visibility
            ),
          ),
          Divider(color: Colors.white, thickness: 1), // Add Divider here

          Padding(
            padding: const EdgeInsets.only(top: 20.0), // Add padding here
            child: ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: Text(
                'Filters',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                // Implement your onTap functionality here
                print('Filters tapped!');
              },
              tileColor:
                  Colors.blue, // Adding a background color for visibility
            ),
          ),
          Divider(color: Colors.white, thickness: 1), // Add Divider here
        ],
      ),
    );
  }
}
