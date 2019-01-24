// import 'package:camera/camera.dart';
// import 'dart:async';
// import 'package:flutter/material.dart';

// class CameraMgr{
//   CameraMgr._();
//   CameraController _cameraCtrl;

//   Future<CameraController> openCamera() async {
//     CameraDescription cameraDescription;
//     List<CameraDescription> cameras = await availableCameras();
//     for (CameraDescription xx in cameras){
//       if(xx.lensDirection==CameraLensDirection.front){
//         cameraDescription = xx;
//         break;
//       }
//     }
//     if(cameraDescription==null){
//       return null;
//     }
//     if (_cameraCtrl != null) {
//       await _cameraCtrl.dispose();
//     }
//     _cameraCtrl = new CameraController(cameraDescription, ResolutionPreset.low)..addListener(() {
//       if (_cameraCtrl.value.hasError) {
//         print("");
//       }
//     });

//     try {
//       await _cameraCtrl.initialize();
//     } on CameraException catch (e) {
//       print(e);
//     }
//     return _cameraCtrl;
//   }
//   close()async {
//     if (_cameraCtrl != null) {
//       await _cameraCtrl.dispose();
//     }
//     _cameraCtrl = null;
//   }
// }
// CameraMgr myCameraMgr = new CameraMgr._();

// class TestCamera extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//     return new _TestCameraState();
//   }
// }
// class _TestCameraState extends State<TestCamera>{
//   @override
//   void initState() {
//     super.initState();
//     myCameraMgr.openCamera();
//   }
//   @override
//   void dispose(){
//     super.dispose();
//     myCameraMgr.close();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       home: new Scaffold(
//         backgroundColor: Colors.blueAccent,
//         body: new Center(
//           child: new LayoutBuilder(
//             builder: (BuildContext ctx,BoxConstraints bcts){
//               return new GestureDetector(
//                 child: new Container(
//                   height: 80.0,
//                   color: Colors.red[100],
//                   child: new Text("touch to show dialog"),
//                 ),
//                 onTap: ()async{
//                   CameraController ctrl = await myCameraMgr.openCamera();
//                   showDialog(
//                     context: ctx,
//                     builder: (BuildContext _){
//                       return new Container(
//                         height: bcts.maxHeight,
//                         width: bcts.maxWidth,
//                         child: new DialogCamera(ctrl),
//                       );
//                     }
//                   );
//                 },
//               );
//             },
//           )
//         ),
//       ),
//     );
//   }
// }

// class DialogCamera extends StatelessWidget{
//   DialogCamera(this.ctrl);
//   final CameraController ctrl;
//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//       margin: new EdgeInsets.all(150.0),
//       child: new Center(
//         child: new CameraPreview(this.ctrl),
//       ),
//     );
//   }
// }










  // Future<void> openCamera() async {
  //   CameraDescription cameraDescription;
  //   List<CameraDescription> cameras = await availableCameras();
  //   for (CameraDescription xx in cameras){
  //     if(xx.lensDirection==CameraLensDirection.front){
  //       cameraDescription = xx;
  //       break;
  //     }
  //   }
  //   if(cameraDescription==null){
  //     return null;
  //   }
  //   if (_cameraCtrl != null) {
  //     await _cameraCtrl.dispose();
  //   }
  //   _cameraCtrl = new CameraController(cameraDescription, ResolutionPreset.low)..addListener(() {
  //     if (_cameraCtrl.value.hasError) {
  //       print("");
  //     }
  //   });

  //   try {
  //     await _cameraCtrl.initialize();
  //   } on CameraException catch (e) {
  //     print(e);
  //   }
  //   return _cameraCtrl;
  // }
  // close()async {
  //   if (_cameraCtrl != null) {
  //     await _cameraCtrl.dispose();
  //   }
  //   _cameraCtrl = null;
  // }
// }

















































import './main.dart';

import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';


//List<CameraDescription> cameras;


//  Future<CameraDescription> openCamera() async {
//     CameraDescription cameraDescription;
//     List<CameraDescription> cameras = await availableCameras();
//     for (CameraDescription xx in cameras){
//       if(xx.lensDirection==CameraLensDirection.front){
//         cameraDescription = xx;
//         break;
//       }
//     }
//     if(cameraDescription==null){
//       return null;
//     }
//   return(openCamera());

