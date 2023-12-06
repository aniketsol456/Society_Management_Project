// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:society_management_projecct/Screen/main_screen.dart';
import 'package:society_management_projecct/Screen/otp_screen.dart';
// import 'package:society_management_projecct/Screen/signup_screen_two.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  static String verify = "";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _showPassword = true;

  String _firstName = '';
  String _lastName = '';
  String _phoneNumber = '';
  String _password = '';
  String _confirmPassword = '';

  bool _isValidFirstName = true;
  bool _isValidLastName = true;
  bool _isValidPhoneNumber = true;
  bool _isValidPassword = true;
  bool _isValidConfirmPassword = true;

  // bool validatePhoneNumber(String phoneNumber) {
  //   // Regular expression for E.164 format validation
  //   final RegExp phoneRegex = RegExp(r'^\+[1-9]\d{1,14}$');

  //   return phoneRegex.hasMatch(phoneNumber);
  // }

  // ignore: unused_element
  void _validateForm() {
    setState(() {
      _isValidFirstName = _firstName.isNotEmpty;
      _isValidLastName = _lastName.isNotEmpty;
      _isValidPhoneNumber =
          _phoneNumber.isNotEmpty && _phoneNumber.length == 10;
      _isValidPassword = _password.isNotEmpty && _password.length >= 8;
      _isValidConfirmPassword =
          _confirmPassword == _password && _confirmPassword.isNotEmpty;
    });
  }

  // void _submitForm() async {
  //   _validateForm(); // Validate the form fields before submission

  //   if (_isValidFirstName &&
  //       _isValidLastName &&
  //       _isValidPhoneNumber &&
  //       _isValidPassword &&
  //       _isValidConfirmPassword) {
  //     if (!validatePhoneNumber('+$_phoneNumber')) {
  //       // Notify the user about invalid phone number format
  //       showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             title: Text('Invalid Phone Number'),
  //             content:
  //                 Text('Please enter a valid phone number in indian format.'),
  //             actions: <Widget>[
  //               TextButton(
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: Text('OK'),
  //               ),
  //             ],
  //           );
  //         },
  //       );
  //       return; // Exit the method if phone number format is invalid
  //     }
  //     try {
  //       // Initialize Firebase
  //       await Firebase.initializeApp();

  //       // Create user in Firebase Authentication using phone number
  //       await FirebaseAuth.instance.verifyPhoneNumber(
  //         phoneNumber: '+91$_phoneNumber',
  //         verificationCompleted: (PhoneAuthCredential credential) async {
  //           // Sign in the user with the verification ID and credential
  //           await FirebaseAuth.instance.signInWithCredential(credential);

  //           // User signed in, navigate to next screen
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => OtpScreen(
  //                 verificationId: _verificationId,
  //               ),
  //             ),
  //           );
  //         },
  //         verificationFailed: (FirebaseAuthException e) {
  //           print('Error verifying phone number: $e');
  //           // Handle verification failure
  //         },
  //         codeSent: (String verificationId, int? resendToken) async {
  //           // Handle OTP code sent to the user's phone
  //           // You may implement code entry logic here
  //           print('Code sent: $verificationId');
  //           _verificationId = verificationId;
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => OtpScreen(verificationId: verificationId),
  //             ),
  //           );
  //         },
  //         codeAutoRetrievalTimeout: (String verificationId) {
  //           // Handle timeout for auto retrieval of OTP
  //           print('Timeout for code auto retrieval: $verificationId');
  //         },
  //       );

  //       // Save user details to Firestore
  //       // Save user details after successful phone verification if needed
  //       // Use FirebaseFirestore.instance.collection('users').doc(uid).set({...});
  //       await FirebaseFirestore.instance.collection('users').add({
  //         'firstName': _firstName,
  //         'lastName': _lastName,
  //         'phoneNumber': _phoneNumber,
  //         'password': _password,
  //         // You might want to avoid storing passwords directly in the database for security reasons
  //         // Instead, consider using Firebase Authentication for user authentication
  //         // 'password': _password,
  //       });

  //       // Optionally navigate to the next screen after phone verification
  //       // Navigator.push(
  //       //   context,
  //       //   MaterialPageRoute(
  //       //     builder: (context) => OtpScreen(),
  //       //   ),
  //       // );
  //     } catch (e) {
  //       print('Error: $e');
  //       // Handle errors here
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Error: $e'),
  //         ),
  //       );
  //     }
  //   }
  // }

  TextEditingController countrycode = TextEditingController();

  void initstate() {
    countrycode.text = "91";
    super.initState();
  }

  void Verificationotp() async {
    if (_isValidFirstName &&
        _isValidLastName &&
        _isValidPhoneNumber &&
        _isValidPassword &&
        _isValidConfirmPassword) {
      try {
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: '${countrycode.text + _phoneNumber}',
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {},
          codeSent: (String verificationId, int? resendToken) {
            SignupScreen.verify = verificationId;
            //Go to the next screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OtpScreen(),
              ),
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      } catch (e) {
        print('Unexpected error Having to Verify Otp at signup screen :$e');
      }
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
            Navigator.pushReplacement(
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
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Image.asset('assets/images/1.png'),
                Text(
                  'Create an Account',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'First name',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: InputBorder.none,
                      errorText: !_isValidFirstName
                          ? 'Please enter valid firstname'
                          : null,
                    ),
                    onChanged: (value) {
                      _firstName = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Last name',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      errorText: !_isValidLastName
                          ? 'Please enter valid lastname'
                          : null,
                    ),
                    onChanged: (value) {
                      _lastName = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    // controller: countrycode,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Enter a Mobile No.',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      errorText: !_isValidPhoneNumber
                          ? 'Please enter valid Mobilename'
                          : null,
                    ),
                    onChanged: (value) {
                      _phoneNumber = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    obscureText: _showPassword,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Create a Password',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      errorText: !_isValidPassword
                          ? 'Please enter valid Password'
                          : null,
                      suffixIcon: IconButton(
                        onPressed: ToshowPassword,
                        icon: Icon(_showPassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                    onChanged: (value) {
                      _password = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    obscureText: _showPassword,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Re-Enter a Password',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      errorText: !_isValidConfirmPassword
                          ? 'entered password is not same'
                          : null,
                      suffixIcon: IconButton(
                        onPressed: ToshowPassword,
                        icon: Icon(_showPassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                    onChanged: (value) {
                      _confirmPassword = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: Verificationotp,
                  // () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => SignupScreento(),
                  //   ),
                  // );
                  // },
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
