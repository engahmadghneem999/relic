import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relic/auth/facebook_auth.dart';
import 'package:relic/auth/google_signup.dart';
import 'package:relic/core/constant/const_data.dart';
import 'package:relic/core/constant/image_strings.dart';
import 'package:relic/core/constant/shared_preferences_keys.dart';
import 'package:relic/core/service/service.dart';
import 'package:relic/screens/authentication/forget_password/forget_pass.dart';
import 'package:relic/screens/authentication/login/controller/login_function.dart';
import 'package:relic/screens/authentication/sign_up/sign_up.dart';
import 'package:relic/widgets/bottom_nav_bar.dart';
import 'package:relic/widgets/back_btn/back_btn.dart';
import '../../../core/constant/size.dart';
import '../../../core/constant/text_strings.dart';
import '../../../widgets/social_btn/social_btn.dart';
import '../../../widgets/page_title/page_title.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}
bool obscureText = true ;

TextEditingController emailController = TextEditingController() ;
TextEditingController passwordController = TextEditingController() ;

class _LoginState extends State<Login> {


  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>() ;
    validate(){
      var  formData = formKey.currentState ;
      if(formData!.validate())
      {
           signInWithEmailAndPassword(emailController.text, passwordController.text) ;

           Get.offAll(const BottomVavBar());
           Get.find<MyServices>().sharedPreferences
               .setBool(SharedPreferencesKeys.isLoginKey, true);
           ConstData.isLogin==true;

      } else
      {
        return 'Something is wrong' ;
      }
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySize.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// back btn
              const SizedBox(
                height: MySize.spaceBtwSections,
              ),
              const Back() ,

              /// title
              const PageTitle(
                title: MyTexts.signIn,
                subTitle: MyTexts.loginSubTitle,
              ),
              const SizedBox(
                height: MySize.spaceBtwItems,
              ),

              /// form
              Form(
                key: formKey,
                  child: Column(
                    children: [
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
                        controller: passwordController,
                        validator: (text){
                          if(text!.isEmpty){
                            return 'Password Can\'t be empty' ;
                          }
                          return null;
                        },
                        obscureText: obscureText,
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

                      /// Forget pass
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () => Get.to(() =>  ForgetPass()),
                              child: const Text(
                                '${MyTexts.forgetPasswordTitle}?',
                                style: TextStyle(
                                    color: Color(0xFF0D47A1),
                                    fontSize: MySize.fontSizeMd),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: MySize.spaceBtwSections / 2,
                      ),

                      /// sign in btn
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
                              MyTexts.signIn,
                              style: TextStyle(
                                  color: Colors.white, fontSize: MySize.fontSizeMd),
                            )),
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
                      UserCredential crid = await  signInWithGoogle();
                      print(crid) ;
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
                    MyTexts.dontHaveAnAccount,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: MySize.fontSizeMd),
                  ) ,
                  TextButton(
                      onPressed: () => Get.to(() => const SignUp()),
                      child: const Text(
                        MyTexts.registerNow,
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



