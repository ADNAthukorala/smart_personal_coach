import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';

import 'camera_view.dart';

enum DetectorViewMode { liveFeed, gallery }

class DetectorView extends StatefulWidget {
  const DetectorView({
    super.key,
    required this.onImage,
    this.customPaint,
    this.initialDetectionMode = DetectorViewMode.liveFeed,
    this.initialCameraLensDirection = CameraLensDirection.front,
    this.onCameraFeedReady,
    this.onCameraLensDirectionChanged,
    required this.exerciseAnimationImageUrl,
    required this.titleOfTheExercise,
  });

  final CustomPaint? customPaint; // Need
  final DetectorViewMode initialDetectionMode; // Need
  final Function(InputImage inputImage) onImage; // Need
  final Function()? onCameraFeedReady; // Need
  final Function(CameraLensDirection direction)?
      onCameraLensDirectionChanged; // Need
  final CameraLensDirection initialCameraLensDirection; // Need
  final String exerciseAnimationImageUrl;
  final String titleOfTheExercise;

  @override
  State<DetectorView> createState() => _DetectorViewState();
}

class _DetectorViewState extends State<DetectorView> {
  @override
  Widget build(BuildContext context) {
    return CameraView(
      customPaint: widget.customPaint,
      onImage: widget.onImage,
      onCameraFeedReady: widget.onCameraFeedReady,
      initialCameraLensDirection: widget.initialCameraLensDirection,
      onCameraLensDirectionChanged: widget.onCameraLensDirectionChanged,
      exerciseAnimationImageUrl: widget.exerciseAnimationImageUrl,
      titleOfTheExercise: widget.titleOfTheExercise,
    );
  }
}
