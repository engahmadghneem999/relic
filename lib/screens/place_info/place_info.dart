import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relic/core/constant/image_strings.dart';
import 'package:relic/core/constant/size.dart';

import '../../widgets/place_info_widget/place_info.dart';

class PlaceInfoScreen extends StatelessWidget {
  const PlaceInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: MySize.md),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(MyImage.place1), fit: BoxFit.fill)),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// heading
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 25,
                      )),
                  InkWell(
                    onTap: () {},
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: Image(
                        image: AssetImage(MyImage.search),
                        color: Colors.white,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),

              /// body
               PlaceFullInfoWidget(
                title: 'Historic Jeddah',
                imagesListItem: MyImage.place,
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
              )
            ],
          ),
        ),
      ),
    );
  }
}

//
