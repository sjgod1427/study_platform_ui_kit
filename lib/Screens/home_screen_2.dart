import 'package:flutter/material.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  int _selectedIndex =
      0; // 0 for Home, 1 for Wishlist, 2 for My Course, 3 for Profile

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80, // Adjust height as needed
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(
                  'https://picsum.photos/id/237/200/200', // Placeholder profile image
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back,',
                    style: textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    'Josse Makima',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black),
                onPressed: () {
                  // Handle search
                },
              ),
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.notifications_none,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      // Handle notifications
                    },
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: Colors.red, // Notification indicator color
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 12,
                        minHeight: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Continue Learning Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: _buildSectionHeader(
                context,
                'Continue Learning',
                onSeeAllTap: () => {},
              ),
            ),
            const SizedBox(height: 16),
            _buildContinueLearningList(context),
            const SizedBox(height: 32),

            // Popular Mentors Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: _buildSectionHeader(
                context,
                'Popular Mentors',
                onSeeAllTap: () => {},
              ),
            ),
            const SizedBox(height: 16),
            _buildPopularMentorsList(context),
            const SizedBox(height: 32),

            // Popular Course Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: _buildSectionHeader(
                context,
                'Popular Course 🔥',
                onSeeAllTap: () => {},
              ),
            ),
            const SizedBox(height: 16),
            _buildPopularCourseList(context),
            const SizedBox(height: 20), // Padding for bottom nav bar
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 0 ? Icons.home_filled : Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 1 ? Icons.bookmark : Icons.bookmark_border,
            ),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 2
                  ? Icons.play_circle_fill
                  : Icons.play_circle_outline,
            ),
            label: 'My Course',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 3 ? Icons.person : Icons.person_outline,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Ensures all labels are shown
        selectedLabelStyle: textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: textTheme.bodySmall,
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title, {
    VoidCallback? onSeeAllTap,
  }) {
    final primaryColor = Theme.of(context).primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        if (onSeeAllTap != null)
          TextButton(
            onPressed: onSeeAllTap,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              'See All',
              style: TextStyle(
                fontSize: 16,
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildContinueLearningList(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final primaryColor = Theme.of(context).primaryColor;

    final List<Map<String, dynamic>> continueCourses = [
      {
        'image': 'https://picsum.photos/id/1043/100/80',
        'title': 'Web Development Bootcamp: Build and Deploy Your Own Website',
        'progress': 0.75,
        'completed_text': '75% completed',
      },
      {
        'image': 'https://picsum.photos/id/1047/100/80',
        'title': 'Mobile App UI/UX Design Fundamentals with Figma',
        'progress': 0.50,
        'completed_text': '50% completed',
      },
      {
        'image': 'https://picsum.photos/id/1048/100/80',
        'title': 'Introduction to Data Science with Python',
        'progress': 0.20,
        'completed_text': '20% completed',
      },
    ];

    return SizedBox(
      height: 120, // Height for the continue learning cards
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        itemCount: continueCourses.length,
        itemBuilder: (context, index) {
          final course = continueCourses[index];
          return Container(
            width: 300, // Fixed width for each card
            margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    course['image']!,
                    height: 80,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        course['title']!,
                        style: textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: course['progress'],
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                        minHeight: 6,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        course['completed_text']!,
                        style: textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPopularMentorsList(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final List<Map<String, String>> mentors = [
      {'name': 'Destiny', 'image': 'https://picsum.photos/id/1027/200/200'},
      {'name': 'Kayley', 'image': 'https://picsum.photos/id/1025/200/200'},
      {'name': 'Kirstin', 'image': 'https://picsum.photos/id/1011/200/200'},
      {'name': 'Ramon', 'image': 'https://picsum.photos/id/1005/200/200'},
      {'name': 'Gustave', 'image': 'https://picsum.photos/id/1009/200/200'},
      {'name': 'Alice', 'image': 'https://picsum.photos/id/1004/200/200'},
    ];

    return SizedBox(
      height: 120, // Height for mentor avatars and names
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        itemCount: mentors.length,
        itemBuilder: (context, index) {
          final mentor = mentors[index];
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(mentor['image']!),
                ),
                const SizedBox(height: 8),
                Text(
                  mentor['name']!,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPopularCourseList(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final primaryColor = Theme.of(context).primaryColor;

    final List<Map<String, dynamic>> courses = [
      {
        'category': 'Design',
        'title': 'Expert Wireframing for Mobile Design',
        'image': 'https://picsum.photos/id/600/200/150',
        'rating': 4.5,
        'reviews': 1239,
        'price': '\$499',
        'oldPrice': '\$699',
        'tag': 'New Course',
      },
      {
        'category': 'Language',
        'title':
            'TOEFL Preparation Course: Boost Your E...', // Truncated as per image
        'image': 'https://picsum.photos/id/603/200/150',
        'rating': 4.2,
        'reviews': 886,
        'price': '\$399',
        'oldPrice': '\$499',
        'tag': null,
      },
      {
        'category': 'Programming',
        'title': 'Advanced React.js for Modern Web Apps',
        'image': 'https://picsum.photos/id/602/200/150',
        'rating': 4.8,
        'reviews': 1500,
        'price': '\$599',
        'oldPrice': '\$799',
        'tag': 'Best Seller',
      },
    ];

    return SizedBox(
      height: 280, // Height for course cards
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Container(
            width: 200, // Fixed width for each card
            margin: const EdgeInsets.only(right: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16.0),
                  ),
                  child: Stack(
                    children: [
                      Image.network(
                        course['image']!,
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.8),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.favorite_border,
                              color: Colors.black,
                              size: 20,
                            ),
                            onPressed: () {},
                            splashRadius: 20, // Reduce splash radius
                          ),
                        ),
                      ),
                      if (course['tag'] != null)
                        Positioned(
                          top: 12,
                          left: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.7),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              course['tag']!,
                              style: textTheme.bodySmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course['category']!, // Added category text
                        style: textTheme.bodySmall?.copyWith(
                          color: primaryColor, // Category text in primary color
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        course['title']!,
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            '${course['rating']} (${course['reviews']} reviews)',
                            style: textTheme.bodySmall?.copyWith(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            course['price']!,
                            style: textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            course['oldPrice']!,
                            style: textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[500],
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
