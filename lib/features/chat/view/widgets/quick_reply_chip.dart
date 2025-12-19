import 'package:flutter/material.dart';

class QuickReply {
  final String id;
  final String text;
  final IconData? icon;

  const QuickReply({required this.id, required this.text, this.icon});
}

class QuickReplyChip extends StatelessWidget {
  final QuickReply reply;
  final VoidCallback? onTap;

  const QuickReplyChip({super.key, required this.reply, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: theme.colorScheme.primary.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (reply.icon != null) ...[
              Icon(reply.icon, size: 16, color: theme.colorScheme.primary),
              const SizedBox(width: 6),
            ],
            Text(
              reply.text,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuickReplyBar extends StatelessWidget {
  final List<QuickReply> replies;
  final Function(QuickReply) onReplySelected;

  const QuickReplyBar({
    super.key,
    required this.replies,
    required this.onReplySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: replies.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          return QuickReplyChip(
            reply: replies[index],
            onTap: () => onReplySelected(replies[index]),
          );
        },
      ),
    );
  }
}
