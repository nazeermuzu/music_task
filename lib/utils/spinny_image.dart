import 'package:flutter/material.dart';

class SpinningImage extends StatefulWidget {
  @override
  _SpinningImageState createState() => _SpinningImageState();
}

class _SpinningImageState extends State<SpinningImage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat(); // Infinite loop
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: -20,
          child: RotationTransition(
            turns: _controller,
            child: Image.asset(
              "assets/icons/dis1.png",
              height: 120,
            ),
          ),
        ),
      ],
    );
  }
}
