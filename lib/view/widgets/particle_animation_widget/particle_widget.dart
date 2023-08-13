import 'dart:math';
import 'package:flutter/material.dart';

import 'particle_painter.dart';

class ParticleAnimation extends StatefulWidget {
  const ParticleAnimation({
    Key? key,
    this.maxAngle = pi,
    this.minAngle = 0,
    this.numberOfParticles = 300,
    this.duration = const Duration(seconds: 10),
    this.minSpeed = 800,
    this.maxSpeed = 2000,
    this.onAnimationComplete,
  }) : super(key: key);

  final double minAngle;
  final double maxAngle;
  final int numberOfParticles;

  /// Particles animation duration
  final Duration duration;

  /// Min speed of particles
  final int minSpeed;

  /// Max speed of particles
  final int maxSpeed;
  final Function? onAnimationComplete;

  @override
  State<ParticleAnimation> createState() => _ParticleAnimationState();
}

class _ParticleAnimationState extends State<ParticleAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  List<Particle> particles = []; // Store all the particles for animation.

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (widget.onAnimationComplete != null) {
            widget.onAnimationComplete!();
          }
        }
      });
    _generateParticles();
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationController.removeStatusListener;
    _generateParticles();
    super.dispose();
  }

  // Generate particles with random angles and speeds.
  void _generateParticles() {
    particles.clear(); // Clear previously stored particles.
    for (int i = 0; i < widget.numberOfParticles; i++) {
      // Generate a random angle between minAngle and maxAngle.
      double randomAngle = widget.minAngle + Random().nextDouble() * (widget.maxAngle - widget.minAngle);
      // Generate a random speed.
      double speed = widget.minSpeed + Random().nextDouble() * (widget.maxSpeed - widget.minSpeed);
      particles.add(
        Particle(
          angle: randomAngle,
          color: Colors.white, // Get a random color for the particle.
          speed: speed,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, state) {
        return CustomPaint(
          painter: ParticlePainter(particles, _animationController.value), // Paint the particles.
        );
      },
    );
  }
}
