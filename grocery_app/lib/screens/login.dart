import 'package:flutter/material.dart';
import 'package:grocery_app/screens/otp.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: _inputController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  prefixIcon: Icon(Icons.call),
                  prefixText: "+91 ",
                  labelText: "Mobile No.",
                  counterText: "",
                  labelStyle: TextStyle(fontSize: 18),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ButtonTheme(
              minWidth: 300,
              height: 35,
              buttonColor: Colors.deepOrangeAccent,
              child: RaisedButton(
                onPressed: () async {
                  String Num = "+91" + _inputController.text.trim();
                  print(Num);
                  if (Num.length == 13) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OTPScreen(
                          num: Num,
                        ),
                      ),
                    );
                  }
                  //GOTO otp screen
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=> otpscreen()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  'Send OTP',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
