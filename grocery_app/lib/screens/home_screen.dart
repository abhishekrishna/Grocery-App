import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:grocery_app/screens/categories_screen.dart';
import 'package:grocery_app/screens/product_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textController = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.reference();
  final Future<FirebaseApp> _future = Firebase.initializeApp();
  int _currentIndex = 0;

  void readData() {
    databaseRef.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }

  final List<String> imgList = [
    'assets/slide1.jpg'
        'assets/slide2.jpg'
        'assets/slide3.jpg'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => _scaffoldKey.currentState!.openDrawer(),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                          side: BorderSide(color: Colors.black),
                        ),
                        shadows: [
                          const BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            offset: Offset(5, 5),
                          )
                        ],
                      ),
                      child: Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 80),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        side: BorderSide(color: Colors.black),
                      ),
                      shadows: [
                        const BoxShadow(
                          color: Colors.grey,
                          blurRadius: 0.2,
                          offset: Offset(5.0, 5.0),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(
                        'Search',
                        style: TextStyle(color: Colors.grey, fontSize: 25),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        side: BorderSide(color: Colors.black),
                      ),
                      shadows: [
                        const BoxShadow(
                          color: Colors.grey,
                          blurRadius: 0.2,
                          offset: Offset(5, 5),
                        )
                      ],
                    ),
                    child: Icon(
                      Icons.shopping_cart,
                      size: 30,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            CarouselSlider(
              items: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: Image(
                    image: AssetImage(
                      "assets/dassets/slide1.jpg",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: Image(
                    image: AssetImage(
                      "assets/dassets/slide2.jpg",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: Image(
                    image: AssetImage(
                      "assets/dassets/slide3.jpg",
                    ),
                    fit: BoxFit.fill,
                  ),
                )
              ],
              options: CarouselOptions(
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 400),
                viewportFraction: 0.8,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
                child: Text(
              "Featured Categories",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade500,
                  letterSpacing: 1.5),
            )),
            Container(
                height: 450,
                child: FutureBuilder(
                    future: _future,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      } else {
                        return Center(
                          child: Container(
                            child: GridView.count(
                              physics: NeverScrollableScrollPhysics(),
                              crossAxisCount: 3,
                              scrollDirection: Axis.vertical,
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 6),
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductScreen()));
                                  },
                                  child: Card(
                                      clipBehavior: Clip.antiAlias,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Ink.image(
                                            image: NetworkImage(
                                                'https://images.unsplash.com/photo-1604503468506-a8da13d82791?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80'),
                                            fit: BoxFit.cover,
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 7),
                                            height: 120,
                                            color: Colors.black38,
                                            child: Text(
                                              'Eggs, Meat & Fish',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Kitchen()));
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Ink.image(
                                          image: NetworkImage(
                                              'https://images.unsplash.com/photo-1589924691995-400dc9ecc119?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80'),
                                          fit: BoxFit.cover,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 7),
                                          height: 120,
                                          color: Colors.black38,
                                          child: Text(
                                            'Kitchen, Garden & Pet',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Bakery()));
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Ink.image(
                                          image: NetworkImage(
                                              'https://images.unsplash.com/photo-1550617931-e17a7b70dce2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'),
                                          fit: BoxFit.cover,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 7),
                                          height: 120,
                                          color: Colors.black38,
                                          child: Text(
                                            'Bakery, Cakes & Dairy',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Bevarages()));
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Ink.image(
                                          image: NetworkImage(
                                              'https://images.unsplash.com/photo-1626254295724-929c014bf882?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80'),
                                          fit: BoxFit.cover,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 7),
                                          height: 120,
                                          color: Colors.black38,
                                          child: Text(
                                            'Bevarages',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Beauty()));
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Ink.image(
                                          image: NetworkImage(
                                              'https://images.unsplash.com/photo-1596462502278-27bfdc403348?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80'),
                                          fit: BoxFit.cover,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 7),
                                          height: 120,
                                          color: Colors.black38,
                                          child: Text(
                                            'Beauty Products',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Snacks()));
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Ink.image(
                                          image: NetworkImage(
                                              'https://images.unsplash.com/photo-1606312619070-d48b4c652a52?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80https://images.unsplash.com/photo-1606312619070-d48b4c652a52?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80'),
                                          fit: BoxFit.cover,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 7),
                                          height: 120,
                                          color: Colors.black38,
                                          child: Text(
                                            'Snacks & Branded Foods',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Cleaning()));
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Ink.image(
                                          image: NetworkImage(
                                              'https://images.unsplash.com/photo-1583947215259-38e31be8751f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'),
                                          fit: BoxFit.cover,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 7),
                                          height: 120,
                                          color: Colors.black38,
                                          child: Text(
                                            'Cleaning & Household',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Gourmet()));
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Ink.image(
                                          image: NetworkImage(
                                              'https://worldgourmet.co.in/wp-content/uploads/2020/11/Organic-and-healthy-products.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 7),
                                          height: 120,
                                          color: Colors.black38,
                                          child: Text(
                                            'Gourmet & World Food',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => BabyStore()));
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Ink.image(
                                          image: NetworkImage(
                                              'https://www.momjunction.com/wp-content/uploads/2015/03/Top-11-Johnson-Johnson%E2%80%99s-Baby-Care-Products.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 7),
                                          height: 120,
                                          color: Colors.black38,
                                          child: Text(
                                            'Baby Store',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    }))
          ]),
        )),
      ),
      drawer: _categoriesDrawer(context),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _currentIndex,
        fixedColor: Colors.grey.shade700,
        backgroundColor: Colors.grey.shade300,
        type: BottomNavigationBarType.fixed,
        // new
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey.shade700,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoriesScreen(),
                  ),
                );
              },
              child: Icon(
                Icons.menu,
                color: Colors.grey.shade700,
              ),
            ),
            label: 'Category',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shop,
                color: Colors.grey.shade800,
              ),
              label: 'Products'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.grey.shade800,
              ),
              label: 'Profile')
        ],
      ),
    );
  }
}

Widget _categoryCard(BuildContext context, String title) {
  return Card(
    elevation: 5,
    child: Container(
        padding: EdgeInsets.all(15),
        child: Column(children: [
          // Image.asset(
          //   "image_location",
          //   fit: BoxFit.contain,
          // ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 15),
          )
        ])),
  );
}

Widget _categoriesDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        Container(
          child: DrawerHeader(
              child: Text(
            "Categories",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1),
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
  );
}
