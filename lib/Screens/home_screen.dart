import 'package:flutter/material.dart';

import 'package:canwa/Widgets/category_chip.dart'; // Import the new CategoryChip

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex =
      0; // 0 for Home, 1 for Wishlist, 2 for My Course, 3 for Profile

  final List<String> _courseCategories = [
    'Education',
    'Technology',
    'Design',
    'Language',
    'Health and Wellness',
    'Business and Finance',
    'Data Science',
    'Marketing',
    'Art',
    'Music',
  ];

  // Placeholder for selected category, if we wanted to make them selectable
  // int? _selectedCategoryIndex;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // In a real app, you would navigate to different screens here
    // print('Tapped index: $index');
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
                  // print('Search pressed');
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
                      // print('Notifications pressed');
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
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Latest quiz Section
            _buildSectionHeader(
              context,
              'Latest quiz',
              showPagination: true,
              currentPage: 0, // Assuming 3 pages for pagination, current is 0
              totalPages: 3,
            ),
            const SizedBox(height: 16),
            _buildLatestQuizCard(context),
            const SizedBox(height: 32),

            // Course Categories Section
            _buildSectionHeader(
              context,
              'Course Categories',
              onSeeAllTap: () => {},
            ),
            const SizedBox(height: 16),
            _buildCourseCategoriesList(context),
            const SizedBox(height: 32),

            // Recommendation Section
            _buildSectionHeader(
              context,
              'Recommendation',
              onSeeAllTap: () => {},
            ),
            const SizedBox(height: 16),
            _buildRecommendationCourseList(context),
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
    bool showPagination = false,
    int currentPage = 0,
    int totalPages = 0,
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
        if (showPagination)
          Row(
            children: List.generate(totalPages, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 2.0),
                width: currentPage == index ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: currentPage == index ? primaryColor : Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          )
        else if (onSeeAllTap != null)
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

  Widget _buildLatestQuizCard(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final primaryColor = Theme.of(context).primaryColor;

    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: primaryColor, // Using primary color as per theme
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
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                'https://picsum.photos/id/401/400/200', // Placeholder image for the background
                fit: BoxFit.cover,
                color: Colors.black.withValues(
                  alpha: 0.2,
                ), // Darken the image slightly
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Unleash Your Creative Knowledge!',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.quiz,
                      color: Colors.white.withValues(alpha: 0.8),
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '5 Quizzes',
                      style: textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Icon(
                      Icons.access_time,
                      color: Colors.white.withValues(alpha: 0.8),
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '1.5 Hours',
                      style: textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // White button background
                    foregroundColor: primaryColor, // Primary color text
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 0, // No shadow for this button
                  ),
                  child: Text(
                    'Start Quiz',
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseCategoriesList(BuildContext context) {
    return SizedBox(
      height: 40, // Height for the chips
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _courseCategories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CategoryChip(
              name: _courseCategories[index],
              // isSelected: index == _selectedCategoryIndex, // Example for selectable
              isSelected: false, // For now, all are unselected as per image
              onTap: () {
                // setState(() {
                //   _selectedCategoryIndex = index;
                // });
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildRecommendationCourseList(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final primaryColor = Theme.of(context).primaryColor;

    final List<Map<String, dynamic>> courses = [
      {
        'category': 'Graphic Design',
        'title': 'Expert Wireframing for Mobile',
        'image': 'https://picsum.photos/id/600/200/150',
        'rating': 4.5,
        'reviews': 1239,
        'price': '\$499',
        'oldPrice': '\$699',
        'tag': null,
      },
      {
        'category': 'Science',
        'title': 'Become a Great Scientist',
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
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Container(
            width: 250, // Fixed width for each card
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
                        style: TextStyle(
                          fontSize: 14,
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
