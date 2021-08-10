import 'package:flutter/material.dart';

import 'package:grocery_app/provider/product_provider.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context, listen: true);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
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
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 80),
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
                            "Search",
                            style: TextStyle(color: Colors.grey, fontSize: 25),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
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
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Our Recommendation for You",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Based on your orders history",
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _productCard(
                      productProvider.products.first.name.toString(),
                      productProvider.products.first.picture.toString(),
                      productProvider.products.first.quantity.toString(),
                      productProvider.products.first.price.toString()),
                  _productCard(
                      productProvider.products.last.name.toString(),
                      productProvider.products.last.picture.toString(),
                      productProvider.products.last.quantity.toString(),
                      productProvider.products.last.price.toString())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _productCard(
    String title,
    String img,
    String quantity,
    String price,
  ) {
    return Card(
      elevation: 10,
      child: Container(
        height: 150,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 20,
                ),
                Image.network(
                  img,
                  height: 120,
                  width: 100,
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(quantity),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      price,
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 100, 10, 0),
                  child: Container(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Add',
                      ),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                      side: BorderSide(color: Colors.red)))),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
