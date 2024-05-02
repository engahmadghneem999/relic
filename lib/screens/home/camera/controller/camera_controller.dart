

import 'package:camera/camera.dart';
import 'package:get/get.dart';

import '../camera_screen.dart';

class MyCameraController extends GetxController {
  static MyCameraController get instance => Get.find();

  late CameraController _controller;
   late final Future<void> _initializeControllerFuture = _controller.initialize();



 void getCameraReady()
 async {
   try {
     final cameras = await availableCameras();
     final firstCamera = cameras.first;

     Get.offAll(() => CameraScreen(camera: firstCamera,));
   }catch(e)
   {
     print(e) ;
   }
 }

 void tackPicture()
 async{
   try {
     await _initializeControllerFuture;
     final image = await _controller.takePicture();
   } catch (e) {
     print('Error capturing image: $e');
   }
 }

}