import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/customer_login.dart';
import 'package:untitled/customer_signup.dart';
import 'package:untitled/otp.dart';
import 'package:untitled/Phoneauth.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyD0LWyiYSlXXqUCthWT6yh9yI465-f0RJw",
      appId: "XXX",
      messagingSenderId: "XXX",
      projectId: "meme-see",
    ),

  );
  runApp( const MyApp());
}




class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Victory',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.nunitoSansTextTheme()
            .apply(bodyColor: Colors.black)

      ),
      home: const Welcome(

      ),


    routes: {

    }

    );
  }
}



















class Welcome extends StatefulWidget {
  const Welcome({Key ?key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}
bool processing = false;
class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
       super.initState();
  }
  Widget build(BuildContext context) {


    CollectionReference anonymous =
    FirebaseFirestore.instance.collection('anonymous');
    late String _uid;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.tealAccent.shade200,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/illustration-1.png',
                  width: 150,
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "Let's get started",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Text(
                //   "Never a better time than now to start.",
                //   style: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.black38,
                //   ),
                //   textAlign: TextAlign.center,
                // ),
                SizedBox(
                  height: 38,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) =>CustomerRegister() ),
                      );
                    },
                    style: ButtonStyle(
                      foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.purple),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Create Account',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 22,
                ),


                // processing = false == true
                //     ? const CircularProgressIndicator()
                //     : GoogleFacebookLogIn(
                //     label: 'Guest',
                //     onPresssed: () async {
                //       setState(() {
                //         processing = true;
                //       });
                //       await FirebaseAuth.instance
                //           .signInAnonymously()
                //           .whenComplete(() async {
                //         _uid = FirebaseAuth.instance.currentUser!.uid;
                //         await anonymous.doc('_uid').set({
                //           'name': '',
                //           'email': '',
                //           'profileimage': '',
                //           'phone': '',
                //           'address': '',
                //           'cid': _uid
                //         });
                //       });
                //
                //       Navigator.pushReplacementNamed(
                //           context, '/customer_home');
                //     },
                //     child: const Icon(
                //       Icons.person,
                //       size: 55,
                //       color: Colors.lightBlueAccent,
                //     ))

                processing == true
                    ?  CircularProgressIndicator():
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {

                      setState(() {
                        processing = true;

                        print("jjjjjjjjjjjjjjjj");
                      });
                      await FirebaseAuth.instance
                          .signInAnonymously()
                          .whenComplete(() async {
                        _uid = FirebaseAuth.instance.currentUser!.uid;
                        await anonymous.doc('_uid').set({
                          // 'name': '',
                          'email': '',

                          // 'phone': '',
                          // 'address': '',
                          'cid': _uid
                        });
                      });

                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => home()),

                      );
                      setState(() {
                        processing = false;

                        print("jjjjjjjjjjjjjjjj");
                      });

                    },
                    style: ButtonStyle(
                      foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.purple),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child:


                      Text(
                        'Login as Guest ',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),



                //
                // SizedBox(
                //   width: double.infinity,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       Navigator.of(context).push(
                //         MaterialPageRoute(builder: (context) =>CustomerRegister() ),
                //       );
                //     },
                //     style: ButtonStyle(
                //       foregroundColor:
                //       MaterialStateProperty.all<Color>(Colors.white),
                //       backgroundColor:
                //       MaterialStateProperty.all<Color>(Colors.purple),
                //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //         RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(24.0),
                //         ),
                //       ),
                //     ),
                //     child: Padding(
                //       padding: EdgeInsets.all(14.0),
                //       child: Text(
                //         'Sign up',
                //         style: TextStyle(fontSize: 16),
                //       ),
                //     ),
                //   ),
                // ),
                //
                // SizedBox(
                //   width: double.infinity,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       Navigator.of(context).push(
                //         MaterialPageRoute(builder: (context) =>CustomerLogin() ),
                //       );
                //     },
                //     style: ButtonStyle(
                //       foregroundColor:
                //       MaterialStateProperty.all<Color>(Colors.white),
                //       backgroundColor:
                //       MaterialStateProperty.all<Color>(Colors.purple),
                //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //         RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(24.0),
                //         ),
                //       ),
                //     ),
                //     child: Padding(
                //       padding: EdgeInsets.all(14.0),
                //       child: Text(
                //         'Login',
                //         style: TextStyle(fontSize: 16),
                //       ),
                //     ),
                //   ),
                // ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}




class GoogleFacebookLogIn extends StatelessWidget {
  final String label;
  final Function() onPresssed;
  final Widget child;
  const GoogleFacebookLogIn(
      {Key? key,
        required this.child,
        required this.label,
        required this.onPresssed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onPresssed,
        child: Column(
          children: [
            SizedBox(height: 50, width: 50, child: child),
            Text(
              label,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
