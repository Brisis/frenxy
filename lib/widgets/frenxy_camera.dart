library flutter_camera;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:frenxy/constants.dart';
import 'package:frenxy/screens/posts/widgets/camera_bottom_controlls.dart';
import 'package:frenxy/screens/posts/widgets/camera_top_controlls.dart';

class FrenxyPostCamera extends StatefulWidget {
  final Color? color;
  final Color? iconColor;
  Function(XFile)? onImageCaptured;
  Function(XFile)? onVideoRecorded;
  final Duration? animationDuration;
  FrenxyPostCamera({Key? key, this.onImageCaptured, this.animationDuration = const Duration(seconds: 1), this.onVideoRecorded, this.iconColor = Colors.white, required this.color}) : super(key: key);
  @override
  _FrenxyPostCameraState createState() => _FrenxyPostCameraState();
}

class _FrenxyPostCameraState extends State<FrenxyPostCamera> {
  List<CameraDescription>? cameras;

  CameraController? controller;

  @override
  void initState() {
    super.initState();
    initCamera().then((_) {
      ///initialize camera and choose the back camera as the initial camera in use.
      setCamera(1);
    });
  }

  /// calls [availableCameras()] which returns a list<CameraDescription>.
  Future initCamera() async {
    cameras = await availableCameras();
    setState(() {});
  }

