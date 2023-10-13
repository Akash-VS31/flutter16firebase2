

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Addtask extends StatefulWidget {
  const Addtask({super.key});

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
  final contentController = TextEditingController();
  final timestampController = TextEditingController();
  final CollectionReference task =
      FirebaseFirestore.instance.collection('tasks');
  Addtask() {
    final data = {
      'content': contentController.text,
      'timestamp': timestampController.text,
    };
    task.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add task'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: contentController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("content")),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: timestampController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("Timestamp")),
            ),
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.teal)),
              onPressed: () {
                Addtask();
                Navigator.pop(context);
              },
              child: Text(
                "submit",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
