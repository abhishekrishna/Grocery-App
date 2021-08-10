import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  late final String phonenum;

  late final String stutus;

  String getPhoneNumber() {
    return phonenum;
  }

  String getStatus() {
    return stutus;
  }

  void setphonenumber(String num) {
    phonenum = num;
    notifyListeners();
  }

  void setstutus(String state) {
    stutus = state;
    print(stutus);
    notifyListeners();
  }
}
