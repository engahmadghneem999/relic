import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relic/core/constant/size.dart';
import 'package:relic/screens/authentication/welcome/welcome.dart';
import 'package:relic/widgets/back_btn/back_btn.dart';
import 'package:relic/widgets/page_title/page_title.dart';

import '../../../core/constant/text_strings.dart';

class SetNewPass extends StatefulWidget {
  const SetNewPass({super.key});

  @override
  State<SetNewPass> createState() => _SetNewPassState();
}

class _SetNewPassState extends State<SetNewPass> {
  bool obscureText = true;
  bool obscureText1 = true;

  TextEditingController passController1 = TextEditingController();
  TextEditingController passController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final user = FirebaseAuth.instance.currentUser;
    validate() async {
      var formData = formKey.currentState;
      if (formData!.validate()) {
        await user?.updatePassword(passController2.text);
         Get.offAll(() => const Welcome());
      } else {
        return 'Something is wrong';
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySize.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: MySize.spaceBtwSections,
              ),
              const Back(),

              /// title
              const PageTitle(
                title: MyTexts.setYourPassword,
                subTitle: MyTexts.forgetPasswordSubTitle,
              ),
              const SizedBox(
                height: MySize.spaceBtwItems,
              ),

              /// form
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      /// password form
                      TextFormField(
                        controller: passController1,
                        validator: (text) {
                          if (text!.isEmpty) {
                            return 'Password Can\'t be empty';
                          }
                          return null;
                        },
                        obscureText: obscureText,
                        decoration: InputDecoration(
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelStyle: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                            fillColor: Colors.grey.withOpacity(0.2),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              color: Colors.grey,
                              icon: Icon(obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            labelText: MyTexts.password),
                      ),
                      const SizedBox(
                        height: MySize.spaceBtwInputFields / 2,
                      ),

                      /// confirm password form
                      TextFormField(
                        controller: passController2,
                        validator: (text) {
                          if (text!.isEmpty) {
                            return 'Password Can\'t be empty';
                          } else if (passController2 != passController1) {
                            return 'You Should Enter The Same Password';
                          }
                          return null;
                        },
                        obscureText: obscureText1,
                        decoration: InputDecoration(
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelStyle: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                            fillColor: Colors.grey.withOpacity(0.2),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureText1 = !obscureText1;
                                });
                              },
                              color: Colors.grey,
                              icon: Icon(obscureText1
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            labelText: MyTexts.confirmPassword),
                      ),
                      const SizedBox(
                        height: MySize.spaceBtwSections,
                      ),

                      /// continue btn
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF009B8D),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onPressed: validate,
                            child: const Text(
                              MyTexts.continueBtn,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MySize.fontSizeMd),
                            )),
                      ),
                      const SizedBox(
                        height: MySize.spaceBtwSections,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}



//  currentUser
//             ?.updatePassword(passController2.text)
//             .then((value) =>