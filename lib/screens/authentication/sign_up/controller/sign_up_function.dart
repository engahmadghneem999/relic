import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../models/user_model.dart' as model;

createUserWithEmailAndPassword(String emailAddress , String password,String username)
async {
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );

    String photoUrl = "";
    model.User _user = model.User(
      username: username,
      uid: credential.user!.uid,
      photoUrl: photoUrl,
      email: emailAddress,

    );

    await FirebaseFirestore.instance.collection("users")
        .doc(credential.user!.uid)
        .set(_user.toJson());

    print(credential) ;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}