//  }



//  Future<List<CameraDescription>> availableCameras() async {
//   try {
//     final List<dynamic> 
//     cameras = await availableCameras();
//     return cameras.map((dynamic camera) {
//       return CameraDescription(
//         name: camera['name'],
//         //lensDirection: _parseCameraLensDirection(camera['lensFacing']),
//       );
//     }).toList();
//   } on CameraException catch (e) {
//     throw CameraException(e.code, e.description);
//   }
// }
// Future<void> cameraOk() async {
//     try {
//      cameras = await availableCameras();
//     } on CameraException catch (e) {
//      logError(e.code, e.description);
//     }
//      return(cameraOk());
// }


class CameraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CameraExampleHome(),
    );
  }
}





class CameraExampleHome extends StatefulWidget {
  @override
  _CameraExampleHomeState createState() {
    return _CameraExampleHomeState();
  }
}

/// Returns a suitable camera icon for [direction].
IconData getCameraLensIcon(CameraLensDirection direction) {
  switch (direction) {
    case CameraLensDirection.back:
      return Icons.camera_rear;
    case CameraLensDirection.front:
      return Icons.camera_front;
    case CameraLensDirection.external:
      return Icons.camera;
  }
  throw ArgumentError('Unknown lens direction');
}

void logError(String code, String message) =>
    print('Error: $code\nError Message: $message');

