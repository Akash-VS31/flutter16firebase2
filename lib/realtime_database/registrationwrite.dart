import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistrationWrite extends StatefulWidget {
  const RegistrationWrite({super.key});

  @override
  State<RegistrationWrite> createState() => _RegistrationWriteState();
}

class _RegistrationWriteState extends State<RegistrationWrite> {
  final _form = GlobalKey<FormState>();
  String? name, email, phone, password;
  void WriteData() async {
    _form.currentState?.save();
    var url = "https://flutter16firebase2-f3375-default-rtdb.firebaseio.com/" +
        "register.json";
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          "name": name,
          "email": email,
          "phone": phone,
          "passwoed": password
        }),
      );
    } catch (error) {
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily Active Chart"),
      ),
      body: Form(
          key: _form,
          child: Column(
            children: [SizedBox(
              height: 10,
            ),
              TextFormField(
                decoration: InputDecoration(hintText: "enter name"),
                onSaved: (value){
                  name=value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "enter email"),
                onSaved: (value){
                  email=value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "enter phone"),
                onSaved: (value){
                  phone=value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "enter password"),
                onSaved: (value){
                  password=value!;
                },
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: WriteData,
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ))
            ],
          )),
    );
  }
}
