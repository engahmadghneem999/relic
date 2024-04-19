import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relic/screens/authentication/welcome/welcome.dart';
import '../../../core/constant/size.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME'),
      ),
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF009B8D),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: ()=> Get.offAll(()=> const Welcome()),
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                        color: Colors.white, fontSize: MySize.fontSizeMd),
                  )),
            ),
            const SizedBox(
              height: MySize.spaceBtwSections,
            ),
          ],
        ),
      )
    );
  }
}
