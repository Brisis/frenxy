library flutter_camera;

import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';
import 'package:frenxy/screens/upload/camera/preview_video.dart';
import 'package:frenxy/screens/upload/widgets/camera_bottom_controlls.dart';
import 'package:frenxy/screens/upload/widgets/camera_top_controlls.dart';

class FrenxyPostCamera extends StatefulWidget {
  Function(XFile)? onVideoRecorded;
  FrenxyPostCamera({
    Key? key,
    this.onVideoRecorded,
  }) : super(key: key);
  @override
  _FrenxyPostCameraState createState() => _FrenxyPostCameraState();
}

class _FrenxyPostCameraState extends State<FrenxyPostCamera> {
  List<CameraDescription>? _availableCameras;

  CameraController? controller;

  @override
  void initState() {
    super.initState();
    _getAvailableCameras();
  }

  // get available cameras
  Future<void> _getAvailableCameras() async {
    WidgetsFlutterBinding.ensureInitialized();
    _availableCameras = await availableCameras();
    _initCamera(_availableCameras!.last);
  }

  // init camera
  Future<void> _initCamera(CameraDescription description) async {
    controller =
        CameraController(description, ResolutionPreset.max, enableAudio: true);

    try {
      await controller!.initialize();
      // to notify the widgets that camera has been initialized and now camera preview can be done
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  void _toggleCameraLens() {
    // get current lens direction (front / rear)
    final lensDirection = controller!.description.lensDirection;
    CameraDescription newDescription;
    if (lensDirection == CameraLensDirection.front) {
      newDescription = _availableCameras!.firstWhere((description) =>
          description.lensDirection == CameraLensDirection.back);
    } else {
      newDescription = _availableCameras!.firstWhere((description) =>
          description.lensDirection == CameraLensDirection.front);
    }

    _initCamera(newDescription);
  }

  Timer? _timer;
  int _start = 60;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            stopRecording();
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  /// removes the camera controller from memory after use.
  @override
  void dispose() {
    controller?.dispose();
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }

  bool _isTouchOn = false;
  String filePath = "";

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return Container();
    }

    var camera = controller!.value;
    // fetch screen size
    final size = MediaQuery.of(context).size;
    var scale = size.aspectRatio * camera.aspectRatio;
    // to prevent scaling down, invert the value
    if (scale < 1) scale = 1 / scale;

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        toolbarHeight: 1.0,
        backgroundColor: primaryColor,
        elevation: 0.0,
      ),
      body: Stack(
        key: const ValueKey(0),
        children: [
          /// Ensures the camera preview covers the screen
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Transform.scale(
              scale: scale,
              child: Center(
                child: CameraPreview(controller!),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10),
            child: Column(
              children: [
                _isRecording
                    ? const Expanded(child: SizedBox())
                    : Expanded(
                        child: PostScreenTopControlls(
                          onCloseTap: () {
                            controller?.dispose();
                            Navigator.of(context).pop();
                          },
                          onCameraFlipTap: () {
                            _toggleCameraLens();
                          },
                          onFlashTap: () {
                            if (_isTouchOn == false) {
                              controller!.setFlashMode(FlashMode.torch);
                              _isTouchOn = true;
                            } else {
                              controller!.setFlashMode(FlashMode.off);
                              _isTouchOn = false;
                            }
                            setState(() {});
                          },
                          isFlashOn: _isTouchOn,
                        ),
                      ),
                PostCameraBottomControlls(
                  onRecordVideo: () {
                    if (_isRecording) {
                      stopRecording();
                    } else {
                      startRecording();
                    }
                  },
                  status: getVideoStatus(),
                  filePath: filePath,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  startRecording() async {
    await controller!.prepareForVideoRecording();
    await controller!.startVideoRecording();
    setState(() => _isRecording = true);
    startTimer();
  }

  stopRecording() async {
    final file = await controller!.stopVideoRecording();
    setState(() {
      _isRecording = false;
      _isPaused = true;
    });
    final route = MaterialPageRoute(
      fullscreenDialog: true,
      builder: (_) => CameraPreviewScreen(filePath: file.path),
    );

    setState(() {
      filePath = file.path;
    });

    Navigator.push(context, route);
  }

  VideoStatus getVideoStatus() {
    if (_isRecording) {
      return VideoStatus.isRecording;
    }
    if (_isPaused) {
      return VideoStatus.isPaused;
    }
    return VideoStatus.isInit;
  }

  bool _isRecording = false;
  bool _isPaused = false;
}
