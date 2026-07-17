import 'package:flutter/material.dart';

class UltraSmoothScrollPhysics extends ScrollPhysics {
  const UltraSmoothScrollPhysics({super.parent});

  @override
  UltraSmoothScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return UltraSmoothScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double get minFlingVelocity => 30.0; // Responsive fling triggering

  @override
  double get dragStartDistanceMotionThreshold => 1.5; // Instant scroll initiation

  @override
  double get maxFlingVelocity => 12000.0; // Allow faster, fluid sweeps
}
