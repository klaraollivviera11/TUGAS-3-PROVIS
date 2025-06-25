import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF0D8B8B)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Color(0xFF0D8B8B),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          const SectionHeader(title: 'Today'),
          NotificationCard(
            icon: Icons.star,
            title: 'Weekly New Recipes!',
            description: 'Discover our new recipes of the week!',
            timeAgo: '2 Min Ago',
            iconBackgroundColor: const Color(0xFF0D8B8B),
          ),
          NotificationCard(
            icon: Icons.notifications,
            title: 'Meal Reminder',
            description: 'Time to cook your healthy meal of the day',
            timeAgo: '35 Min Ago',
            iconBackgroundColor: const Color(0xFF0D8B8B),
          ),
          const SectionHeader(title: 'Wednesday'),
          NotificationCard(
            icon: Icons.system_update,
            title: 'New Update Available',
            description: 'Performance improvements and bug fixes.',
            date: '25 April 2024',
            iconBackgroundColor: const Color(0xFF0D8B8B),
          ),
          NotificationCard(
            icon: Icons.star,
            title: 'Reminder',
            description:
                'Don\'t forget to complete your profile to access all app\'s features',
            date: '25 April 2024',
            iconBackgroundColor: const Color(0xFF0D8B8B),
          ),
          NotificationCard(
            icon: Icons.star,
            title: 'Important Notice',
            description:
                'Remember to change your password regularly to keep your account secure',
            date: '25 April 2024',
            iconBackgroundColor: const Color(0xFF0D8B8B),
          ),
          const SectionHeader(title: 'Monday'),
          NotificationCard(
            icon: Icons.star,
            title: 'New Update Available',
            description: 'Performance improvements and bug fixes.',
            date: '22 April 2024',
            iconBackgroundColor: const Color(0xFF0D8B8B),
          ),
          const SizedBox(height: 80), // Space for bottom navigation
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xFF0D8B8B),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        margin: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavBarIcon(icon: Icons.home_outlined, isSelected: false),
            NavBarIcon(icon: Icons.chat_bubble_outline, isSelected: false),
            NavBarIcon(icon: Icons.search, isSelected: false),
            NavBarIcon(icon: Icons.person_outline, isSelected: false),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String? timeAgo;
  final String? date;
  final Color iconBackgroundColor;

  const NotificationCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    this.timeAgo,
    this.date,
    required this.iconBackgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      decoration: BoxDecoration(
        color: const Color(0xFFB2E4E4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0D8B8B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  timeAgo ?? date ?? '',
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NavBarIcon extends StatelessWidget {
  final IconData icon;
  final bool isSelected;

  const NavBarIcon({Key? key, required this.icon, required this.isSelected})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white.withOpacity(0.2) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: Colors.white, size: 24),
    );
  }
}
