import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter16firebase2/firebase_crud_operation/addtask.dart';
import 'package:flutter16firebase2/firebase_crud_operation/update_task.dart';

class Displaytask extends StatefulWidget {
  const Displaytask({super.key});

  @override
  State<Displaytask> createState() => _DisplaytaskState();
}

class _DisplaytaskState extends State<Displaytask> {
  final CollectionReference task =
      FirebaseFirestore.instance.collection('tasks');
  deleteTask(docID) {
    task.doc(docID).delete;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text('Flutter CRUD Operation'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Addtask(),
          ));
        },
        label: Text("Add task"),
        icon: Icon(Icons.add),
      ),
      body: StreamBuilder(
          stream: task.orderBy('timestamp').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot tasksnap =
                        snapshot.data!.docs[index];
                    return Card(
                        child: Column(
                      children: [
                        ListTile(
                            title: Text('${tasksnap['content']}'),
                            subtitle: Text('${tasksnap['timestamp']}')),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return Updatetask(
                                        content: tasksnap['content'],
                                        timestamp:
                                            tasksnap['timestamp'].toString(),
                                        id: tasksnap.id,
                                      );
                                    },
                                  ));
                                },
                                icon: Icon(color: Colors.teal, Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  deleteTask(tasksnap.id);
                                },
                                icon: Icon(color: Colors.red, Icons.delete))
                          ],
                        )
                      ],
                    ));
                  });
            }
            return Container();
          }),
    );
  }
}
