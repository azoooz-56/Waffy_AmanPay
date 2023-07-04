import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
class AnimatedLogo extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(seconds: 3),
    );
    final animation = useAnimation(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );

    useEffect(() {
      animationController.repeat(reverse: true);
    }, []);

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: 0.15 + (animation * 0.15),
          child: Image.asset('assets/images/splash_logo.jpg'),
        );
      },
    );
  }
}
