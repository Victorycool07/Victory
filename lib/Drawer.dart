
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DRAWER extends StatefulWidget {
  final String documentId;
  const DRAWER({Key? key ,required this.documentId}) : super(key: key);

  @override


  State<DRAWER> createState() => _DRAWERState();
}



//
// CollectionReference a= FirebaseFirestore.instance.collection('Products').doc("").collection("collectionPath");


class _DRAWERState extends State<DRAWER> {

  @override
  Widget build(BuildContext context) {




    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
        .collection("customers").where('cid' ,isEqualTo: FirebaseAuth.instance.currentUser!.uid ).snapshots(),




    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasError) {
    return const Text('Something went wrong');
    }

    if (snapshot.connectionState == ConnectionState.waiting) {
    return Container(
    child: const Center(
    child:
    CircularProgressIndicator()

    ),
    );
    }

    if (snapshot.data!.docs.isEmpty) {
    return Center(
    child: Text(
    'Something went wrong !')
    );
    }




    return Drawer(
          child: Container(
            // color: Colors.deepPurple,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                    padding: EdgeInsets.zero,
                    child: UserAccountsDrawerHeader(
                      margin: EdgeInsets.zero,
                      // decoration: BoxDecoration(

                      accountName: Text(snapshot.data!.docs[0]['name']),
                      accountEmail: Text(snapshot.data!.docs[0]['email']),
                      currentAccountPicture: snapshot.data!.docs[0]['profileimage'] == ''
                          ? const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                            'images/inapp/guest.jpg'),
                      )
                          : CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
    snapshot.data!.docs[0]['profileimage']),
                      ),
                    )
                ),

                ListTile(
                  leading: Icon(
                    CupertinoIcons.home,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Home",
                  ),
                ), // title:Text(
                ListTile(
                  leading: Icon(
                    CupertinoIcons.profile_circled,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Reward",
                  ),
                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.mail,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Gmail us ",
                  ),
                )
              ],
            ),
          ),
        );


      },









    );
    }

}
