import 'package:flutter/material.dart';

class SocialBtn extends StatelessWidget {
  const SocialBtn({
    super.key, required this.image, this.onTap,
  });

  final String image ;
final void Function()? onTap ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width * 0.27,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10) ,
            border: Border.all(color: Colors.black , width: 1)
        ),
        child: Center(child: Image(image: AssetImage(image) ,height: 32, fit: BoxFit.cover,)),
      ),
    );
  }
}
