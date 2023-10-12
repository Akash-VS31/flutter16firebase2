import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Realtimedatabase extends StatefulWidget {
  const Realtimedatabase({super.key});

  @override
  State<Realtimedatabase> createState() => _RealtimedatabaseState();
}

class _RealtimedatabaseState extends State<Realtimedatabase> {
  final _form = GlobalKey<FormState>();
  String? title, note;

  void WriteData() async {
    _form.currentState?.save();
    var url = "https://flutter16firebase2-f3375-default-rtdb.firebaseio.com/" +
        "data.json";
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({"title": title, "note": note}),
      );
    } catch (error) {
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily Activity Chart"),
      ),
      body: Form(
          key: _form,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Enter Title"),
                onSaved: (value) {
                  title = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Enter note"),
                onSaved: (value) {
                  note = value!;
                },
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: WriteData,
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  )),
            ],
          )),
    );
  }
}
