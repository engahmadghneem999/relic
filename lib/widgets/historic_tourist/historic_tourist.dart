import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relic/screens/place_info/place_info.dart';

class HistoricTourist extends StatelessWidget {
  const HistoricTourist({
    super.key,
    required this.image,
    required this.address,
  });

  final String image  , address;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Get.to(()=> const PlaceInfoScreen()),
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(15)),
        child:  Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                address ,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              )
            ]),
      ),
    );
  }
}
