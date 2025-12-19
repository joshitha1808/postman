import 'dart:math' as math;

import 'package:flutter/material.dart';

class FindPostmanMapMock extends StatelessWidget {
  final Animation<double> progress;
  final bool showRoute;

  const FindPostmanMapMock({
    super.key,
    required this.progress,
    required this.showRoute,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: progress,
      builder: (context, _) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final size = Size(constraints.maxWidth, constraints.maxHeight);

            // A simple path to simulate movement.
            final points = <Offset>[
              Offset(size.width * 0.20, size.height * 0.35),
              Offset(size.width * 0.55, size.height * 0.42),
              Offset(size.width * 0.72, size.height * 0.55),
              Offset(size.width * 0.46, size.height * 0.70),
            ];

            final t = progress.value;
            final marker = _pointOnPolyline(points, t);

            return Stack(
              children: [
                // Background to suggest a map.
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerLowest,
                    ),
                    child: CustomPaint(
                      painter: _MapGridPainter(
                        line: theme.colorScheme.outlineVariant,
                      ),
                    ),
                  ),
                ),

                if (showRoute)
                  Positioned.fill(
                    child: CustomPaint(
                      painter: _RoutePainter(
                        points: points,
                        color: theme.colorScheme.primary,
                        outline: theme.colorScheme.onSurface.withValues(
                          alpha: 0.06,
                        ),
                      ),
                    ),
                  ),

                // Some static "points" similar to the reference.
                _staticMarker(
                  context,
                  left: size.width * 0.18,
                  top: size.height * 0.58,
                ),
                _staticMarker(
                  context,
                  left: size.width * 0.70,
                  top: size.height * 0.28,
                ),
                _staticMarker(
                  context,
                  left: size.width * 0.32,
                  top: size.height * 0.78,
                ),

                // Customer location indicator.
                Positioned(
                  left: size.width * 0.46,
                  top: size.height * 0.53,
                  child: const _UserLocationDot(),
                ),

                // Moving postman marker.
                Positioned(
                  left: marker.dx - 18,
                  top: marker.dy - 18,
                  child: _PostmanMarker(pulse: t),
                ),
              ],
            );
          },
        );
      },
    );
  }

  static Widget _staticMarker(
    BuildContext context, {
    required double left,
    required double top,
  }) {
    final theme = Theme.of(context);

    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: theme.colorScheme.primaryContainer,
          border: Border.all(color: theme.colorScheme.surface, width: 3),
        ),
        child: Icon(
          Icons.inventory_2_outlined,
          color: theme.colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }

  static Offset _pointOnPolyline(List<Offset> points, double t) {
    if (points.length < 2) return points.isEmpty ? Offset.zero : points.first;

    final segmentCount = points.length - 1;
    final scaled = t * segmentCount;
    final seg = scaled.floor().clamp(0, segmentCount - 1);
    final localT = scaled - seg;

    final a = points[seg];
    final b = points[seg + 1];
    return Offset(a.dx + (b.dx - a.dx) * localT, a.dy + (b.dy - a.dy) * localT);
  }
}

class ThemedCircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const ThemedCircleIconButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.surface,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Icon(icon, color: theme.colorScheme.onSurface),
        ),
      ),
    );
  }
}

class _UserLocationDot extends StatelessWidget {
  const _UserLocationDot();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.colorScheme.primary.withValues(alpha: 0.14),
            border: Border.all(
              color: theme.colorScheme.primary.withValues(alpha: 0.45),
              width: 2,
            ),
          ),
        ),
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.colorScheme.primary,
            border: Border.all(color: theme.colorScheme.surface, width: 2),
          ),
        ),
      ],
    );
  }
}

class _PostmanMarker extends StatelessWidget {
  final double pulse;

  const _PostmanMarker({required this.pulse});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final ring = 0.12 + 0.10 * (0.5 + 0.5 * math.sin(pulse * math.pi * 2));

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.colorScheme.secondary.withValues(alpha: ring),
          ),
        ),
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.colorScheme.secondaryContainer,
            border: Border.all(color: theme.colorScheme.surface, width: 3),
          ),
          child: Icon(
            Icons.local_shipping_outlined,
            color: theme.colorScheme.onSecondaryContainer,
            size: 20,
          ),
        ),
      ],
    );
  }
}

class _MapGridPainter extends CustomPainter {
  final Color line;

  const _MapGridPainter({required this.line});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = line.withValues(alpha: 0.22)
      ..strokeWidth = 1;

    const step = 28.0;
    for (double x = 0; x <= size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y <= size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    final road = Paint()
      ..color = line.withValues(alpha: 0.18)
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(size.width * 0.08, size.height * 0.24),
      Offset(size.width * 0.90, size.height * 0.36),
      road,
    );
    canvas.drawLine(
      Offset(size.width * 0.18, size.height * 0.70),
      Offset(size.width * 0.86, size.height * 0.64),
      road,
    );
  }

  @override
  bool shouldRepaint(covariant _MapGridPainter oldDelegate) {
    return oldDelegate.line != line;
  }
}

class _RoutePainter extends CustomPainter {
  final List<Offset> points;
  final Color color;
  final Color outline;

  const _RoutePainter({
    required this.points,
    required this.color,
    required this.outline,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (points.length < 2) return;

    final path = Path()..moveTo(points.first.dx, points.first.dy);
    for (final p in points.skip(1)) {
      path.lineTo(p.dx, p.dy);
    }

    final outlinePaint = Paint()
      ..color = outline
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final paint = Paint()
      ..color = color.withValues(alpha: 0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path, outlinePaint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _RoutePainter oldDelegate) {
    return oldDelegate.points != points ||
        oldDelegate.color != color ||
        oldDelegate.outline != outline;
  }
}
