import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relic/core/constant/image_strings.dart';
import 'package:relic/screens/home/qr/qr_screen.dart';
import 'package:relic/screens/home/settings/settings.dart';
import 'package:relic/screens/home/tourist/tourist.dart';

import '../screens/home/history/history.dart';
import '../screens/home/home_screen/home.dart';

class BottomVavBar extends StatefulWidget {
  const BottomVavBar({Key? key}) : super(key: key);

  @override
  State<BottomVavBar> createState() => _BottomVavBarState();
}

class _BottomVavBarState extends State<BottomVavBar> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton
          (
          backgroundColor:  const Color(0xFF009B8D),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          onPressed:() => Get.to(() => const QrScreen()),
          child:  Image(image: AssetImage(MyImage.qr),
          ),
        ),
        bottomNavigationBar: Obx(
          () => NavigationBar(
            height: 90,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            backgroundColor: Colors.white,
            indicatorColor: Colors.black.withOpacity(0.1),
            destinations: [
              NavigationDestination(
                  icon: Image(
                    image: controller.selectedIndex.value == 0
                        ? AssetImage(MyImage.homeSelected)
                        : AssetImage(MyImage.home),
                  ),
                  label: 'Home'),
              NavigationDestination(
                  icon: Image(
                    image: controller.selectedIndex.value == 1
                        ? AssetImage(MyImage.touristSelected)
                        : AssetImage(MyImage.tourist),
                  ),
                  label: 'Tourist'),
              NavigationDestination(
                  icon: Image(
                    image: controller.selectedIndex.value == 2
                        ? AssetImage(MyImage.historySelected)
                        : AssetImage(MyImage.history),
                  ),
                  label: 'History'),
              NavigationDestination(
                  icon: Image(
                    image: controller.selectedIndex.value == 3
                        ? AssetImage(MyImage.settingsSelected)
                        : AssetImage(MyImage.settings),
                  ),
                  label: 'Settings'),
            ],
          ),
        ),
        body: Obx(
          () => controller.screens[controller.selectedIndex.value],
        ));
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const Tourist(),
    const History(),
    const Settings(),
  ];
}
