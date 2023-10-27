import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Homepage2 extends StatefulWidget {
  const Homepage2({super.key});

  @override
  State<Homepage2> createState() => _Homepage2State();
}

class _Homepage2State extends State<Homepage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: ()async {
            await FirebaseAuth.instance.signOut();
          }, icon: Icon(Icons.leave_bags_at_home))
        ],
        title: Text('Homepage'),
      ),
    );
  }
}
