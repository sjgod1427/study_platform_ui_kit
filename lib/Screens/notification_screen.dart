import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Sample data for notifications
  final List<Map<String, dynamic>> _todayNotifications = [
    {
      'imageUrls': ['https://picsum.photos/id/1027/40/40'],
      'userName': 'Jacob Jones',
      'messageType': 'updated class',
      'itemTitle': 'Web Design for Beginners',
      'time': '10:24 AM',
      'isRead': false,
    },
    {
      'imageUrls': ['https://picsum.photos/id/1025/40/40'],
      'userName': 'Cameron Williamson',
      'messageType': 'updated information',
      'itemTitle': 'Intro Fundamental UX Research',
      'time': '09:11 AM',
      'isRead': false,
    },
    {
      'imageUrls': ['https://picsum.photos/id/1005/40/40'],
      'userName': 'Guy Hawkins',
      'messageType': 'updated information',
      'itemTitle': 'UI Design Bootcamp : Design System',
      'time': '09:00 AM',
      'isRead': true,
    },
    {
      'imageUrls': [
        'https://picsum.photos/id/1004/28/28',
        'https://picsum.photos/id/1011/28/28',
      ],
      'userName': 'Bessie Cooper and Kristin Watson',
      'messageType': 'updated class',
      'itemTitle': 'Forex Trading',
      'time': '08:32 AM',
      'isRead': true,
    },
  ];

  final List<Map<String, dynamic>> _yesterdayNotifications = [
    {
      'imageUrls': ['https://picsum.photos/id/1014/40/40'],
      'userName': 'Annete Black',
      'messageType': 'updated class',
      'itemTitle': 'Photogprahy - Become Photogra...',
      'time': '11:24 AM',
      'isRead': true,
    },
    {
      'imageUrls': ['https://picsum.photos/id/1015/40/40'],
      'userName': 'Devon Lane',
      'messageType': 'updated information',
      'itemTitle': 'Learn Basic Animation Using Afte...',
      'time': '03:11 PM',
      'isRead': true,
    },
    {
      'imageUrls': ['https://picsum.photos/id/1027/40/40'],
      'userName': 'Kylie Jenner',
      'messageType': 'updated information',
      'itemTitle': 'Become Great Scientist',
      'time': '01:00 PM',
      'isRead': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[100], // Light grey background as seen in image
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black), // Black icon
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Text(
          'Notification',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Today Section Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today',
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'Mark all as read',
                    style: textTheme.bodyMedium?.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Today Notifications
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _todayNotifications.length,
              itemBuilder: (context, index) {
                final notification = _todayNotifications[index];
                return _NotificationTile(
                  imageUrls: notification['imageUrls'],
                  userName: notification['userName'],
                  messageType: notification['messageType'],
                  itemTitle: notification['itemTitle'],
                  time: notification['time'],
                  isRead: notification['isRead'],
                );
              },
              separatorBuilder:
                  (context, index) => const Divider(
                    height: 32,
                    thickness: 1,
                    color: Colors.grey,
                  ),
            ),
            const SizedBox(height: 32),

            // Yesterday Section Header
            Text(
              'Yesterday',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),

            // Yesterday Notifications
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _yesterdayNotifications.length,
              itemBuilder: (context, index) {
                final notification = _yesterdayNotifications[index];
                return _NotificationTile(
                  imageUrls: notification['imageUrls'],
                  userName: notification['userName'],
                  messageType: notification['messageType'],
                  itemTitle: notification['itemTitle'],
                  time: notification['time'],
                  isRead: notification['isRead'],
                );
              },
              separatorBuilder:
                  (context, index) => const Divider(
                    height: 32,
                    thickness: 1,
                    color: Colors.grey,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final List<String> imageUrls;
  final String userName;
  final String messageType; // e.g., "updated class", "updated information"
  final String itemTitle;
  final String time;
  final bool isRead;

  const _NotificationTile({
    required this.imageUrls,
    required this.userName,
    required this.messageType,
    required this.itemTitle,
    required this.time,
    this.isRead = false,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final textTheme = Theme.of(context).textTheme;

    Widget avatarWidget;
    if (imageUrls.length > 1) {
      // Stack two circular avatars
      avatarWidget = SizedBox(
        width: 50, // Combined width
        height: 40,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              child: CircleAvatar(
                radius: 20, // Slightly smaller to make room for overlap
                backgroundImage: NetworkImage(imageUrls[0]),
              ),
            ),
            Positioned(
              right: 0,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(imageUrls[1]),
              ),
            ),
          ],
        ),
      );
    } else {
      // Single circular avatar
      avatarWidget = CircleAvatar(
        radius: 24, // Standard size
        backgroundImage: NetworkImage(imageUrls[0]),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        avatarWidget,
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User name and message combined
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: userName,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: ' $messageType : ',
                      style: textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                    TextSpan(
                      text: itemTitle,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        if (!isRead) // Show dot only if not read
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: primaryColor, // Use primary color for unread dot
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}
