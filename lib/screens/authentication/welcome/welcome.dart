import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relic/core/constant/text_strings.dart';
import 'package:relic/screens/authentication/sign_up/sign_up.dart';

import '../../../core/constant/image_strings.dart';
import '../../../core/constant/size.dart';
import '../login/login.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(MySize.defaultSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              /// logo and app name
               SizedBox(
                height: 200,
                width: 160,
                child: Image(
                  image: AssetImage(MyImage.logo),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: MySize.spaceBtwSections * 5,
              ),

              ///sign in btn
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF009B8D),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () => Get.to(() => const Login()),
                    child: const Text(
                      MyTexts.signIn,
                      style: TextStyle(
                          color: Colors.white, fontSize: MySize.fontSizeMd),
                    )),
              ),
              const SizedBox(
                height: MySize.spaceBtwItems,
              ),

              /// create account btn
              SizedBox(
                width: double.infinity,
                height: 60,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF009B8D), width: 2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () => Get.to(() => const SignUp()),
                    child: const Text(MyTexts.registerNow ,  style: TextStyle(
                        color: Color(0xFF009B8D), fontSize: MySize.fontSizeMd),)),
              ),
              // const SizedBox(
              //   height: MySize.spaceBtwSections,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
