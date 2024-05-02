import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constant/image_strings.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget{
  const MyAppbar({
    super.key,
    this.onLocationTap,
    this.location = 'Algiers, city of Algiers',
    this.bgColor = Colors.white,
  });

  final Color bgColor  ;
  final void Function()? onLocationTap ;
  final String location ;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:  bgColor,
      leading: Image(image: AssetImage(MyImage.mapPoint)  ) ,
      title:   GestureDetector(
        onTap: onLocationTap,
        child:  Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Location' , style: TextStyle(color: Colors.grey , fontSize: 15 , fontWeight: FontWeight.w500),) ,
            Row(
              children: [
                Text(location , style: const TextStyle(color: Colors.black , fontSize: 15 ,),),
                const Icon(Icons.arrow_drop_down , color: Colors.black,)
              ],
            ) ,
          ],),
      ),
      actions: [Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(onTap: (){}, child: Image(image: AssetImage(MyImage.search),),),
      )],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(65);
}
