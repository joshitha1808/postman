import 'package:flutter/material.dart';

class FindPostmanTrackingSheet extends StatelessWidget {
  const FindPostmanTrackingSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const trackingId = 'INP-DEL-458921';
    const packageName = 'Documents Envelope';
    const postmanName = 'Ravi Kumar';
    const from = 'Connaught Place PO, Delhi';
    const to = 'Upper West Side, New York';

    final events = <TrackingEvent>[
      const TrackingEvent(
        title: 'Parcel accepted',
        subtitle: 'Connaught Place Post Office',
        time: '08:12',
        state: TrackingEventState.completed,
      ),
      const TrackingEvent(
        title: 'Departed sorting center',
        subtitle: 'Delhi Mail Sorting Hub',
        time: '10:35',
        state: TrackingEventState.completed,
      ),
      const TrackingEvent(
        title: 'In transit',
        subtitle: 'International dispatch',
        time: '14:05',
        state: TrackingEventState.current,
      ),
      const TrackingEvent(
        title: 'Arrived at destination hub',
        subtitle: 'NYC Processing Center',
        time: '--:--',
        state: TrackingEventState.upcoming,
      ),
      const TrackingEvent(
        title: 'Out for delivery',
        subtitle: 'Local delivery office',
        time: '--:--',
        state: TrackingEventState.upcoming,
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
                      StatusPill(
                        label: 'In transit',
                        color: theme.colorScheme.primary,
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  FromToRow(from: from, to: to),
                  const SizedBox(height: 18),
                  Text(
                    'Tracking updates',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TrackingTimeline(events: events),
                  const SizedBox(height: 18),
                  Text(
                    'Postman',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  InfoCard(
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
                                  color: theme.colorScheme.onSurface.withValues(
                                    alpha: 0.65,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        StatusPill(
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
                  InfoCard(
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
                                color: theme.colorScheme.onSurface.withValues(
                                  alpha: 0.7,
                                ),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        KeyValueRow(label: 'Tracking ID', value: trackingId),
                        const SizedBox(height: 6),
                        const KeyValueRow(label: 'Status', value: 'In transit'),
                        const SizedBox(height: 6),
                        const KeyValueRow(
                          label: 'ETA',
                          value: 'Today, 6:00 PM',
                        ),
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

enum TrackingEventState { completed, current, upcoming }

class TrackingEvent {
  final String title;
  final String? subtitle;
  final String time;
  final TrackingEventState state;

  const TrackingEvent({
    required this.title,
    this.subtitle,
    required this.time,
    required this.state,
  });
}

class TrackingTimeline extends StatelessWidget {
  final List<TrackingEvent> events;

  const TrackingTimeline({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      child: Column(
        children: [
          for (int i = 0; i < events.length; i++)
            _TimelineRow(event: events[i], isLast: i == events.length - 1),
        ],
      ),
    );
  }
}

class _TimelineRow extends StatelessWidget {
  final TrackingEvent event;
  final bool isLast;

  const _TimelineRow({required this.event, required this.isLast});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final indicatorColor = switch (event.state) {
      TrackingEventState.completed => theme.colorScheme.primary,
      TrackingEventState.current => theme.colorScheme.secondary,
      TrackingEventState.upcoming => theme.colorScheme.outlineVariant,
    };

    final textEmphasis = event.state == TrackingEventState.upcoming
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
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.6,
                        ),
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
                      color: theme.colorScheme.onSurface.withValues(
                        alpha: 0.65,
                      ),
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

class FromToRow extends StatelessWidget {
  final String from;
  final String to;

  const FromToRow({super.key, required this.from, required this.to});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InfoCard(
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

class KeyValueRow extends StatelessWidget {
  final String label;
  final String value;

  const KeyValueRow({super.key, required this.label, required this.value});

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

class InfoCard extends StatelessWidget {
  final Widget child;

  const InfoCard({super.key, required this.child});

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

class StatusPill extends StatelessWidget {
  final String label;
  final Color color;

  const StatusPill({super.key, required this.label, required this.color});

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