  /// chooses the camera to use, where the front camera has index = 1, and the rear camera has index = 0
  void setCamera(int index) {
    controller = CameraController(cameras![index], ResolutionPreset.max);
    controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  /// removes the camera controller from memory after use.
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  bool _isTouchOn = false;
  bool _isFrontCamera = true;

  ///Switch
  bool _cameraView = true;

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      backgroundColor: primaryColor,

      /// Performs the actual switch with an animation when _cameraView is toggled
      body: SafeArea(child: cameraView()),
    );
  }

  /// Take a picture
  /// The picture is returned as an XFile.
  void captureImage() {
    controller!.takePicture().then((value) {
      Navigator.pop(context);
      widget.onImageCaptured!(value);
    });
  }

  /// Start a video recording.
  /// The video is returned as an XFile after recording is stopped.
  void setVideo() {
    controller!.startVideoRecording();
  }

  ///Camera View Layout
  Widget cameraView() {
    var camera = controller!.value;
    // fetch screen size
    final size = MediaQuery.of(context).size;

    // calculate scale depending on screen and camera ratios
    // this is actually size.aspectRatio / (1 / camera.aspectRatio)
    // because camera preview size is received as landscape
    // but we're calculating for portrait orientation
    var scale = size.aspectRatio * camera.aspectRatio;

    // to prevent scaling down, invert the value
    if (scale < 1) scale = 1 / scale;
    return Stack(
      key: const ValueKey(0),
      children: [
        /// Ensures the camera preview covers the screen
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Transform.scale(
            scale: scale,
            child: Center(
              child: CameraPreview(controller!),
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  child: PostScreenTopControlls(
                    onCameraFlipTap: () {
                      if (_isFrontCamera == false) {
                        setCamera(1);
                        _isFrontCamera = true;
                      } else {
                        setCamera(0);
                        _isFrontCamera = false;
                      }
                      setState(() {});
                    },
                    onFiltersTap: () {},
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
                    // icon: Icon(_isTouchOn == false ? Icons.flash_on : Icons.flash_off, color: widget.iconColor, size: 30),
                  ),
                ),
                PostCameraBottomControlls(
                  onRecordVideo: () {
                    //Start and stop video
                    if (_isRecording == false) {
                      ///Start
                      controller!.startVideoRecording();
                      setState(() {
                        _isRecording = true;
                      });
                    } else {
                      ///Stop video recording
                      controller!.stopVideoRecording().then((value) {
                        //Navigator.pop(context);
                        widget.onVideoRecorded!(value);
                      });
                      setState(() {
                        _isRecording = false;
                        _isPaused = true;
                      });
                    }
                    //setState(() {});
                  },
                  status: getVideoStatus(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
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

  ///Video View
  Widget videoView() {
    return Stack(
      key: const ValueKey(1),
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CameraPreview(
            controller!,
          ),
        ),

        ///Side controlls
        Positioned(
            top: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 40),
              width: MediaQuery.of(context).size.width,
              color: widget.color,
              height: 100,
              child: Row(
                children: [
                  cameraSwitcherWidget(),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        _isRecording == false ? 'Video recording is off' : 'Video recording is on',
                        style: TextStyle(color: widget.iconColor, fontSize: 22),
                      ),
                    ),
                  ),
                  flashToggleWidget()
                ],
              ),
            )),

        ///Bottom Controls
        Positioned(
          bottom: 0,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                switchToPictureButton(),
                const SizedBox(
                  width: 0.1,
                ),
                stopAndStartVideoButton(),
                const SizedBox(
                  width: 15,
                ),
                pauseAndResumeVideoButton(),
              ],
            ),
          ),
        )
      ],
    );
  }

  /// button to switch from video mode to picture mode
  IconButton switchToPictureButton() {
    return IconButton(
      onPressed: () {
        setState(() {
          ///Show camera view
          _cameraView = true;
        });
      },
      icon: Icon(
        Icons.camera_alt,
        color: widget.iconColor,
        size: 30,
      ),
    );
  }

  /// button to stop and start video
  Widget stopAndStartVideoButton() {
    return IconButton(
      onPressed: () {
        //Start and stop video
        if (_isRecording == false) {
          ///Start
          controller!.startVideoRecording();
          _isRecording = true;
        } else {
          ///Stop video recording
          controller!.stopVideoRecording().then((value) {
            Navigator.pop(context);
            widget.onVideoRecorded!(value);
          });
          _isRecording = false;
        }
        setState(() {});
      },
      icon: Icon(
        Icons.camera,
        color: widget.iconColor,
        size: 50,
      ),
    );
  }

  ///button to pause and resume video
  IconButton pauseAndResumeVideoButton() {
    return IconButton(
      onPressed: () {
        //pause and resume video
        if (_isRecording == true) {
          //pause
          if (_isPaused == true) {
            ///resume
            controller!.resumeVideoRecording();
            _isPaused = false;
          } else {
            ///resume
            controller!.pauseVideoRecording();
            _isPaused = true;
          }
        }
        setState(() {});
      },
      icon: Icon(
        _isPaused == false ? Icons.pause_circle : Icons.play_circle,
        color: widget.iconColor,
        size: 30,
      ),
    );
  }

  /// button to close the camera view
  Widget closeCameraWidget() {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.clear,
        color: widget.iconColor,
        size: 30,
      ),
    );
  }

  /// button to toggle the flash
  Widget flashToggleWidget() {
    return IconButton(
      onPressed: () {
        if (_isTouchOn == false) {
          controller!.setFlashMode(FlashMode.torch);
          _isTouchOn = true;
        } else {
          controller!.setFlashMode(FlashMode.off);
          _isTouchOn = false;
        }
        setState(() {});
      },
      icon: Icon(_isTouchOn == false ? Icons.flash_on : Icons.flash_off, color: widget.iconColor, size: 30),
    );
  }

  /// button to switch between front and rear cameras
  Widget cameraSwitcherWidget() {
    return IconButton(
      onPressed: () {
        if (_isFrontCamera == false) {
          setCamera(1);
          _isFrontCamera = true;
        } else {
          setCamera(0);
          _isFrontCamera = false;
        }
        setState(() {});
      },
      icon: Icon(Icons.change_circle_outlined, color: widget.iconColor, size: 30),
    );
  }

  /// Button to switch from picture mode to video mode
  Widget switchToVideoButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _cameraView = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
        child: CircleAvatar(
          backgroundColor: widget.color,
          child: const Icon(Icons.video_call),
          radius: 13,
        ),
      ),
    );
  }

  /// Button to capture image
  Widget captureImageButton() {
    return IconButton(
      onPressed: () {
        captureImage();
      },
      icon: Icon(
        Icons.camera,
        color: widget.iconColor,
        size: 50,
      ),
    );
  }
}
