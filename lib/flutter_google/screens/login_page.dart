import 'package:flutter/material.dart';
import 'package:flutter16firebase2/flutter_google/screens/profile_page.dart';

import '../authentication/google_signin_page.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlutterLogo(size: 150),
            SizedBox(height: 50),
            OutlinedButton(
                onPressed: () {
                  signInWithGoogle().then((result) {
                    if (result != null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProfilePage();
                          },
                        ),
                      );
                    }
                  });
                },
                child: Padding(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                          image: AssetImage("assets/images/google.jpg"),
                          height: 35.0),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Sign in with Google',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    ],
                  ),
                  padding: EdgeInsets.all(10),
                ))
          ],
        )),
      ),
    );
  }
}
