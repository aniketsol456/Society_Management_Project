// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:society_management_projecct/User_Screen/main_screen.dart';
// import 'package:society_management_projecct/feature/Authentication/models/User_model.dart';
import 'package:society_management_projecct/firebase_api/usermodel_api.dart';
// import 'package:society_management_projecct/User_Screen/otp_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final Userapi userapi = Userapi();
  TextEditingController countrycode = TextEditingController();
  String phone = "";
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

  void initstate() {
    countrycode.text = "+91";
    super.initState();
  }

  void validationofform() {
    setState(() {
      _isValidFirstName = _firstName.isNotEmpty;
      _isValidLastName = _lastName.isNotEmpty;
      _isValidPhoneNumber = _phoneNumber.isNotEmpty &&
          _phoneNumber.length == 10 &&
          countrycode.text.isNotEmpty;
      _isValidPassword = _password.isNotEmpty && _password.length >= 8;
      _isValidConfirmPassword =
          _confirmPassword == _password && _confirmPassword.isNotEmpty;
    });
  }

  void ToshowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  void ToOtpScreen() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '${countrycode.text + phone}',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
                    color: Colors.black,
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
                    //controller: controller.phone,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Enter a Mobile No.',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      errorText: !_isValidPhoneNumber
                          ? 'Please enter valid Mobilename'
                          : null,
                    ),
                    onChanged: (value) {
                      phone = value;
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
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: ToOtpScreen,
                  // onPressed: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => OtpScreen(),
                  //     ),
                  //   );
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
