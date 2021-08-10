import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/screens/option.dart';
import 'package:grocery_app/screens/home_screen.dart';

class Authenticate {
  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            print("you already have user");
            return HomeScreen();
          } else
            print("Uh oh you need to login");
          return option();
        });
  }
}
