import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/size.dart';
import '../../screens/place_info/place_info.dart';

class HistoryPlaces extends StatelessWidget {
  const HistoryPlaces({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Get.to(()=> const PlaceInfoScreen()),
      child: Container(
        width: double.infinity,
        height: 120,
        padding: const EdgeInsets.all(MySize.sm / 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: Colors.grey)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(image),
              width: 100,
            ),
            SizedBox(
              width: 220,
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 22),
                  ),
                  Expanded(
                    child: Text(
                      description,
                      style: const TextStyle(
                          color: Colors.grey,
                          overflow: TextOverflow.clip,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.grey,
                ))
          ],
        ),
      ),
    );
  }
}
