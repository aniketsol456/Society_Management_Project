import 'package:flutter/material.dart';
import 'package:society_management_projecct/User_Screen/all_aminity_details.dart';

class AminityBookScreen extends StatefulWidget {
  const AminityBookScreen({super.key});

  @override
  State<AminityBookScreen> createState() => _AminityBookScreenState();
}

class _AminityBookScreenState extends State<AminityBookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aminity Book'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllaminityScreen(),
                          ),
                        );
                      },
                      child: Text(
                        '+ Book Aminities',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
