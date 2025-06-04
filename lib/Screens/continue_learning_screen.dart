import 'package:flutter/material.dart';
import 'package:canwa/Widgets/category_chip.dart';

class ContinueLearningScreen extends StatefulWidget {
  const ContinueLearningScreen({super.key});

  @override
  State<ContinueLearningScreen> createState() => _ContinueLearningScreenState();
}

class _ContinueLearningScreenState extends State<ContinueLearningScreen> {
  final List<String> _courseCategories = [
    'All Course',
    'Education',
    'Technology',
    'Design',
    'Programming',
    'Science',
    'Art',
  ];
  int _selectedCategoryIndex = 0; // "All Course" selected by default

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: primaryColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Continue Learning',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.black), // Filter icon
            onPressed: () {
              // Handle filter action
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 16.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Category Chips
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              itemCount: _courseCategories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: CategoryChip(
                    name: _courseCategories[index],
                    isSelected: index == _selectedCategoryIndex,
                    onTap: () {
                      setState(() {
                        _selectedCategoryIndex = index;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),

          // Course List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              itemCount: _continueLearningCourses.length,
              itemBuilder: (context, index) {
                final course = _continueLearningCourses[index];
                return _buildCourseProgressCard(
                  context,
                  course,
                  primaryColor,
                  textTheme,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseProgressCard(
    BuildContext context,
    Map<String, dynamic> course,
    Color primaryColor,
    TextTheme textTheme,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              course['image']!,
              height: 90,
              width: 90,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.more_vert, color: Colors.grey[600]),
                  ),
                ),
                Text(
                  course['title']!,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  course['author']!,
                  style: textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
                  maxLines: 1,
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
                  '${(course['progress'] * 100).toInt()}% completed',
                  style: textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Sample data for courses
  final List<Map<String, dynamic>> _continueLearningCourses = [
    {
      'image': 'https://picsum.photos/id/1043/100/80',
      'title':
          'Color Theory for UI Designers: Creating Visually Stunning Interfaces',
      'author': 'Daniel Lewis',
      'progress': 0.75,
    },
    {
      'image': 'https://picsum.photos/id/1047/100/80',
      'title': 'Songwriting with Strings: Composing and Arranging for Guitar',
      'author': 'James Hall',
      'progress': 0.10,
    },
    {
      'image': 'https://picsum.photos/id/1048/100/80',
      'title': 'Kitchen Confidence: Mastering Basic Cooking Techniques',
      'author': 'David Elson & Iva Carolina',
      'progress': 0.00,
    },
    {
      'image': 'https://picsum.photos/id/100/100/80',
      'title': 'Essential Spanish Grammar: Mastering the Fundamental Rules',
      'author': 'Stephanie Nicol',
      'progress': 0.90,
    },
    {
      'image': 'https://picsum.photos/id/200/100/80',
      'title': 'Introduction to Digital Photography: Capture Stunning Images',
      'author': 'Emily White',
      'progress': 0.60,
    },
  ];
}
