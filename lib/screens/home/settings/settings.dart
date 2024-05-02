import 'package:flutter/material.dart';
import 'package:relic/core/constant/image_strings.dart';
import 'package:relic/core/constant/size.dart';

import '../../../widgets/my_appbar/my_appbar.dart';
import '../../../widgets/setting_widgets/profile_setting.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    List setting = ['User Name' , 'Email Address' , 'Password'] ;
    return Scaffold(
      appBar: const MyAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: MySize.sm, vertical: MySize.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 250,
                child: Center(
                  child: Stack(
                    children: [
                      SizedBox(
                          width: 180,
                          child: Image(
                            image: AssetImage(MyImage.profile),
                            fit: BoxFit.fill,
                          )),
                      Positioned(
                          bottom: 1,
                          right: 1,
                          child: Container(
                            width: 50,
                            height: 50,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[100]),
                            child: Image(
                              image: AssetImage(MyImage.addPicture),
                              fit: BoxFit.fill,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              ListView.separated(
                itemCount: setting.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemBuilder: (context, index) => ProfileSetting(
                  title: setting[index],
                  onTap: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
