import 'package:flutter/material.dart';
import 'package:society_management_projecct/Screen/bottom_nav_screen.dart';
import 'package:society_management_projecct/Screen/main_screen.dart';
import 'package:society_management_projecct/Screen/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController Numcontroller = TextEditingController();
  TextEditingController Passcontroller = TextEditingController();

  bool _showPassword = true;
  String? numerrortext;
  String? passerrortext;

  void NavigateToSignup() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignupScreen()));
  }

  // void NavigateToBootomNav() {
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => BottomNavScreen(),
  //     ),
  //   );
  // }

  void NavigateToBootomNav() {
    setState(() {
      numerrortext =
          (Numcontroller.text.isEmpty) ? "Please enter a Mobile number" : null;
      passerrortext =
          (Passcontroller.text.isEmpty) ? "Please enter a Password" : null;
    });
    if (numerrortext == null && passerrortext == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavScreen()),
      );
    }
  }

  void ToshowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            // Navigator.pop(context);
            // Navigator.popUntil(context, (route) => route.isFirst);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 85, 161, 223),
      body: Center(
        child: Container(
          width: 300,
          height: 550,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black, width: 3),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/1.png'),
                Text(
                  'Enter Your Detail',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: Numcontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Enter a Mobile number',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      errorText: numerrortext,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: Passcontroller,
                    obscureText: _showPassword,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: 'Password',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      errorText: passerrortext,
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        onPressed: ToshowPassword,
                        icon: Icon(_showPassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: NavigateToBootomNav,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("don't have an account?  "),
                    TextButton(
                      onPressed: NavigateToSignup,
                      child: Text(
                        "Sign up.",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
