import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/model/user.dart';
import 'package:grocery_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

class OTPScreen extends StatefulWidget {
  final String num;
  OTPScreen({required this.num});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  FirebaseAuth fauth = FirebaseAuth.instance;
  late String verificationId;
  late UserProvider userProvider;
  final _otpController = TextEditingController();

  //init
  @override
  void initState() {
    signInWithPhone(context);
    super.initState();
  }

  //signinfun
  Future<void> signInWithPhone(BuildContext context) async {
    print(widget.num);
    fauth.verifyPhoneNumber(
        phoneNumber: widget.num,
        verificationCompleted: (PhoneAuthCredential credential) async {
          UserCredential cred = await fauth.signInWithCredential(credential);
          if (cred.user != null) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false);
          }
        },
        verificationFailed: (verificationFailed) {},
        codeSent: (verificationID, resendToken) {
          this.verificationId = verificationID;
        },
        codeAutoRetrievalTimeout: (verificationId) async {});
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: TextFormField(
                controller: _otpController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  labelText: "OTP",
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
                  try {
                    UserCredential cred = await fauth.signInWithCredential(
                        PhoneAuthProvider.credential(
                            verificationId: verificationId,
                            smsCode: _otpController.text));

                    if (cred.user != null) {
                      userProvider.setphonenumber(widget.num);
                      userProvider.setstutus("logged in");
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                          (route) => false);
                    }
                  } catch (e) {
                    print(e.toString());
                    SnackBar snackBar = SnackBar(content: Text('Invalid OTP'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  //GOTO homescreen
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  'Get started',
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
