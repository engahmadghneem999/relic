import 'package:flutter/material.dart';
import '../../core/constant/size.dart';

class PlaceFullInfoWidget extends StatelessWidget {
  const PlaceFullInfoWidget({
    super.key,
    required this.title,
    required this.description, required this.imagesListItem,
  });

  final String title, description , imagesListItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: MySize.defaultSpace),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const SizedBox(
            height: MySize.spaceBtwItems,
          ),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(
                  color: Colors.grey,
                  overflow: TextOverflow.clip,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          SizedBox(
            height: 100,
            width: double.infinity,
            child: ListView.separated(
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(
                width: MySize.sm,
              ),
              itemBuilder: (context, index) => Image(
                image: AssetImage(imagesListItem),
                width: 100,
              ),
            ),
          )
        ],
      ),
    );
  }
}
