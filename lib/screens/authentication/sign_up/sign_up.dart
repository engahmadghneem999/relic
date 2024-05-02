import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relic/firebase_auth/facebook_auth.dart';
import 'package:relic/firebase_auth/google_signup.dart';
import 'package:relic/core/constant/const_data.dart';
import 'package:relic/core/constant/image_strings.dart';
import 'package:relic/core/constant/shared_preferences_keys.dart';
import 'package:relic/core/constant/size.dart';
import 'package:relic/core/service/service.dart';
import 'package:relic/screens/authentication/login/login.dart';
import 'package:relic/screens/authentication/sign_up/controller/sign_up_function.dart';
import 'package:relic/widgets/back_btn/back_btn.dart';
import 'package:relic/widgets/page_title/page_title.dart';
import 'package:relic/widgets/social_btn/social_btn.dart';

import '../../../core/constant/text_strings.dart';
import '../../../widgets/bottom_nav_bar.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool checkBoxVal = false ;
  bool obscureText = true ;

  TextEditingController userController = TextEditingController() ;
  TextEditingController emailController = TextEditingController() ;
  TextEditingController passwordController = TextEditingController() ;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>() ;
    validate() async {
      var formData = formKey.currentState;
      if (formData!.validate() && checkBoxVal) {
        setState(() {
          isLoading = true; // Set isLoading to true to show the loading indicator
        });

        try {
          await createUserWithEmailAndPassword(emailController.text, passwordController.text, userController.text);

          // Navigate to the next screen if sign-up is successful
          Get.offAll(const BottomNavBar());
          Get.find<MyServices>().sharedPreferences
              .setBool(SharedPreferencesKeys.isLoginKey, true);
          ConstData.isLogin == true;
        } catch (error) {
          // Handle any errors that occur during sign-up
          print('Error signing up: $error');
        }

        setState(() {
          isLoading = false; // Set isLoading back to false after sign-up attempt is complete
        });
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
              const Back() ,

              /// title
              const PageTitle(
                title: MyTexts.registerNow,
                subTitle: MyTexts.hello,
              ),
              const SizedBox(
                height: MySize.spaceBtwItems,
              ),

              /// form
              Form(
                  key: formKey,
                  child: Column(
                children: [
                  /// user name
                  TextFormField(
                    controller: userController ,
                    validator: (text){
                      if(text!.isEmpty){
                        return 'Please Enter your name' ;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelStyle: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                        fillColor: Colors.grey.withOpacity(0.2),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        labelText: MyTexts.userName),
                  ),
                  const SizedBox(
                    height: MySize.spaceBtwInputFields,
                  ),
                  /// email form
                  TextFormField(
                    controller: emailController,
                    validator: (text){
                      if(text!.isEmpty){
                        return 'Please Enter Your Email ' ;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelStyle: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                        fillColor: Colors.grey.withOpacity(0.2),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        labelText: MyTexts.email),
                  ),
                  const SizedBox(
                    height: MySize.spaceBtwInputFields,
                  ),
                  /// password form
                  TextFormField(
                    obscureText: obscureText,
                    controller: passwordController,
                    validator: (text){
                      if(text!.isEmpty){
                        return 'Password Can\'t be empty' ;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelStyle: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                        fillColor: Colors.grey.withOpacity(0.2),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        suffixIcon:  IconButton(
                          onPressed: (){
                            setState((){
                              obscureText = !obscureText ;
                            }
                            ) ;
                          },
                          color: Colors.grey,
                          icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
                        ),
                        labelText: MyTexts.password),
                  ),
                  const SizedBox(
                    height: MySize.spaceBtwInputFields / 2,
                  ),
                  /// Policy Terms
                  Row(
                    children: [
                      checkBoxVal==true?
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          activeColor: const Color(0xFF009B8D) ,
                          checkColor: const Color(0xFF009B8D),
                          value: checkBoxVal,
                          onChanged: (value) {
                           setState(() {
                            checkBoxVal  = value!;

                           });
                          },
                        ),
                      ):SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          activeColor: const Color(0xFFEDEDED) ,
                          checkColor: const Color(0xFF009B8D),
                          value: checkBoxVal,
                          onChanged: (value) {
                            setState(() {
                              checkBoxVal  = value!;

                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: MySize.spaceBtwItems,
                      ),
                      const Text(
                        MyTexts.iAcceptThe,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: MySize.fontSizeMd),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            MyTexts.policyAndTerms,
                            style: TextStyle(
                                color: Color(0xFF0D47A1),
                                fontSize: MySize.fontSizeMd),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: MySize.spaceBtwSections / 2,
                  ),

                  /// sign up btn
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
                        child: isLoading
                            ? const CircularProgressIndicator(
                          color: Colors.white,
                        )   : const Text(
                          MyTexts.signUp,
                          style: TextStyle(
                              color: Colors.white, fontSize: MySize.fontSizeMd),
                        ),),
                  ),
                  const SizedBox(
                    height: MySize.spaceBtwSections,
                  ),
                ],
              )),

              /// OR
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyTexts.or,
                    style: TextStyle(
                        color: Colors.grey, fontSize: MySize.fontSizeLg),
                  )
                ],
              ),
              const SizedBox(
                height: MySize.spaceBtwItems,
              ),

              /// social btn
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SocialBtn(
                    image: MyImage.google,
                    onTap: ()async{
                      await  signInWithGoogle();

                      },
                  ),
                  SocialBtn(
                    image: MyImage.facebook,
                    onTap: ()async{
                      await signInWithFacebook() ;
                    },
                  ),
                  SocialBtn(
                    image: MyImage.apple,
                  ),
                ],
              ),
              const SizedBox(
                height: MySize.spaceBtwSections,
              ),

              /// dont have account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    MyTexts.alreadyHaveAnAccount,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: MySize.fontSizeMd),
                  ),
                  TextButton(
                      onPressed: () => Get.to(() => const Login()),
                      child: const Text(
                        MyTexts.signIn,
                        style: TextStyle(
                            color: Color(0xFF0D47A1),
                            fontSize: MySize.fontSizeMd),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