class _CameraExampleHomeState extends State<CameraExampleHome> {
  CameraController controller;
  String imagePath;
  String videoPath;
  VideoPlayerController videoController;
  VoidCallback videoPlayerListener;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      //appBar: AppBar(
        //title: const Text('Camera example'),
      //),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Center(
                  child: _cameraPreviewWidget(),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                  color: controller != null && controller.value.isRecordingVideo
                      ? Colors.redAccent
                      : Colors.grey,
                  width: 3.0,
                ),
              ),
            ),
          ),
          _captureControlRowWidget(),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _cameraTogglesRowWidget(),
                _thumbnailWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Display the preview from the camera (or a message if the preview is not available).
  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'Tap a camera',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: CameraPreview(controller),
      );
    }
  }

  /// Display the thumbnail of the captured image or video.
  Widget _thumbnailWidget() {
    return Expanded(
      child: Align(
        alignment: Alignment.centerRight,
        child: videoController == null && imagePath == null
            ? null
            : SizedBox(
                child: (videoController == null)
                    ? Image.file(File(imagePath))
                    : Container(
                        child: Center(
                          child: AspectRatio(
                              aspectRatio: videoController.value.size != null
                                  ? videoController.value.aspectRatio
                                  : 1.0,
                              child: VideoPlayer(videoController)),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.pink)),
                      ),
                width: 64.0,
                height: 64.0,
              ),
      ),
    );
  }

  /// Display the control bar with buttons to take pictures and record videos.
  Widget _captureControlRowWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.camera_alt),
          color: Colors.blue,
          onPressed: controller != null &&
                  controller.value.isInitialized &&
                  !controller.value.isRecordingVideo
              ? onTakePictureButtonPressed
              : null,
        ),
        IconButton(
          icon: const Icon(Icons.videocam),
          color: Colors.blue,
          onPressed: controller != null &&
                  controller.value.isInitialized &&
                  !controller.value.isRecordingVideo
              ? onVideoRecordButtonPressed
              : null,
        ),
        IconButton(
          icon: const Icon(Icons.stop),
          color: Colors.red,
          onPressed: controller != null &&
                  controller.value.isInitialized &&
                  controller.value.isRecordingVideo
              ? onStopButtonPressed
              : null,
        )
      ],
    );
  }

  /// Display a row of toggle to select the camera (or a message if no camera is available).
  Widget _cameraTogglesRowWidget() {
    final List<Widget> toggles = <Widget>[];

    if (cameras?.isEmpty?? true ) {
      return const Text('No camera found');
    } else {
      for (CameraDescription cameraDescription in cameras) {
        toggles.add(
          SizedBox(
            width: 90.0,
            child: RadioListTile<CameraDescription>(
              title: Icon(getCameraLensIcon(cameraDescription.lensDirection)),
              groupValue: controller?.description,
              value: cameraDescription,
              onChanged: controller != null && controller.value.isRecordingVideo
                  ? null
                  : onNewCameraSelected,
            ),
          ),
        );
      }
    }

    return Row(children: toggles);
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  void showInSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }
    controller = CameraController(cameraDescription, ResolutionPreset.high);

    // If the controller is updated then update the UI.
    controller.addListener(() {
      if (mounted) setState(() {});
      if (controller.value.hasError) {
        showInSnackBar('Camera error ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  void onTakePictureButtonPressed() {
    takePicture().then((String filePath) {
      if (mounted) {
        setState(() {
          imagePath = filePath;
          videoController?.dispose();
          videoController = null;
        });
        if (filePath != null) showInSnackBar('Picture saved to $filePath');
      }
    });
  }

  void onVideoRecordButtonPressed() {
    startVideoRecording().then((String filePath) {
      if (mounted) setState(() {});
      if (filePath != null) showInSnackBar('Saving video to $filePath');
    });
  }

  void onStopButtonPressed() {
    stopVideoRecording().then((_) {
      if (mounted) setState(() {});
      showInSnackBar('Video recorded to: $videoPath');
    });
  }

  Future<String> startVideoRecording() async {
    if (!controller.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }

    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Movies/flutter_test';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.mp4';

    if (controller.value.isRecordingVideo) {
      // A recording is already started, do nothing.
      return null;
    }

    try {
      videoPath = filePath;
      await controller.startVideoRecording(filePath);
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
    return filePath;
  }

  Future<void> stopVideoRecording() async {
    if (!controller.value.isRecordingVideo) {
      return null;
    }

    try {
      await controller.stopVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }

    await _startVideoPlayer();
  }

  Future<void> _startVideoPlayer() async {
    final VideoPlayerController vcontroller =
        VideoPlayerController.file(File(videoPath));
    videoPlayerListener = () {
      if (videoController != null && videoController.value.size != null) {
        // Refreshing the state to update video player with the correct ratio.
        if (mounted) setState(() {});
        videoController.removeListener(videoPlayerListener);
      }
    };
    vcontroller.addListener(videoPlayerListener);
    await vcontroller.setLooping(true);
    await vcontroller.initialize();
    await videoController?.dispose();
    if (mounted) {
      setState(() {
        imagePath = null;
        videoController = vcontroller;
      });
    }
    await vcontroller.play();
  }

  Future<String> takePicture() async {
    if (!controller.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Pictures/flutter_test';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.jpg';

    if (controller.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      await controller.takePicture(filePath);
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
    return filePath;
  }

  void _showCameraException(CameraException e) {
    logError(e.code, e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }
}




// Future<void> k() async {

//   try {
//     cameras = await availableCameras();
//   } on CameraException catch (e) {
//     logError(e.code, e.description);
//   }
//   return(CameraApp());
// }

    // CameraDescription cameraDescription;
    // List<CameraDescription> cameras = await availableCameras();
    // return (openCamera());


//Future<void> main() async {
  // Fetch the available cameras before initializing the app.
//   try {
//     cameras = await availableCameras();
//   } on CameraException catch (e) {
//     logError(e.code, e.description);
//   }
//   runApp(CameraApp());
// }











































// ---------- default with class name change
// //import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';

// List<CameraDescription> cameras;

// Future<void> MakePage() async {
//   cameras = await availableCameras();
//   runApp(MakePage());
// }

// class MakePage extends StatefulWidget {
//   @override
//   _MakePageState createState() => _MakePageState();
// }

// class _MakePageState extends State<MakePage> {
//   CameraController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = CameraController(cameras[0], ResolutionPreset.medium);
//     controller.initialize().then((_) {
//       if (!mounted) {
//         return;
//       }
//       setState(() {});
//     });
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!controller.value.isInitialized) {
//       return Container();
//     }
//     return AspectRatio(
//         aspectRatio:
//         controller.value.aspectRatio,
//         child: CameraPreview(controller));
//   }
// }























//--------without changing

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';

// List<CameraDescription> cameras;

// Future<void> main() async {
//   cameras = await availableCameras();
//   runApp(CameraApp());
// }

// class CameraApp extends StatefulWidget {
//   @override
//   _CameraAppState createState() => _CameraAppState();
// }

// class _CameraAppState extends State<CameraApp> {
//   CameraController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = CameraController(cameras[0], ResolutionPreset.medium);
//     controller.initialize().then((_) {
//       if (!mounted) {
//         return;
//       }
//       setState(() {});
//     });
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!controller.value.isInitialized) {
//       return Container();
//     }
//     return AspectRatio(
//         aspectRatio:
//         controller.value.aspectRatio,
//         child: CameraPreview(controller));
//   }
// }















































//here is FAB button ----------------------------

// import 'package:flutter/material.dart';

// class MakePage extends StatefulWidget {
   
//   final Function() onPressed;
//   final String tooltip;
//   final IconData icon;

//   MakePage({this.onPressed, this.tooltip, this.icon});

//   @override
//   _MakePageState createState() => _MakePageState();
// }

// class _MakePageState extends State<MakePage>
//     with SingleTickerProviderStateMixin {
//   bool isOpened = false;
//   AnimationController _animationController;
//   Animation<Color> _buttonColor;
//   Animation<double> _animateIcon;
//   Animation<double> _translateButton;
//   Curve _curve = Curves.easeOut;
//   double _fabHeight = 56.0;

//   @override
//   initState() {
//     _animationController =
//         AnimationController(vsync: this, duration: Duration(milliseconds: 500))
//           ..addListener(() {
//             setState(() {});
//           });
//     _animateIcon =
//         Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
//     _buttonColor = ColorTween(
//       begin: Colors.green,
//       end: Colors.red,
//     ).animate(CurvedAnimation(
//       parent: _animationController,
//       curve: Interval(
//         0.00,
//         1.00,
//         curve: Curves.linear,
//       ),
//     ));
//     _translateButton = Tween<double>(
//       begin: _fabHeight,
//       end: -14.0,
//     ).animate(CurvedAnimation(
//       parent: _animationController,
//       curve: Interval(
//         0.0,
//         0.75,
//         curve: _curve,
//       ),
//     ));
//     super.initState();
//   }

//   @override
//   dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   animate() {
//     if (!isOpened) {
//       _animationController.forward();
//     } else {
//       _animationController.reverse();
//     }
//     isOpened = !isOpened;
//   }

//   Widget add() {
//     return Container(
//       child: FloatingActionButton(
//         onPressed: null,
//         tooltip: 'Add',
//         child: Icon(Icons.add),
//       ),
//     );
//   }

//   Widget image() {
//     return Container(
//       child: FloatingActionButton(
//         onPressed: null,
//         tooltip: 'Image',
//         child: Icon(Icons.image),
//       ),
//     );
//   }

//   Widget inbox() {
//     return Container(
//       child: FloatingActionButton(
//         onPressed: null,
//         tooltip: 'Video',
//         child: Icon(Icons.videocam),
//         //heroTag:  ,
//       ),
//     );
//   }

//   Widget toggle() {
//     return Container(
//       child: FloatingActionButton(
//         backgroundColor: _buttonColor.value,
//         onPressed: animate,
//         tooltip: 'Toggle',
//         child: AnimatedIcon(
//           icon: AnimatedIcons.menu_close,
//           progress: _animateIcon,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: <Widget>[
//         Transform(
//           transform: Matrix4.translationValues(
//             0.0,
//             _translateButton.value * 3.0,
//             0.0,
//           ),
//           child: add(),
//         ),
//         Transform(
//           transform: Matrix4.translationValues(
//             0.0,
//             _translateButton.value * 2.0,
//             0.0,
//           ),
//           child: image(),
//         ),
//         Transform(
//           transform: Matrix4.translationValues(
//             0.0,
//             _translateButton.value,
//             0.0,
//           ),
//           child: inbox(),
//         ),
//         toggle(),
//       ],
//     );
//   }
// }