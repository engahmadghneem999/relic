import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relic/core/constant/size.dart';
import 'package:relic/core/constant/text_strings.dart';
import 'package:relic/screens/authentication/forget_password/set_new_pass.dart';
import 'package:relic/widgets/back_btn/back_btn.dart';
import 'package:relic/widgets/page_title/page_title.dart';

class ForgetPass extends StatelessWidget {
  ForgetPass({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    validate() async {
      var formData = formKey.currentState;
      if (formData!.validate()) {
        Get.to(() => SetNewPass()) ;
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
                title: MyTexts.forgetPasswordTitle,
                subTitle: '',
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
                        validator: (text) {
                          if (text!.isEmpty) {
                            return 'Please Enter Your Email ';
                          }
                          return null;
                        },
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
                            labelText: MyTexts.email),
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
