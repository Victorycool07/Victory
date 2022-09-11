import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/otp.dart';

// import 'otp.dart';


FirebaseAuth auth = FirebaseAuth.instance;

bool otpVisibility = false;

String verificationID = "";

TextEditingController phoneController = TextEditingController(text: "+91 ");
TextEditingController otpController = TextEditingController();


class Register extends StatefulWidget {
  const Register({Key ? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {




  @override
  Widget build(BuildContext context) {
    bool processing = false;
    return SizedBox(
      child: Scaffold(
        
        backgroundColor: Color(0xfff7f6fb),
        body: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            reverse: true,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back,
                        size: 32,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/illustration-2.png',
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Registration',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Add your phone number. we'll send you a verification code so we know you're real",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Container(
                    padding: EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        TextFormField(

                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(10)),
                            // prefix: Padding(
                            //   padding: EdgeInsets.symmetric(horizontal: 8),
                            //   child: Text(
                            //     '(+91)',
                            //     style: TextStyle(
                            //       fontSize: 18,
                            //       fontWeight: FontWeight.bold,
                            //     ),
                            //   ),
                            // ),
                            suffixIcon: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 32,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 22,
                        ),

                        Visibility(
                          child: TextFormField(
                                                controller: otpController,
                                                keyboardType: TextInputType.number,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                decoration: InputDecoration(
                                                  enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.black12),
                                                      borderRadius: BorderRadius.circular(10)),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.black12),
                                                      borderRadius: BorderRadius.circular(10)),
                                                  // prefix: Padding(
                                                  //   padding: EdgeInsets.symmetric(horizontal: 8),
                                                  //   child: Text(
                                                  //     '(+91)',
                                                  //     style: TextStyle(
                                                  //       fontSize: 18,
                                                  //       fontWeight: FontWeight.bold,
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                  suffixIcon: Icon(
                                                    Icons.check_circle,
                                                    color: Colors.green,
                                                    size: 32,
                                                  ),
                                                ),
                                              ),
                          visible: otpVisibility,),


                        SizedBox(height: 15,),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: ()




                            async {
                              if(otpVisibility ){
                                verifyOTP();
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(builder: (context) => home()),
                                // );
                              }
                              else {
                                print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
                                print(phoneController);


                                await FirebaseAuth.instance.verifyPhoneNumber(
                                  phoneNumber: phoneController.text,
                                  verificationCompleted: (PhoneAuthCredential credential) {},
                                  verificationFailed: (FirebaseAuthException e) {},
                                  codeSent: (String verificationId, int? resendToken) {

                                    otpVisibility = true;

                                    setState(() {
                                      verificationID = verificationId;
                                    });

                                  },
                                  codeAutoRetrievalTimeout: (String verificationId) {},
                                );



                                 // auth.verifyPhoneNumber(
                                 //    phoneNumber: phoneController.text,
                                 //    verificationCompleted: (PhoneAuthCredential credential) async {
                                 //      await auth.signInWithCredential(credential).then((value){
                                 //        print("You are logged in successfully");
                                 //      });
                                 //    },
                                 //    verificationFailed: (FirebaseAuthException e) {
                                 //      print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
                                 //      print(e.message);
                                 //    },
                                 //    codeSent: (String verificationId, int? resendToken) {
                                 //      otpVisibility = true;
                                 //      verificationID = verificationId;
                                 //      setState(() {});
                                 //    },
                                 //    codeAutoRetrievalTimeout: (String verificationId) {
                                 //
                                 //    },
                                 //  );


                                FocusScope.of(context).unfocus();
                              }



                              // Text("hhhhhhhhhhhhhhhhhhhhh");
                              // print(phoneController);
                              //  loginWithPhone();
                              //
                              //   Navigator.of(context).push(
                              //     MaterialPageRoute(builder: (context) => Otp()),
                              //   );
                                FocusScope.of(context).unfocus();

                            },
                            style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.purple),
                              shape:
                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(14.0),
                              child: Text(
                                'Send',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),


                        // SizedBox(height: 450,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//
//
// void loginWithPhone() async {
//  await auth.verifyPhoneNumber(
//     phoneNumber: phoneController.text,
//     verificationCompleted: (PhoneAuthCredential credential) async {
//       await auth.signInWithCredential(credential).then((value){
//         print("You are logged in successfully");
//       });
//     },
//     verificationFailed: (FirebaseAuthException e) {
//       print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
//       print(e.message);
//     },
//     codeSent: (String verificationId, int? resendToken) {
//       otpVisibility = true;
//       verificationID = verificationId;
//       setState(() {});
//     },
//     codeAutoRetrievalTimeout: (String verificationId) {
//
//     },
//   );
// }


void verifyOTP() async {

  PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationID, smsCode: otpController.text);

  await auth.signInWithCredential(credential).then((value) {
    // print("You are logged in successfully");
    Fluttertoast.showToast(
        msg: "You are logged in successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );


    // Navigator.of(context).push(
    //   MaterialPageRoute(builder: (context) => home()),
    // );
  }
  );
}




