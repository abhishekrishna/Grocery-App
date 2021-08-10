import 'package:flutter/material.dart';
import 'package:grocery_app/screens/login.dart';

class option extends StatefulWidget {
  const option({Key? key}) : super(key: key);

  @override
  _optionState createState() => _optionState();
}

class _optionState extends State<option> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 70.0,
            ),
            Container(
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: Image(
                    image: AssetImage("assets/logo/gs_logo.png"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                'WELCOME',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 50,
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Center(
              child: ButtonTheme(
                buttonColor: Colors.deepOrangeAccent,
                minWidth: 300,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    //GOTO login page
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text('Login'),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: ButtonTheme(
                buttonColor: Colors.deepOrangeAccent,
                minWidth: 300,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {},
                  child: Text('Registration'),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Text('By continuing, you agree to your'),
                  ButtonTheme(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                          'Terms of Services Privacy Policies Content policy'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
