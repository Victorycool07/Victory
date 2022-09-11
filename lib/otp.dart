// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:untitled/Drawer.dart';
// import 'package:untitled/Phoneauth.dart';
//
// class Otp extends StatefulWidget {
//   const Otp({Key ? key}) : super(key: key);
//
//   @override
//   _OtpState createState() => _OtpState();
// }
//
// class _OtpState extends State<Otp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Color(0xfff7f6fb),
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
//             child: Column(
//               children: [
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Icon(
//                       Icons.arrow_back,
//                       size: 32,
//                       color: Colors.black54,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 18,
//                 ),
//                 Container(
//                   width: 200,
//                   height: 200,
//                   decoration: BoxDecoration(
//                     color: Colors.deepPurple.shade50,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Image.asset(
//                     'assets/images/illustration-3.png',
//                   ),
//                 ),
//                 SizedBox(
//                   height: 24,
//                 ),
//                 Text(
//                   'Verification',
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   "Enter your OTP code number",
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black38,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(
//                   height: 28,
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(28),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           _textFieldOTP(first: true, last: false),
//                           _textFieldOTP(first: false, last: false),
//                           // _textFieldOTP(first: false, last: false),
//                           // _textFieldOTP(first: false, last: false),
//                           _textFieldOTP(first: false, last: false),
//                           _textFieldOTP(first: false, last: true),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 22,
//                       ),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () {
//
//                             verifyOTP();
//                             Navigator.of(context).push(
//                               MaterialPageRoute(builder: (context) => home()),
//                             );
//
//
//                           },
//                           style: ButtonStyle(
//                             foregroundColor:
//                             MaterialStateProperty.all<Color>(Colors.white),
//                             backgroundColor:
//                             MaterialStateProperty.all<Color>(Colors.purple),
//                             shape:
//                             MaterialStateProperty.all<RoundedRectangleBorder>(
//                               RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(24.0),
//                               ),
//                             ),
//                           ),
//                           child: Padding(
//                             padding: EdgeInsets.all(14.0),
//                             child: Text(
//                               'Verify',
//                               style: TextStyle(fontSize: 16),
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 18,
//                 ),
//                 Text(
//                   "Didn't you receive any code?",
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black38,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(
//                   height: 18,
//                 ),
//                 Text(
//                   "Resend New Code",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.purple,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//
//                 SizedBox(
//                   height: 150,
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _textFieldOTP({bool ? first, last}) {
//     return Expanded(
//       child: Container(
//         height: 55,
//         child: AspectRatio(
//           aspectRatio: 1.0,
//           child: TextField(
//             controller: otpController,
//             autofocus: true,
//             // onChanged: (value) {
//             //   print(value);
//             //   if (value.length == 1 && last == false) {
//             //     FocusScope.of(context).nextFocus();
//             //
//             //   }
//             //   if (value.length == 0 && first == false) {
//             //     FocusScope.of(context).previousFocus();
//             //   }
//             // },
//
//
//             showCursor: false,
//             readOnly: false,
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//             keyboardType: TextInputType.number,
//             maxLength: 1,
//             decoration: InputDecoration(
//               counter: Offstage(),
//               enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(width: 2, color: Colors.black12),
//                   borderRadius: BorderRadius.circular(12)),
//               focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(width: 2, color: Colors.purple),
//                   borderRadius: BorderRadius.circular(12)),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//






import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   drawer:DRAWER(
      //
      //     documentId: FirebaseAuth.instance.currentUser!.uid,
      //   )
      // ,
      appBar: AppBar(

      ),
      body:
       Container(
        color: Colors.red,

        child: Text(FirebaseAuth.instance.currentUser!.uid),

      ),
    );
  }
}
