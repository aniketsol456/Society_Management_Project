import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:society_management_projecct/Screen/signup_screen.dart';
import 'package:society_management_projecct/Screen/signup_screen_two.dart';
// import 'package:society_management_projecct/Screen/signup_screen_two.dart';
// import 'package:society_management_projecct/Screen/bottom_nav_screen.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatefulWidget {
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  // void toSignupScreen() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => SignupScreento(),
  //     ),
  //   );
  // }

  // late String enteredOtp;

  // @override
  // void initState() {
  //   super.initState();
  //   enteredOtp = ''; // Initializing enteredOtp
  // }

  // void toSignupScreen() async {
  //   try {
  //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: widget.verificationId,
  //       smsCode: enteredOtp,
  //     );

  //     // Sign in the user with the credential
  //     await FirebaseAuth.instance.signInWithCredential(credential);

  //     // User successfully verified, navigate to signup screen
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => SignupScreento(),
  //       ),
  //     );
  //   } catch (e) {
  //     // Handle verification failure
  //     if (e is FirebaseAuthException) {
  //       if (e.code == 'invalid-verification-code') {
  //         // Handle invalid verification code error
  //         print('Invalid verification code. Please try again.');
  //         // Show a snackbar or dialog to inform the user about the error
  //         // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         //   content: Text('Invalid verification code. Please try again.'),
  //         // ));
  //       } else {
  //         // Handle other FirebaseAuthException errors
  //         print('Error verifying OTP: ${e.message}');
  //         // Show a snackbar or dialog to inform the user about the error
  //         // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         //   content: Text('Error verifying OTP: ${e.message}'),
  //         // ));
  //       }
  //     } else {
  //       // Handle other exceptions
  //       print('Unexpected error verifying OTP: $e');
  //       // Show a snackbar or dialog to inform the user about the error
  //       // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       //   content: Text('Unexpected error verifying OTP: $e'),
  //       // ));
  //     }
  //   }
  // }
  String code = " ";

  final FirebaseAuth auth = FirebaseAuth.instance;

  void TosignupScreen() async {
    try {
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: SignupScreen.verify, smsCode: code);

      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(credential);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignupScreento(),
        ),
      );
    } catch (e) {
      print('This is not a proper otp:$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 85, 161, 223),
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
      body: Center(
        child: Container(
          width: 325,
          height: 350,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black, width: 3),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Image.asset('assets/images/1.png'),
                // OtpTextField(
                //   // controller : _otpController,
                //   numberOfFields: 6,
                //   fillColor: Colors.blue.withOpacity(0.1),
                //   filled: true,
                //   onCodeChanged: (value) {
                //     code = value;
                //   },
                // ),
                Pinput(
                  length: 6,
                  showCursor: true,
                  onChanged: (value) {
                    code = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: TosignupScreen,
                  child: Text(
                    'Verify your otp',
                    style: TextStyle(
                      color: Colors.black,
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
