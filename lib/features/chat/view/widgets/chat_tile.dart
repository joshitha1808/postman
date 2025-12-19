import 'package:flutter/material.dart';

enum ChatType { customer, dispatch, supervisor, system }

class ChatConversation {
  final String id;
  final String name;
  final String? avatar;
  final String lastMessage;
  final DateTime lastMessageTime;
  final int unreadCount;
  final ChatType type;
  final bool isOnline;
  final String? trackingId;
  final String? phone;

  const ChatConversation({
    required this.id,
    required this.name,
    this.avatar,
    required this.lastMessage,
    required this.lastMessageTime,
    this.unreadCount = 0,
    required this.type,
    this.isOnline = false,
    this.trackingId,
    this.phone,
  });
}

class ChatTile extends StatelessWidget {
  final ChatConversation conversation;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const ChatTile({
    super.key,
    required this.conversation,
    this.onTap,
    this.onLongPress,
  });

  Color _getTypeColor(ChatType type) {
    switch (type) {
      case ChatType.customer:
        return Colors.blue;
      case ChatType.dispatch:
        return Colors.orange;
      case ChatType.supervisor:
        return Colors.purple;
      case ChatType.system:
        return Colors.grey;
    }
  }

  IconData _getTypeIcon(ChatType type) {
    switch (type) {
      case ChatType.customer:
        return Icons.person;
      case ChatType.dispatch:
        return Icons.local_shipping;
      case ChatType.supervisor:
        return Icons.admin_panel_settings;
      case ChatType.system:
        return Icons.notifications;
    }
  }

  String _getTypeLabel(ChatType type) {
    switch (type) {
      case ChatType.customer:
        return 'Customer';
      case ChatType.dispatch:
        return 'Dispatch';
      case ChatType.supervisor:
        return 'Supervisor';
      case ChatType.system:
        return 'System';
    }
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);

    if (diff.inMinutes < 1) {
      return 'Now';
    } else if (diff.inHours < 1) {
      return '${diff.inMinutes}m ago';
    } else if (diff.inDays < 1) {
      return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    } else if (diff.inDays == 1) {
      return 'Yesterday';
    } else if (diff.inDays < 7) {
      const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
      return days[time.weekday - 1];
    } else {
      return '${time.day}/${time.month}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final typeColor = _getTypeColor(conversation.type);

    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            // Avatar with online indicator
            Stack(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: typeColor.withValues(alpha: 0.15),
                  child: conversation.avatar != null
                      ? ClipOval(
                          child: Image.asset(
                            conversation.avatar!,
                            width: 56,
                            height: 56,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Icon(
                              _getTypeIcon(conversation.type),
                              color: typeColor,
                              size: 26,
                            ),
                          ),
                        )
                      : Icon(
                          _getTypeIcon(conversation.type),
                          color: typeColor,
                          size: 26,
                        ),
                ),
                if (conversation.isOnline)
                  Positioned(
                    right: 2,
                    bottom: 2,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: theme.colorScheme.surface,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 14),
            // Message Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                conversation.name,
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: conversation.unreadCount > 0
                                      ? FontWeight.bold
                                      : FontWeight.w600,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: typeColor.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                _getTypeLabel(conversation.type),
                                style: TextStyle(
                                  color: typeColor,
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        _formatTime(conversation.lastMessageTime),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: conversation.unreadCount > 0
                              ? theme.colorScheme.primary
                              : theme.colorScheme.onSurface.withValues(
                                  alpha: 0.5,
                                ),
                          fontWeight: conversation.unreadCount > 0
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  if (conversation.trackingId != null) ...[
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(
                          Icons.local_shipping_outlined,
                          size: 12,
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          conversation.trackingId!,
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          conversation.lastMessage,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: conversation.unreadCount > 0
                                ? theme.colorScheme.onSurface
                                : theme.colorScheme.onSurface.withValues(
                                    alpha: 0.6,
                                  ),
                            fontWeight: conversation.unreadCount > 0
                                ? FontWeight.w500
                                : FontWeight.normal,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (conversation.unreadCount > 0) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            conversation.unreadCount > 99
                                ? '99+'
                                : conversation.unreadCount.toString(),
                            style: TextStyle(
                              color: theme.colorScheme.onPrimary,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
