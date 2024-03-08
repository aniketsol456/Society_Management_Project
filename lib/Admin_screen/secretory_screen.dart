import 'package:flutter/material.dart';
import 'package:society_management_projecct/User_Screen/add_notice_screen.dart';
import 'package:society_management_projecct/User_Screen/login.dart';
import 'package:society_management_projecct/User_Screen/manage_notice_screen.dart';
import 'package:society_management_projecct/User_Screen/profile_screen.dart';
import 'package:society_management_projecct/User_Screen/rate_of_us_screen.dart';

class SecretoryScreen extends StatefulWidget {
  const SecretoryScreen({super.key});

  @override
  State<SecretoryScreen> createState() => _SecretoryScreenState();
}

class _SecretoryScreenState extends State<SecretoryScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Function to show logout confirmation dialog
  Future<void> _showLogoutConfirmationDialog() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout Confirmation'),
          content: Text('Are you sure you want to log out from the app?'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.blue),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.blue),
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Perform logout actions here, such as clearing user session, etc.
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.home),
            //   title: Text(
            //     'Home',
            //     style: TextStyle(
            //       fontSize: 15,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => BottomNavScreen(),
            //       ),
            //     );
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text(
                'Rate of us',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RateofusScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.message_sharp),
              title: Text(
                'Share Feedback',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => LoginScreen(),
                //   ),
                // );
                _showLogoutConfirmationDialog(); // Show the logout confirmation dialog
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            // Scaffold.of(context).openDrawer();
            _scaffoldKey.currentState?.openDrawer();
          },
          child: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: Icon(Icons.menu),
          ),
        ),
        title: Text('Management task'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(26),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddNoticceScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.green,
                      width: 3,
                    ),
                  ),
                  child: Column(children: [
                    Icon(
                      Icons.notification_add,
                      size: 40,
                      color: Colors.green,
                    ),
                    Text(
                      '  Add\nNotice',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    )
                  ]),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ManageNoticeScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.green,
                      width: 3,
                    ),
                  ),
                  child: Column(children: [
                    Icon(
                      Icons.report,
                      size: 40,
                      color: Colors.green,
                    ),
                    Text(
                      'Manage\n Notice',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    )
                  ]),
                ),
              ),
              Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green,
                    width: 3,
                  ),
                ),
                child: Column(children: [
                  Icon(
                    Icons.event,
                    size: 40,
                    color: Colors.green,
                  ),
                  Text(
                    'Booking\n Details',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  )
                ]),
              ),
              Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green,
                    width: 3,
                  ),
                ),
                child: Column(children: [
                  Icon(
                    Icons.check,
                    size: 40,
                    color: Colors.green,
                  ),
                  Text(
                    'Add \nDue',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
