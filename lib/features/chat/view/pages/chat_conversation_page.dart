import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:postman/features/chat/view/widgets/chat_bubble.dart';
import 'package:postman/features/chat/view/widgets/chat_tile.dart';
import 'package:postman/features/chat/view/widgets/quick_reply_chip.dart';

class ChatConversationPage extends StatefulWidget {
  final ChatConversation conversation;

  const ChatConversationPage({super.key, required this.conversation});

  @override
  State<ChatConversationPage> createState() => _ChatConversationPageState();
}

class _ChatConversationPageState extends State<ChatConversationPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  bool _showQuickReplies = true;
  bool _isTyping = false;

  // Quick replies for delivery personnel
  final List<QuickReply> _quickReplies = const [
    QuickReply(id: '1', text: 'On my way!', icon: Iconsax.truck_fast),
    QuickReply(id: '2', text: 'Arriving in 10 mins', icon: Iconsax.timer_1),
    QuickReply(id: '3', text: 'Please come to gate', icon: Iconsax.home),
    QuickReply(id: '4', text: 'Call me', icon: Iconsax.call),
    QuickReply(id: '5', text: 'Delivery attempted', icon: Iconsax.close_circle),
    QuickReply(
      id: '6',
      text: 'Delivered successfully',
      icon: Iconsax.tick_circle,
    ),
  ];

  // Mock messages - Replace with actual data
  List<ChatMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    _loadMockMessages();
  }

  void _loadMockMessages() {
    _messages = [
      ChatMessage(
        id: '1',
        content:
            'Conversation started for package ${widget.conversation.trackingId ?? "delivery"}',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        isMe: false,
        type: MessageType.system,
      ),
      ChatMessage(
        id: '2',
        content:
            'Hello, I have a package for delivery. Will you be available today?',
        timestamp: DateTime.now().subtract(
          const Duration(hours: 1, minutes: 45),
        ),
        isMe: true,
        status: MessageStatus.read,
      ),
      ChatMessage(
        id: '3',
        content: 'Yes, I will be home after 5 PM. Can you deliver after that?',
        timestamp: DateTime.now().subtract(
          const Duration(hours: 1, minutes: 30),
        ),
        isMe: false,
      ),
      ChatMessage(
        id: '4',
        content:
            'Sure, I will try to come around 5:30 PM. Please keep your ID ready for verification.',
        timestamp: DateTime.now().subtract(
          const Duration(hours: 1, minutes: 15),
        ),
        isMe: true,
        status: MessageStatus.read,
      ),
      ChatMessage(
        id: '5',
        content: 'Okay, thank you! Is it a COD delivery?',
        timestamp: DateTime.now().subtract(const Duration(hours: 1)),
        isMe: false,
      ),
      ChatMessage(
        id: '6',
        content:
            'Yes, the amount is ₹1,299. Please keep exact change if possible.',
        timestamp: DateTime.now().subtract(const Duration(minutes: 45)),
        isMe: true,
        status: MessageStatus.read,
      ),
      ChatMessage(
        id: '7',
        content: 'Please deliver after 5 PM, I will be home',
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
        isMe: false,
      ),
    ];
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add(
        ChatMessage(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          content: text.trim(),
          timestamp: DateTime.now(),
          isMe: true,
          status: MessageStatus.sending,
        ),
      );
      _messageController.clear();
      _showQuickReplies = false;
    });

    // Scroll to bottom
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });

    // Simulate message sent
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          final index = _messages.length - 1;
          _messages[index] = ChatMessage(
            id: _messages[index].id,
            content: _messages[index].content,
            timestamp: _messages[index].timestamp,
            isMe: true,
            status: MessageStatus.delivered,
          );
        });
      }
    });
  }

  void _onQuickReplySelected(QuickReply reply) {
    _sendMessage(reply.text);
  }

  Color _getTypeColor() {
    switch (widget.conversation.type) {
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final typeColor = _getTypeColor();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 1,
        titleSpacing: 0,
        title: InkWell(
          onTap: () => _showContactInfo(context),
          child: Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: typeColor.withValues(alpha: 0.15),
                    child: Icon(_getTypeIcon(), color: typeColor, size: 20),
                  ),
                  if (widget.conversation.isOnline)
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 12,
                        height: 12,
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
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.conversation.name,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        if (widget.conversation.trackingId != null) ...[
                          Icon(
                            Iconsax.box_1,
                            size: 10,
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            widget.conversation.trackingId!,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ] else
                          Text(
                            widget.conversation.isOnline ? 'Online' : 'Offline',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: widget.conversation.isOnline
                                  ? Colors.green
                                  : theme.colorScheme.onSurface.withValues(
                                      alpha: 0.5,
                                    ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          if (widget.conversation.phone != null)
            IconButton(
              onPressed: () {
                // Make call
              },
              icon: const Icon(Iconsax.call),
            ),
          IconButton(
            onPressed: () => _showChatMenu(context),
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          // Package Info Banner (for customer chats)
          if (widget.conversation.trackingId != null)
            _buildPackageInfoBanner(theme),

          // Messages List
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ChatBubble(
                  message: message,
                  onLongPress: () => _showMessageOptions(context, message),
                );
              },
            ),
          ),

          // Typing Indicator
          if (_isTyping)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildTypingDot(0),
                      const SizedBox(width: 4),
                      _buildTypingDot(1),
                      const SizedBox(width: 4),
                      _buildTypingDot(2),
                    ],
                  ),
                ),
              ),
            ),

          // Quick Replies
          if (_showQuickReplies &&
              widget.conversation.type == ChatType.customer)
            QuickReplyBar(
              replies: _quickReplies,
              onReplySelected: _onQuickReplySelected,
            ),

          // Input Area
          _buildInputArea(theme),
        ],
      ),
    );
  }

  Widget _buildTypingDot(int index) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 400 + (index * 100)),
      builder: (context, value, child) {
        return Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.3 + (value * 0.3)),
            shape: BoxShape.circle,
          ),
        );
      },
    );
  }

  Widget _buildPackageInfoBanner(ThemeData theme) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.primary.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Iconsax.box_1,
              color: theme.colorScheme.primary,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.conversation.trackingId!,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
                Text(
                  'Tap to view package details',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              // Navigate to package details
            },
            icon: const Icon(Iconsax.arrow_right_3),
            iconSize: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildInputArea(ThemeData theme) {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 8,
        top: 8,
        bottom: MediaQuery.of(context).padding.bottom + 8,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Attachment Button
          IconButton(
            onPressed: () => _showAttachmentOptions(context),
            icon: const Icon(Iconsax.attach_circle),
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
          // Text Input
          Expanded(
            child: Container(
              constraints: const BoxConstraints(maxHeight: 120),
              child: TextField(
                controller: _messageController,
                focusNode: _focusNode,
                maxLines: null,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                  hintStyle: TextStyle(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: theme.colorScheme.surfaceContainerHighest
                      .withValues(alpha: 0.5),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                ),
                onChanged: (text) {
                  setState(() {
                    _showQuickReplies = text.isEmpty;
                  });
                },
                onTap: () {
                  setState(() {
                    _showQuickReplies = _messageController.text.isEmpty;
                  });
                },
              ),
            ),
          ),
          // Send Button
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            child: IconButton(
              onPressed: () => _sendMessage(_messageController.text),
              icon: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Iconsax.send_1,
                  color: theme.colorScheme.onPrimary,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getTypeIcon() {
    switch (widget.conversation.type) {
      case ChatType.customer:
        return Iconsax.user;
      case ChatType.dispatch:
        return Iconsax.truck;
      case ChatType.supervisor:
        return Iconsax.user_octagon;
      case ChatType.system:
        return Iconsax.notification;
    }
  }

  void _showContactInfo(BuildContext context) {
    final theme = Theme.of(context);
    final typeColor = _getTypeColor();

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: theme.colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            CircleAvatar(
              radius: 40,
              backgroundColor: typeColor.withValues(alpha: 0.15),
              child: Icon(_getTypeIcon(), color: typeColor, size: 40),
            ),
            const SizedBox(height: 16),
            Text(
              widget.conversation.name,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            if (widget.conversation.phone != null) ...[
              const SizedBox(height: 4),
              Text(
                widget.conversation.phone!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ],
            const SizedBox(height: 24),
            if (widget.conversation.phone != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildContactAction(
                    context,
                    icon: Iconsax.call,
                    label: 'Call',
                    color: Colors.green,
                    onTap: () {},
                  ),
                  _buildContactAction(
                    context,
                    icon: Iconsax.location,
                    label: 'Navigate',
                    color: Colors.blue,
                    onTap: () {},
                  ),
                  _buildContactAction(
                    context,
                    icon: Iconsax.box_1,
                    label: 'Package',
                    color: Colors.orange,
                    onTap: () {},
                  ),
                ],
              ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildContactAction(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  void _showChatMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Iconsax.search_normal),
              title: const Text('Search in chat'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Iconsax.notification_bing),
              title: const Text('Mute notifications'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Iconsax.document),
              title: const Text('View shared media'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Iconsax.danger, color: Colors.red),
              title: const Text(
                'Report issue',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () => Navigator.pop(context),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _showMessageOptions(BuildContext context, ChatMessage message) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Iconsax.copy),
              title: const Text('Copy message'),
              onTap: () => Navigator.pop(context),
            ),
            if (message.isMe && message.status == MessageStatus.failed)
              ListTile(
                leading: const Icon(Iconsax.refresh),
                title: const Text('Retry sending'),
                onTap: () => Navigator.pop(context),
              ),
            if (message.isMe)
              ListTile(
                leading: const Icon(Iconsax.trash, color: Colors.red),
                title: const Text(
                  'Delete message',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () => Navigator.pop(context),
              ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _showAttachmentOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Share',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildAttachmentOption(
                  context,
                  icon: Iconsax.camera,
                  label: 'Camera',
                  color: Colors.blue,
                  onTap: () => Navigator.pop(context),
                ),
                _buildAttachmentOption(
                  context,
                  icon: Iconsax.gallery,
                  label: 'Gallery',
                  color: Colors.purple,
                  onTap: () => Navigator.pop(context),
                ),
                _buildAttachmentOption(
                  context,
                  icon: Iconsax.location,
                  label: 'Location',
                  color: Colors.green,
                  onTap: () => Navigator.pop(context),
                ),
                _buildAttachmentOption(
                  context,
                  icon: Iconsax.document,
                  label: 'Document',
                  color: Colors.orange,
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildAttachmentOption(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
