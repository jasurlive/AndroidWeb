import 'package:flutter/material.dart';

class LoadingDots extends StatefulWidget {
  const LoadingDots({super.key});

  @override
  State<LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots>
    with SingleTickerProviderStateMixin {
  late final AnimationController a;

  @override
  void initState() {
    super.initState();
    a = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat();
  }

  @override
  void dispose() {
    a.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (i) {
        return AnimatedBuilder(
          animation: a,
          builder: (_, _) {
            final v = ((a.value + i * 0.2) % 1.0);
            final s = 0.4 +
                (0.6 * (1 - (v - 0.5).abs() * 2).clamp(0.0, 1.0));

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 10 * s,
              height: 10 * s,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            );
          },
        );
      }),
    );
  }
}