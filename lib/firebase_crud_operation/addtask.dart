import 'package:flutter/material.dart';
class Addtask extends StatefulWidget {
  const Addtask({super.key});

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
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
              padding:EdgeInsets.all(8.0),
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(label: Text("timestamp")),
          ),
          ),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.teal)
              ),
              onPressed: null, child: Text(
              "submit",
            style: TextStyle(color: Colors.white),
          ))
        ],
      ),
    );
  }
}
