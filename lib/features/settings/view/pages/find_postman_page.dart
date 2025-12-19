import 'dart:math' as math;

import 'package:flutter/material.dart';

class FindPostmanPage extends StatefulWidget {
  const FindPostmanPage({super.key});

  @override
  State<FindPostmanPage> createState() => _FindPostmanPageState();
}

class _FindPostmanPageState extends State<FindPostmanPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 14),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Find Postman'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Filters',
            icon: const Icon(Icons.tune),
            onPressed: () {
              // Prototype: no filters yet
            },
          ),
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            onPressed: () {
              // Prototype: no search yet
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: _MapMock(
                progress: _controller,
                showRoute: true,
              ),
            ),

            // Recenter button
            Positioned(
              right: 16,
              bottom: 220,
              child: _CircleIconButton(
                icon: Icons.my_location,
                onTap: () {
                  // Prototype: no real map controller
                },
              ),
            ),

            // Bottom sheet
            Align(
              alignment: Alignment.bottomCenter,
              child: _TrackingSheet(),
            ),
          ],
        ),
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleIconButton({required this.icon, required this.onTap});

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

class _TrackingSheet extends StatelessWidget {
  const _TrackingSheet();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const trackingId = 'INP-DEL-458921';
    const packageName = 'Documents Envelope';
    const postmanName = 'Ravi Kumar';
    const from = 'Connaught Place PO, Delhi';
    const to = 'Upper West Side, New York';

    final events = <_TrackingEvent>[
      _TrackingEvent(
        title: 'Parcel accepted',
        subtitle: 'Connaught Place Post Office',
        time: '08:12',
        state: _EventState.completed,
      ),
      _TrackingEvent(
        title: 'Departed sorting center',
        subtitle: 'Delhi Mail Sorting Hub',
        time: '10:35',
        state: _EventState.completed,
      ),
      _TrackingEvent(
        title: 'In transit',
        subtitle: 'International dispatch',
        time: '14:05',
        state: _EventState.current,
      ),
      _TrackingEvent(
        title: 'Arrived at destination hub',
        subtitle: 'NYC Processing Center',
        time: '--:--',
        state: _EventState.upcoming,
      ),
      _TrackingEvent(
        title: 'Out for delivery',
        subtitle: 'Local delivery office',
        time: '--:--',
        state: _EventState.upcoming,
      ),
    ];

    return DraggableScrollableSheet(
      initialChildSize: 0.22,
      minChildSize: 0.18,
      maxChildSize: 0.72,
      builder: (context, scrollController) {
        return Material(
          color: theme.colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
          child: SafeArea(
            top: false,
            child: SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 44,
                      height: 4,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.outlineVariant,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          trackingId,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      _StatusPill(
                        label: 'In transit',
                        color: theme.colorScheme.primary,
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  _FromToRow(from: from, to: to),
                  const SizedBox(height: 18),

                  Text(
                    'Tracking updates',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _TrackingTimeline(events: events),

                  const SizedBox(height: 18),
                  Text(
                    'Postman',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _InfoCard(
                    child: Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: theme.colorScheme.secondaryContainer,
                          ),
                          child: Icon(
                            Icons.local_shipping_outlined,
                            color: theme.colorScheme.onSecondaryContainer,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                postmanName,
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'On route with your parcel',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurface
                                      .withValues(alpha: 0.65),
                                ),
                              ),
                            ],
                          ),
                        ),
                        _StatusPill(
                          label: 'Delivering',
                          color: theme.colorScheme.secondary,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),
                  Text(
                    'Package',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _InfoCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                packageName,
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            Text(
                              'Registered',
                              style: theme.textTheme.labelLarge?.copyWith(
                                color: theme.colorScheme.onSurface
                                    .withValues(alpha: 0.7),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        _KeyValueRow(label: 'Tracking ID', value: trackingId),
                        const SizedBox(height: 6),
                        _KeyValueRow(label: 'Status', value: 'In transit'),
                        const SizedBox(height: 6),
                        _KeyValueRow(label: 'ETA', value: 'Today, 6:00 PM'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: FilledButton(
                      onPressed: () {
                        // Prototype: no real deep-link
                      },
                      child: const Text('Get directions'),
                    ),
                  ),
                  const SizedBox(height: 6),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

enum _EventState { completed, current, upcoming }

class _TrackingEvent {
  final String title;
  final String? subtitle;
  final String time;
  final _EventState state;

  const _TrackingEvent({
    required this.title,
    this.subtitle,
    required this.time,
    required this.state,
  });
}

class _TrackingTimeline extends StatelessWidget {
  final List<_TrackingEvent> events;

  const _TrackingTimeline({required this.events});

  @override
  Widget build(BuildContext context) {
    return _InfoCard(
      child: Column(
        children: [
          for (int i = 0; i < events.length; i++)
            _TimelineRow(
              event: events[i],
              isFirst: i == 0,
              isLast: i == events.length - 1,
            ),
        ],
      ),
    );
  }
}

class _TimelineRow extends StatelessWidget {
  final _TrackingEvent event;
  final bool isFirst;
  final bool isLast;

  const _TimelineRow({
    required this.event,
    required this.isFirst,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final indicatorColor = switch (event.state) {
      _EventState.completed => theme.colorScheme.primary,
      _EventState.current => theme.colorScheme.secondary,
      _EventState.upcoming => theme.colorScheme.outlineVariant,
    };

    final textEmphasis = event.state == _EventState.upcoming
        ? theme.colorScheme.onSurface.withValues(alpha: 0.7)
        : theme.colorScheme.onSurface;

    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 26,
            child: Column(
              children: [
                Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: indicatorColor,
                  ),
                ),
                if (!isLast)
                  Container(
                    width: 2,
                    height: 38,
                    margin: const EdgeInsets.only(top: 6),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.outlineVariant,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        event.title,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: textEmphasis,
                        ),
                      ),
                    ),
                    Text(
                      event.time,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface
                            .withValues(alpha: 0.6),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                if (event.subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    event.subtitle!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface
                          .withValues(alpha: 0.65),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FromToRow extends StatelessWidget {
  final String from;
  final String to;

  const _FromToRow({required this.from, required this.to});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return _InfoCard(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'From',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  from,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.arrow_forward,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'To',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  to,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _KeyValueRow extends StatelessWidget {
  final String label;
  final String value;

  const _KeyValueRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  final Widget child;

  const _InfoCard({required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: child,
    );
  }
}

class _StatusPill extends StatelessWidget {
  final String label;
  final Color color;

  const _StatusPill({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelLarge?.copyWith(
          color: theme.colorScheme.onSurface,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _MapMock extends StatelessWidget {
  final Animation<double> progress;
  final bool showRoute;

  const _MapMock({required this.progress, required this.showRoute});

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
                  child: _UserLocationDot(),
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
          border: Border.all(
            color: theme.colorScheme.surface,
            width: 3,
          ),
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
    return Offset(
      a.dx + (b.dx - a.dx) * localT,
      a.dy + (b.dy - a.dy) * localT,
    );
  }
}

class _UserLocationDot extends StatelessWidget {
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
            border: Border.all(
              color: theme.colorScheme.surface,
              width: 2,
            ),
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
            border: Border.all(
              color: theme.colorScheme.surface,
              width: 3,
            ),
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
