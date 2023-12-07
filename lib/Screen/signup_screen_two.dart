import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:society_management_projecct/Screen/bottom_nav_screen.dart';
import 'package:society_management_projecct/Screen/secretory_screen.dart';
// import 'package:society_management_projecct/Screen/dashboard_screen.dart';
// import 'package:society_management_projecct/Screen/otp_screen.dart';

class SignupScreento extends StatefulWidget {
  const SignupScreento({super.key});

  @override
  State<SignupScreento> createState() => _SignupScreentoState();
}

class _SignupScreentoState extends State<SignupScreento> {
  String? selectedWing;
  String? selectedUser;
  List<String> wings = ['A', 'B', 'C', 'D'];
  List<String> users = ['Secretary', 'Commitie Memeber', 'Society Member'];
  String wingAndFlatNo = ' ';

  // void submit_form() async {
  //   String? role;
  //   if (users == 'Secretary') {
  //     role = 'Secretary';
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => SecretoryScreen(),
  //       ),
  //     );
  //   } else if (users == 'Commitie Memeber') {
  //     role = 'Committee Member';
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => SecretoryScreen(),
  //       ),
  //     );
  //   } else if (users == 'Society Member') {
  //     role = 'Society Member';
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => BottomNavScreen(),
  //       ),
  //     );
  //   }
  //   // Save user details to Firestore
  //   // Save user details after successful phone verification if needed
  //   // Use FirebaseFirestore.instance.collection('users').doc(uid).set({...});
  //   await FirebaseFirestore.instance.collection('users').add({
  //     'Role': role,
  //     'Wing-Flat': wingAndFlatNo,
  //     // You might want to avoid storing passwords directly in the database for security reasons
  //     // Instead, consider using Firebase Authentication for user authentication
  //     // 'password': _password,
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 85, 161, 223),
      body: Center(
        child: Container(
          width: 350,
          height: 475,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.asset('assets/images/1.png'),
                Text(
                  'Select your Wing & \nenter a flat Number',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                // TextField(
                //   decoration: InputDecoration(labelText: 'Enter a wing'),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownButton<String>(
                      hint: Text('Your wing'),
                      value: selectedWing,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedWing = newValue;
                          wingAndFlatNo = (selectedWing != null)
                              ? '$selectedWing - Enter Flat no.'
                              : '';
                        });
                      },
                      items: wings.map((String wing) {
                        return DropdownMenuItem<String>(
                          value: wing,
                          child: Text(wing),
                        );
                      }).toList(),
                    ),
                    DropdownButton<String>(
                      hint: Text('Select a User'),
                      value: selectedUser,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedUser = newValue;
                        });
                      },
                      items: users.map((String users) {
                        return DropdownMenuItem<String>(
                          value: users,
                          child: Text(users),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter a Wing and Flat no.',
                    hintText: wingAndFlatNo,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
