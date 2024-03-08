import 'package:flutter/material.dart';

class AddNoticceScreen extends StatefulWidget {
  const AddNoticceScreen({super.key});

  @override
  State<AddNoticceScreen> createState() => _AddNoticceScreenState();
}

class _AddNoticceScreenState extends State<AddNoticceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Notice'),
      ),
    );
  }
}
