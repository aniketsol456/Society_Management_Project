import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class AllowGuestScreen extends StatefulWidget {
  const AllowGuestScreen({super.key});

  @override
  State<AllowGuestScreen> createState() => _AllowGuestScreenState();
}

class _AllowGuestScreenState extends State<AllowGuestScreen> {
  TextEditingController _editingController = TextEditingController();
  String data = 'Aniket';
  String Wing = 'B';
  String Flat = '256';
  int code = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
          ),
          title: Text('Allow Guest'),
        ),
        body: Center(
          child: Container(
            width: 350,
            height: 450,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 3),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      labelText: 'Enter a name',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                    controller: _editingController,
                    onChanged: (text) {
                      setState(() {
                        data = text;
                        code++;
                      });
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        QrImageView(
                          data: data,
                          version: QrVersions.auto,
                          size: 250,
                          gapless: false,
                        ),
                        Text('Code: $code'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
