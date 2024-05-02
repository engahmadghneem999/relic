import 'package:flutter/material.dart';

import '../../core/constant/image_strings.dart';

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({
    super.key, required this.title, this.onTap,
  });

  final String title ;
  final void Function()? onTap ;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20),
          ),
          InkWell(
            onTap: onTap,
            child: Image(image: AssetImage(MyImage.edit)),
          )
        ],
      ),
    );
  }
}
