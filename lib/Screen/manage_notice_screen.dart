import 'package:flutter/material.dart';

class ManageNoticeScreen extends StatefulWidget {
  const ManageNoticeScreen({super.key});

  @override
  State<ManageNoticeScreen> createState() => _ManageNoticeScreenState();
}

class _ManageNoticeScreenState extends State<ManageNoticeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Notice'),
      ),
    );
  }
}
