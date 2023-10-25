import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
class Privaypolicy extends StatefulWidget {
  const Privaypolicy({super.key});

  @override
  State<Privaypolicy> createState() => _PrivaypolicyState();
}

class _PrivaypolicyState extends State<Privaypolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Privacy Policy',
          style: TextStyle(
            fontWeight:FontWeight.bold,
            fontSize: 20,
          ),
        ),
        titleTextStyle: TextStyle(
          color: Colors.black,
        ),
      ),
      body: Container(
        padding:EdgeInsets.only(
          left: 20,
          right: 20,
          top: 50,
          bottom: 200,
        ),
        child: Center(
          child: Text.rich(
              TextSpan(
                  text: 'By continuing, you agree to our',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' Terms of Service',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap=(){

                          }
                    ),
                    TextSpan(
                        text: ' and',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black
                        ),
                        children:<TextSpan> [
                          TextSpan(
                              text: ' Privacy policy . '
                                  ' This information provided through these applications may not have any legal sanctity and are for general reference only, unless otherwise specified. However, every effort has been made to provide accurate and reliable information through these applications. Users are advised to verify the correctness of the facts published here from the concerned authorities. Neither National Informatics Centre nor Government of India and its allied establishments will not be responsible for the accuracy and correctness of the contents available in these applications.'
                              ,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  decoration: TextDecoration.underline
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap=(){

                                }
                          ),
                        ]
                    )
                  ]
              )
          ),
        ),
      ),
    );
  }
}

