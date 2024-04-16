import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

sendResetEmail(BuildContext context, String email) async {
  try {
    final dynamicLink = await FirebaseDynamicLinks.instance
        .getDynamicLink(Uri.parse('https://relic.page.link/reset_pass'));

  } on FirebaseAuthException catch (e) {
    showDialog(
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
        context: context);
  }
}
//'https://relic.page.link/reset_pass'
