import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  static const NAME = "name";
  static const PICTURE = "picture";
  static const PRICE = "price";
  static const QUANTITY = "quantity";

  String? _name;
  String? _picture;

  String? _quantity;
  String? _price;

  String? get name => _name;

  String? get picture => _picture;

  String? get quantity => _quantity;

  String? get price => _price;

  ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    _price = snapshot[PRICE] as String;
    _quantity = snapshot[QUANTITY] ?? "";

    _name = snapshot[NAME] ?? "";
    _picture = snapshot[PICTURE] ?? "";
  }
}
