import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Updatetask extends StatefulWidget {
  final String content;
  final String timestamp;
  final String id;
Updatetask({Key? key,required this.content,required this.timestamp,required this.id})
  : super(key: key);

  @override
  State<Updatetask> createState() => _UpdatetaskState();
}

class _UpdatetaskState extends State<Updatetask> {
  final updateContentController = TextEditingController();
  final updateTimestampController=TextEditingController();
  final CollectionReference task=FirebaseFirestore.instance.collection('tasks');
  @override
  void initstate(){
    super.initState();
    updateContentController.text=widget.content;
    updateTimestampController.text=widget.timestamp;
  }
  void updateTask(String taskID){
    final data={
      'content':updateContentController.text,
      'timestamp':updateTimestampController.text,
    };
    task.doc(taskID).update(data).then((value) =>Navigator.pop(context));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update task"),
      ),
      body: Column(
        children: [
          Padding(
              padding:EdgeInsets.all(8.0),
          child: TextField(
            controller: updateContentController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "content",
            ),
          ),
          ),
          Padding(
            padding:EdgeInsets.all(8.0),
            child: TextField(
              controller: updateTimestampController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Timestamp",
              ),
            ),
          ),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.teal),
              ),
              onPressed: () {
                updateTask(widget.id);
              }, child: Text(
            "Update",
            style: TextStyle(color: Colors.white),
          ))
        ],
      ),
    );
  }
}
