import 'package:flutter/material.dart';
class Permissionhandler extends StatefulWidget {
  const Permissionhandler({super.key});

  @override
  State<Permissionhandler> createState() => _PermissionhandlerState();
}

class _PermissionhandlerState extends State<Permissionhandler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permission Handler'),
      ),
    );
  }
}