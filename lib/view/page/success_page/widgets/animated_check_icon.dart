import 'dart:math';
import 'package:flutter/material.dart';
import '../../../../constants/app_colors.dart';
import '../../../widgets/particle_animation_widget/particle_widget.dart';

class AnimatedCheck extends StatefulWidget {
  const AnimatedCheck({super.key});

  @override
  State<AnimatedCheck> createState() => _AnimatedCheckState();
}

class _AnimatedCheckState extends State<AnimatedCheck> with TickerProviderStateMixin {
  late AnimationController _iconAnimationController;
  late AnimationController _scaleController;
  late Animation<double> scaleAnimation;
  late Animation<double> iconAnimation;
  ValueNotifier<bool> showParticle = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    iconAnimation = CurvedAnimation(parent: _iconAnimationController, curve: Curves.easeInBack);
    _scaleController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    scaleAnimation = CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut);
    _iconAnimationController.forward();
    _scaleController.forward();
    Future.delayed(const Duration(milliseconds: 600), () {
      showParticle.value = true;
    });
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ValueListenableBuilder(
            valueListenable: showParticle,
            builder: (context, val, _) {
              return Visibility(
                visible: val,
                child: ParticleAnimation(
                  duration: const Duration(
                    seconds: 3,
                  ),
                  onAnimationComplete: () {
                    showParticle.value = false;
                  },
                  maxAngle: 2 * pi,
                  minSpeed: 500,
                  maxSpeed: 1500,
                  numberOfParticles: 1000,
                ),
              );
            }),
        Center(
          child: ScaleTransition(
            scale: scaleAnimation,
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        SizeTransition(
          sizeFactor: iconAnimation,
          axis: Axis.horizontal,
          // axisAlignment: -1,
          child: const Center(
            child: Icon(Icons.check, color: AppColors.lightBluegooglePayColor, size: 60),
          ),
        ),
      ],
    );
  }
}
