import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relic/core/constant/size.dart';

import '../../../core/constant/image_strings.dart';
import '../../../widgets/bottom_nav_bar.dart';

class CameraScreen extends StatefulWidget {
  final CameraDescription camera;
  const CameraScreen({
    super.key,
    required this.camera,
  });

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: MySize.md),
          decoration: const BoxDecoration(
            color: Color(0xff303031),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                Container(
                  width: double.infinity,
                  height: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 2, color: Colors.white)),
                  child: FutureBuilder<void>(
                    future: _initializeControllerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: CameraPreview(_controller )));
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ) ,
                InkWell(
                  onTap: ()=> Get.to(()=>const BottomNavBar()),
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(color: Colors.white , borderRadius: BorderRadius.circular(40)),
                    child: Image(image: AssetImage(MyImage.camera) , color: Colors.green,),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
