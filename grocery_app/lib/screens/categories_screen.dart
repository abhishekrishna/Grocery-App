import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              child: DrawerHeader(
                  child: Text(
                "Categories",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              )),
            ),
            ListTile(
              title: Text(
                "Fruits and Vegitables",
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(Icons.arrow_downward_sharp),
            ),
            Divider(),
            ListTile(
              title: Text(
                "Foodgrains, Oil & Masala",
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(Icons.arrow_downward_sharp),
            ),
            Divider(),
            ListTile(
              title: Text(
                "Bakery, Cakes and Dairy",
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(Icons.arrow_downward_sharp),
            ),
            Divider(),
            ListTile(
              title: Text(
                "Beverages",
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(Icons.arrow_downward_sharp),
            ),
          ],
        ),
      ),
    );
  }
}
