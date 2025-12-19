import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:postman/features/chat/view/pages/chat_conversation_page.dart';
import 'package:postman/features/chat/view/widgets/chat_tile.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  // Mock data - Replace with actual data from providers
  final List<ChatConversation> _allConversations = [
    ChatConversation(
      id: '1',
      name: 'Rajesh Kumar',
      lastMessage: 'Please deliver after 5 PM, I will be home',
      lastMessageTime: DateTime.now().subtract(const Duration(minutes: 5)),
      unreadCount: 2,
      type: ChatType.customer,
      isOnline: true,
      trackingId: 'EK123456789IN',
      phone: '+91 98765 43210',
    ),
    ChatConversation(
      id: '2',
      name: 'Dispatch Center - Delhi',
      lastMessage: 'New pickup added to your route at Sector 15',
      lastMessageTime: DateTime.now().subtract(const Duration(minutes: 30)),
      unreadCount: 1,
      type: ChatType.dispatch,
      isOnline: true,
    ),
    ChatConversation(
      id: '3',
      name: 'Priya Sharma',
      lastMessage: 'Thank you for the delivery!',
      lastMessageTime: DateTime.now().subtract(const Duration(hours: 1)),
      unreadCount: 0,
      type: ChatType.customer,
      isOnline: false,
      trackingId: 'EM987654321IN',
      phone: '+91 87654 32109',
    ),
    ChatConversation(
      id: '4',
      name: 'Supervisor - Mr. Verma',
      lastMessage: 'Good performance this week. Keep it up!',
      lastMessageTime: DateTime.now().subtract(const Duration(hours: 2)),
      unreadCount: 0,
      type: ChatType.supervisor,
      isOnline: true,
    ),
    ChatConversation(
      id: '5',
      name: 'System Notification',
      lastMessage: 'Route optimized: 3 stops rearranged',
      lastMessageTime: DateTime.now().subtract(const Duration(hours: 3)),
      unreadCount: 0,
      type: ChatType.system,
      isOnline: false,
    ),
    ChatConversation(
      id: '6',
      name: 'Amit Patel',
      lastMessage: 'Can you call me before coming?',
      lastMessageTime: DateTime.now().subtract(const Duration(hours: 4)),
      unreadCount: 0,
      type: ChatType.customer,
      isOnline: false,
      trackingId: 'EL456789123IN',
      phone: '+91 76543 21098',
    ),
    ChatConversation(
      id: '7',
      name: 'Dispatch Center - Delhi',
      lastMessage: 'Priority delivery assigned: EK789123456IN',
      lastMessageTime: DateTime.now().subtract(const Duration(days: 1)),
      unreadCount: 0,
      type: ChatType.dispatch,
      isOnline: true,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  List<ChatConversation> _getFilteredConversations(ChatType? type) {
    var filtered = _allConversations;

    if (type != null) {
      filtered = filtered.where((c) => c.type == type).toList();
    }

    if (_searchController.text.isNotEmpty) {
      final query = _searchController.text.toLowerCase();
      filtered = filtered.where((c) {
        return c.name.toLowerCase().contains(query) ||
            c.lastMessage.toLowerCase().contains(query) ||
            (c.trackingId?.toLowerCase().contains(query) ?? false);
      }).toList();
    }

    return filtered;
  }

  int _getUnreadCount(ChatType? type) {
    final conversations = type == null
        ? _allConversations
        : _allConversations.where((c) => c.type == type);
    return conversations.fold(0, (sum, c) => sum + c.unreadCount);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Row(
                children: [
                  if (_isSearching)
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: 'Search conversations...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: theme.colorScheme.surfaceContainerHighest
                              .withValues(alpha: 0.5),
                          prefixIcon: const Icon(Iconsax.search_normal),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                        onChanged: (_) => setState(() {}),
                      ),
                    )
                  else ...[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Messages',
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${_getUnreadCount(null)} unread messages',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurface.withValues(
                                alpha: 0.6,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isSearching = !_isSearching;
                        if (!_isSearching) {
                          _searchController.clear();
                        }
                      });
                    },
                    icon: Icon(
                      _isSearching ? Icons.close : Iconsax.search_normal,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: theme.colorScheme.surfaceContainerHighest
                          .withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
            ),

            // Tab Bar
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.5,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TabBar(
                controller: _tabController,
                onTap: (_) => setState(() {}),
                labelColor: theme.colorScheme.onPrimary,
                unselectedLabelColor: theme.colorScheme.onSurface,
                indicator: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                labelStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                tabs: [
                  _buildTab('All', _getUnreadCount(null)),
                  _buildTab('Customers', _getUnreadCount(ChatType.customer)),
                  _buildTab('Dispatch', _getUnreadCount(ChatType.dispatch)),
                ],
              ),
            ),

            // Chat List
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildChatList(null),
                  _buildChatList(ChatType.customer),
                  _buildChatList(ChatType.dispatch),
                  _buildChatList(ChatType.supervisor),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showNewChatOptions(context);
        },
        child: const Icon(Iconsax.message_add),
      ),
    );
  }

  Widget _buildTab(String label, int count) {
    return Tab(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label),
          if (count > 0) ...[
            const SizedBox(width: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                count > 9 ? '9+' : count.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildChatList(ChatType? type) {
    final conversations = _getFilteredConversations(type);

    if (conversations.isEmpty) {
      return _buildEmptyState(type);
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: conversations.length,
      separatorBuilder: (_, __) => Divider(
        height: 1,
        indent: 82,
        endIndent: 20,
        color: Theme.of(
          context,
        ).colorScheme.outlineVariant.withValues(alpha: 0.3),
      ),
      itemBuilder: (context, index) {
        final conversation = conversations[index];
        return ChatTile(
          conversation: conversation,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ChatConversationPage(conversation: conversation),
              ),
            );
          },
          onLongPress: () {
            _showChatOptions(context, conversation);
          },
        );
      },
    );
  }

  Widget _buildEmptyState(ChatType? type) {
    final theme = Theme.of(context);
    String title;
    String subtitle;
    IconData icon;

    if (_searchController.text.isNotEmpty) {
      title = 'No results found';
      subtitle = 'Try a different search term';
      icon = Iconsax.search_normal;
    } else {
      switch (type) {
        case ChatType.customer:
          title = 'No customer messages';
          subtitle = 'Customer queries will appear here';
          icon = Iconsax.user;
          break;
        case ChatType.dispatch:
          title = 'No dispatch messages';
          subtitle = 'Updates from dispatch center will appear here';
          icon = Iconsax.truck;
          break;
        case ChatType.supervisor:
          title = 'No team messages';
          subtitle = 'Messages from supervisors will appear here';
          icon = Iconsax.people;
          break;
        default:
          title = 'No messages yet';
          subtitle = 'Start a conversation';
          icon = Iconsax.message;
      }
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 48, color: theme.colorScheme.primary),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  void _showChatOptions(BuildContext context, ChatConversation conversation) {
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
              leading: const Icon(Iconsax.notification_bing),
              title: const Text('Mute notifications'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Iconsax.archive),
              title: const Text('Archive chat'),
              onTap: () => Navigator.pop(context),
            ),
            if (conversation.phone != null)
              ListTile(
                leading: const Icon(Iconsax.call),
                title: const Text('Call customer'),
                onTap: () => Navigator.pop(context),
              ),
            ListTile(
              leading: const Icon(Iconsax.trash, color: Colors.red),
              title: const Text(
                'Delete chat',
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

  void _showNewChatOptions(BuildContext context) {
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
              'Start New Chat',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.orange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Iconsax.truck, color: Colors.orange),
              ),
              title: const Text('Contact Dispatch'),
              subtitle: const Text('Report issues or request assistance'),
              trailing: const Icon(Iconsax.arrow_right_3),
              onTap: () => Navigator.pop(context),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.purple.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Iconsax.user_octagon, color: Colors.purple),
              ),
              title: const Text('Contact Supervisor'),
              subtitle: const Text('Escalate issues or seek guidance'),
              trailing: const Icon(Iconsax.arrow_right_3),
              onTap: () => Navigator.pop(context),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Iconsax.scan_barcode, color: Colors.blue),
              ),
              title: const Text('Chat about Package'),
              subtitle: const Text('Scan tracking ID to start conversation'),
              trailing: const Icon(Iconsax.arrow_right_3),
              onTap: () => Navigator.pop(context),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
