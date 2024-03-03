import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationTest extends StatefulWidget {
  const AnimationTest({Key? key}) : super(key: key);

  @override
  State<AnimationTest> createState() => AnimationTestState();
}

class AnimationTestState extends State<AnimationTest>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 7));
    _animation = Tween<double>(begin: 0, end: 200).animate(_animationController);
    _animationController.forward(); // Start the animation
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => Center(
        child: Container(
          width: _animation.value,
          height: _animation.value,
          child: const Image(
            image: AssetImage('bb151b932844205ac418.jpg'),
          ),
        ),
      ),
    );
  }
}
