// import 'package:canwa/Widgets/appbar.dart';
// import 'package:flutter/material.dart';

// import 'package:canwa/Widgets/category_chip.dart'; // Import the new CategoryChip

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex =
//       0; // 0 for Home, 1 for Wishlist, 2 for My Course, 3 for Profile

//   final List<String> _courseCategories = [
//     'Education',
//     'Technology',
//     'Design',
//     'Language',
//     'Health and Wellness',
//     'Business and Finance',
//     'Data Science',
//     'Marketing',
//     'Art',
//     'Music',
//   ];

//   // Placeholder for selected category, if we wanted to make them selectable
//   // int? _selectedCategoryIndex;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     // In a real app, you would navigate to different screens here
//     // print('Tapped index: $index');
//   }

//   @override
//   Widget build(BuildContext context) {
//     final primaryColor = Theme.of(context).primaryColor;
//     final textTheme = Theme.of(context).textTheme;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: CustomAppBar(),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Latest quiz Section
//             _buildSectionHeader(
//               context,
//               'Latest quiz',
//               showPagination: true,
//               currentPage: 0, // Assuming 3 pages for pagination, current is 0
//               totalPages: 3,
//             ),
//             const SizedBox(height: 16),
//             _buildLatestQuizCard(context),
//             const SizedBox(height: 32),

//             // Course Categories Section
//             _buildSectionHeader(
//               context,
//               'Course Categories',
//               onSeeAllTap: () => {},
//             ),
//             const SizedBox(height: 16),
//             _buildCourseCategoriesList(context),
//             const SizedBox(height: 32),

//             // Recommendation Section
//             _buildSectionHeader(
//               context,
//               'Recommendation',
//               onSeeAllTap: () => {},
//             ),
//             const SizedBox(height: 16),
//             _buildRecommendationCourseList(context),
//             const SizedBox(height: 20), // Padding for bottom nav bar
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(
//               _selectedIndex == 0 ? Icons.home_filled : Icons.home_outlined,
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               _selectedIndex == 1 ? Icons.bookmark : Icons.bookmark_border,
//             ),
//             label: 'Wishlist',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               _selectedIndex == 2
//                   ? Icons.play_circle_fill
//                   : Icons.play_circle_outline,
//             ),
//             label: 'My Course',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               _selectedIndex == 3 ? Icons.person : Icons.person_outline,
//             ),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: primaryColor,
//         unselectedItemColor: Colors.grey,
//         onTap: _onItemTapped,
//         type: BottomNavigationBarType.fixed, // Ensures all labels are shown
//         selectedLabelStyle: textTheme.bodySmall?.copyWith(
//           fontWeight: FontWeight.bold,
//         ),
//         unselectedLabelStyle: textTheme.bodySmall,
//       ),
//     );
//   }

//   Widget _buildSectionHeader(
//     BuildContext context,
//     String title, {
//     VoidCallback? onSeeAllTap,
//     bool showPagination = false,
//     int currentPage = 0,
//     int totalPages = 0,
//   }) {
//     final primaryColor = Theme.of(context).primaryColor;
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         if (showPagination)
//           Row(
//             children: List.generate(totalPages, (index) {
//               return Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 2.0),
//                 width: currentPage == index ? 24 : 8,
//                 height: 8,
//                 decoration: BoxDecoration(
//                   color: currentPage == index ? primaryColor : Colors.grey[300],
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//               );
//             }),
//           )
//         else if (onSeeAllTap != null)
//           TextButton(
//             onPressed: onSeeAllTap,
//             style: TextButton.styleFrom(
//               padding: EdgeInsets.zero,
//               minimumSize: Size.zero,
//               tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//             ),
//             child: Text(
//               'See All',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: primaryColor,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//       ],
//     );
//   }

//   Widget _buildLatestQuizCard(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     final primaryColor = Theme.of(context).primaryColor;

//     return Container(
//       width: double.infinity,
//       height: 200,
//       decoration: BoxDecoration(
//         color: primaryColor, // Using primary color as per theme
//         borderRadius: BorderRadius.circular(16.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withValues(alpha: 0.1),
//             spreadRadius: 1,
//             blurRadius: 5,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Stack(
//         children: [
//           Positioned.fill(
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(16.0),
//               child: Image.network(
//                 'https://picsum.photos/id/401/400/200', // Placeholder image for the background
//                 fit: BoxFit.cover,
//                 color: Colors.black.withValues(
//                   alpha: 0.2,
//                 ), // Darken the image slightly
//                 colorBlendMode: BlendMode.darken,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(24.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Unleash Your Creative Knowledge!',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.quiz,
//                       color: Colors.white.withValues(alpha: 0.8),
//                       size: 18,
//                     ),
//                     const SizedBox(width: 4),
//                     Text(
//                       '5 Quizzes',
//                       style: textTheme.bodyMedium?.copyWith(
//                         color: Colors.white.withValues(alpha: 0.8),
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     Icon(
//                       Icons.access_time,
//                       color: Colors.white.withValues(alpha: 0.8),
//                       size: 18,
//                     ),
//                     const SizedBox(width: 4),
//                     Text(
//                       '1.5 Hours',
//                       style: textTheme.bodyMedium?.copyWith(
//                         color: Colors.white.withValues(alpha: 0.8),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white, // White button background
//                     foregroundColor: primaryColor, // Primary color text
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 24,
//                       vertical: 12,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12.0),
//                     ),
//                     elevation: 0, // No shadow for this button
//                   ),
//                   child: Text(
//                     'Start Quiz',
//                     style: textTheme.titleSmall?.copyWith(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCourseCategoriesList(BuildContext context) {
//     return SizedBox(
//       height: 40, // Height for the chips
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: _courseCategories.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.only(right: 12.0),
//             child: CategoryChip(
//               name: _courseCategories[index],
//               // isSelected: index == _selectedCategoryIndex, // Example for selectable
//               isSelected: false, // For now, all are unselected as per image
//               onTap: () {
//                 // setState(() {
//                 //   _selectedCategoryIndex = index;
//                 // });
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildRecommendationCourseList(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     final primaryColor = Theme.of(context).primaryColor;

//     final List<Map<String, dynamic>> courses = [
//       {
//         'category': 'Graphic Design',
//         'title': 'Expert Wireframing for Mobile',
//         'image': 'https://picsum.photos/id/600/200/150',
//         'rating': 4.5,
//         'reviews': 1239,
//         'price': '\$499',
//         'oldPrice': '\$699',
//         'tag': null,
//         'isFavorite': false, // Added favorite state
//       },
//       {
//         'category': 'Science',
//         'title': 'Become a Great Scientist',
//         'image': 'https://picsum.photos/id/603/200/150',
//         'rating': 4.2,
//         'reviews': 886,
//         'price': '\$399',
//         'oldPrice': '\$499',
//         'tag': null,
//         'isFavorite': false,
//       },
//       {
//         'category': 'Programming',
//         'title': 'Advanced React.js for Modern Web Apps',
//         'image': 'https://picsum.photos/id/602/200/150',
//         'rating': 4.8,
//         'reviews': 1500,
//         'price': '\$599',
//         'oldPrice': '\$799',
//         'tag': 'Best Seller',
//         'isFavorite': false,
//       },
//     ];

//     return SizedBox(
//       height: 280, // Height for course cards
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: courses.length,
//         itemBuilder: (context, index) {
//           final course = courses[index];
//           return Container(
//             width: 250, // Fixed width for each card
//             margin: const EdgeInsets.only(right: 16.0),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(16.0),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withValues(alpha: 0.1),
//                   spreadRadius: 1,
//                   blurRadius: 5,
//                   offset: const Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: Material(
//               color: Colors.transparent,
//               child: InkWell(
//                 borderRadius: BorderRadius.circular(16.0),
//                 onTap: () {
//                   // Handle course card tap
//                   print('Course tapped: ${course['title']}');
//                   // You can navigate to course detail page here
//                   // Navigator.push(context, MaterialPageRoute(builder: (context) => CourseDetailPage(course: course)));
//                 },
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ClipRRect(
//                       borderRadius: const BorderRadius.vertical(
//                         top: Radius.circular(16.0),
//                       ),
//                       child: Stack(
//                         children: [
//                           Image.network(
//                             course['image']!,
//                             height: 120,
//                             width: double.infinity,
//                             fit: BoxFit.cover,
//                           ),
//                           Positioned(
//                             top: 12,
//                             right: 12,
//                             child: StatefulBuilder(
//                               builder: (context, setState) {
//                                 return Material(
//                                   color: Colors.white.withValues(alpha: 0.8),
//                                   shape: const CircleBorder(),
//                                   child: InkWell(
//                                     borderRadius: BorderRadius.circular(20),
//                                     onTap: () {
//                                       setState(() {
//                                         course['isFavorite'] =
//                                             !course['isFavorite'];
//                                       });
//                                       // You can also call a callback here to update parent state
//                                       print(
//                                         'Favorite toggled for: ${course['title']}',
//                                       );
//                                     },
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Icon(
//                                         course['isFavorite']
//                                             ? Icons.favorite
//                                             : Icons.favorite_border,
//                                         color:
//                                             course['isFavorite']
//                                                 ? Colors.red
//                                                 : Colors.black,
//                                         size: 20,
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                           if (course['tag'] != null)
//                             Positioned(
//                               top: 12,
//                               left: 12,
//                               child: Container(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 8,
//                                   vertical: 4,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: Colors.black.withValues(alpha: 0.7),
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 child: Text(
//                                   course['tag']!,
//                                   style: textTheme.bodySmall?.copyWith(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             course['category']!, // Added category text
//                             style: textTheme.bodySmall?.copyWith(
//                               color:
//                                   primaryColor, // Category text in primary color
//                               fontWeight: FontWeight.bold,
//                             ),
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           const SizedBox(height: 4),
//                           Text(
//                             course['title']!,
//                             style: const TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           const SizedBox(height: 8),
//                           Row(
//                             children: [
//                               const Icon(
//                                 Icons.star,
//                                 color: Colors.amber,
//                                 size: 16,
//                               ),
//                               const SizedBox(width: 4),
//                               Text(
//                                 '${course['rating']} (${course['reviews']} reviews)',
//                                 style: textTheme.bodySmall?.copyWith(
//                                   color: Colors.grey[600],
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 8),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.baseline,
//                             textBaseline: TextBaseline.alphabetic,
//                             children: [
//                               Text(
//                                 course['price']!,
//                                 style: textTheme.titleMedium?.copyWith(
//                                   fontWeight: FontWeight.bold,
//                                   color: primaryColor,
//                                 ),
//                               ),
//                               const SizedBox(width: 8),
//                               Text(
//                                 course['oldPrice']!,
//                                 style: textTheme.bodyMedium?.copyWith(
//                                   color: Colors.grey[500],
//                                   decoration: TextDecoration.lineThrough,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:canwa/Widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:canwa/Widgets/category_chip.dart';

// Main widget that handles navigation between screens
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const NavbarWishlist(),
    const NavbarMyCourse(),
    const NavbarProfileScreen(),
  ];

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
      body: _screens[_selectedIndex],
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
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: textTheme.bodySmall,
      ),
    );
  }
}

// Your existing HomeScreen (modified to remove bottom nav)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<String> _courseCategories = const [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader(
              context,
              'Latest quiz',
              showPagination: true,
              currentPage: 0,
              totalPages: 3,
            ),
            const SizedBox(height: 16),
            _buildLatestQuizCard(context),
            const SizedBox(height: 32),
            _buildSectionHeader(
              context,
              'Course Categories',
              onSeeAllTap: () => {},
            ),
            const SizedBox(height: 16),
            _buildCourseCategoriesList(context),
            const SizedBox(height: 32),
            _buildSectionHeader(
              context,
              'Recommendation',
              onSeeAllTap: () => {},
            ),
            const SizedBox(height: 16),
            _buildRecommendationCourseList(context),
            const SizedBox(height: 20),
          ],
        ),
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
          style: const TextStyle(
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
        color: primaryColor,
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
                'https://picsum.photos/id/401/400/200',
                fit: BoxFit.cover,
                color: Colors.black.withValues(alpha: 0.2),
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
                const Text(
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
                    backgroundColor: Colors.white,
                    foregroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 0,
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
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _courseCategories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CategoryChip(
              name: _courseCategories[index],
              isSelected: false,
              onTap: () {},
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
        'isFavorite': false,
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
        'isFavorite': false,
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
        'isFavorite': false,
      },
    ];

    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Container(
            width: 250,
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
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16.0),
                onTap: () {},
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
                            child: StatefulBuilder(
                              builder: (context, setState) {
                                return Material(
                                  color: Colors.white.withValues(alpha: 0.8),
                                  shape: const CircleBorder(),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(20),
                                    onTap: () {
                                      setState(() {
                                        course['isFavorite'] =
                                            !course['isFavorite'];
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        course['isFavorite']
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color:
                                            course['isFavorite']
                                                ? Colors.red
                                                : Colors.black,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                );
                              },
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
                            course['category']!,
                            style: textTheme.bodySmall?.copyWith(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            course['title']!,
                            style: const TextStyle(
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
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16,
                              ),
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
              ),
            ),
          );
        },
      ),
    );
  }
}

// Profile Screen
class NavbarProfileScreen extends StatelessWidget {
  const NavbarProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios, color: primaryColor, size: 20),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            fontFamily: "Plus Jakarta",
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, color: primaryColor, size: 20),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: primaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/id/300/200/200',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'John Doe',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'john.doe@example.com',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Premium Member',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Stats Cards
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '12',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Courses',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '340',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Hours',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '25',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Certificates',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Menu Items
            _buildMenuItem(
              context,
              Icons.person_outline,
              'Edit Profile',
              () {},
            ),
            _buildMenuItem(
              context,
              Icons.notifications_outlined,
              'Notifications',
              () {},
            ),
            _buildMenuItem(
              context,
              Icons.download_outlined,
              'Downloads',
              () {},
            ),
            _buildMenuItem(
              context,
              Icons.credit_card_outlined,
              'Payment Methods',
              () {},
            ),
            _buildMenuItem(
              context,
              Icons.help_outline,
              'Help & Support',
              () {},
            ),
            _buildMenuItem(
              context,
              Icons.privacy_tip_outlined,
              'Privacy Policy',
              () {},
            ),
            _buildMenuItem(context, Icons.info_outline, 'About', () {}),
            const SizedBox(height: 20),
            _buildMenuItem(
              context,
              Icons.logout,
              'Logout',
              () {},
              isLogout: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap, {
    bool isLogout = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: isLogout ? Colors.red : Colors.grey[700]),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: isLogout ? Colors.red : Colors.black,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey[400],
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class NavbarWishlist extends StatefulWidget {
  const NavbarWishlist({super.key});

  @override
  State<NavbarWishlist> createState() => _NavbarWishlistState();
}

class _NavbarWishlistState extends State<NavbarWishlist> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedCategoryIndex =
      1; // "Science" is selected by default as per image

  final List<Map<String, dynamic>> _categoryChipsWithIcons = [
    {'name': 'Programming', 'icon': Icons.laptop_mac}, // Placeholder icon
    {'name': 'Science', 'icon': Icons.public}, // Placeholder icon
    {'name': 'Design', 'icon': Icons.palette}, // Placeholder icon
    {'name': 'Business', 'icon': Icons.business_center}, // Placeholder icon
    {'name': 'Art', 'icon': Icons.brush}, // Placeholder icon
  ];

  // Modified wishlistCourses to include an isFavorited status for each item
  final List<Map<String, dynamic>> _wishlistCourses = [
    {
      'image': 'https://picsum.photos/id/600/100/80',
      'category': 'Graphic Design',
      'title': 'Expert Wireframing for Mobile Design',
      'rating': 4.9,
      'reviews': 12990,
      'author': 'Jerremy Mamika',
      'price': '\$48',
      'isFavorited': true, // All items start as favorited as per screenshot
    },
    {
      'image': 'https://picsum.photos/id/338/100/80',
      'category': 'Science',
      'title': 'The Complete Solar Energy Course',
      'rating': 4.9,
      'reviews': 12990,
      'author': 'Jerremy Mamika',
      'price': '\$125',
      'isFavorited': true,
    },
    {
      'image': 'https://picsum.photos/id/1015/100/80',
      'category': 'Coding',
      'title': 'How to convert design to React js Brssic',
      'rating': 4.9,
      'reviews': 12990,
      'author': 'Jerremy Mamika',
      'price': '\$34',
      'isFavorited': true,
    },

    {
      'image': 'https://picsum.photos/id/116/100/80',
      'category': 'Coding',
      'title': 'How to convert design to React js Brssic',
      'rating': 4.9,
      'reviews': 12990,
      'author': 'Jerremy Mamika',
      'price': '\$34',
      'isFavorited': true,
    },
    {
      'image': 'https://picsum.photos/id/1043/100/80',
      'category': 'Photography',
      'title': 'Mastering Street Photography',
      'rating': 4.8,
      'reviews': 9870,
      'author': 'Sarah Doe',
      'price': '\$75',
      'isFavorited': true,
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
          ), // Black icon, transparent background
          onPressed: () {
            Navigator.of(context).pop();
          },
          iconSize: 20,
        ),
        title: Text(
          'My Wishlist',
          style: textTheme.titleLarge?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: primaryColor,
              size: 20,
            ), // Black icon, transparent background
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Column(
              children: [
                // Search Bar
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search Something',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        top: 8,
                        bottom: 8,
                      ),
                      child: Icon(Icons.search, color: Colors.grey[600]),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: IconButton(
                        icon: Icon(Icons.close, color: Colors.grey[600]),
                        onPressed: () {
                          _searchController.clear();
                          // Perform search clear logic
                        },
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    filled: true,
                    fillColor: Colors.white, // White background for the input
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0,
                    ),
                  ),
                  onChanged: (value) {
                    // Perform search as user types
                  },
                ),
                const SizedBox(height: 16),

                // Category Chips
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _categoryChipsWithIcons.length,
                    itemBuilder: (context, index) {
                      final chipData = _categoryChipsWithIcons[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: _CategoryChipWithIcon(
                          name: chipData['name']!,
                          icon: chipData['icon']!,
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
              ],
            ),
          ),

          // Wishlist Course List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 8.0,
              ),
              itemCount: _wishlistCourses.length,
              itemBuilder: (context, index) {
                final course = _wishlistCourses[index];
                return _buildWishlistCourseCard(
                  context,
                  course,
                  primaryColor,
                  textTheme,
                  index, // Pass index to uniquely identify the card
                );
              },
              separatorBuilder:
                  (context, index) =>
                      const SizedBox(height: 16), // Spacing between cards
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWishlistCourseCard(
    BuildContext context,
    Map<String, dynamic> course,
    Color primaryColor,
    TextTheme textTheme,
    int index,
  ) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: () {},
        hoverColor: primaryColor.withValues(
          alpha: 0.05,
        ), // subtle hover on web/desktop
        splashColor: primaryColor.withValues(
          alpha: 0.2,
        ), // splash effect on tap
        child: Container(
          height: 120,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0)),
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              // Left Image
              SizedBox(
                width: 120,
                height: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    bottomLeft: Radius.circular(16.0),
                  ),
                  child: Image.network(course['image']!, fit: BoxFit.cover),
                ),
              ),
              // Right Text Area
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category + Heart Icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              course['category']!,
                              style: textTheme.bodySmall?.copyWith(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _wishlistCourses[index]['isFavorited'] =
                                    !_wishlistCourses[index]['isFavorited'];
                              });
                            },
                            child: Icon(
                              _wishlistCourses[index]['isFavorited']
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color:
                                  _wishlistCourses[index]['isFavorited']
                                      ? Colors.red
                                      : Colors.grey[600],
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                      // Title
                      Text(
                        course['title']!,
                        style: textTheme.titleMedium?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // Rating and Reviews
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            '${course['rating']} • (${course['reviews']})',
                            style: textTheme.bodySmall?.copyWith(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      // Author and Price
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              course['author']!,
                              style: textTheme.bodySmall?.copyWith(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            course['price']!,
                            style: textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Reusing and adapting the CategoryChip for icons
class _CategoryChipWithIcon extends StatelessWidget {
  final String name;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryChipWithIcon({
    required this.name,
    required this.icon,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final textTheme = Theme.of(context).textTheme;

    final ButtonStyle style = Theme.of(
      context,
    ).outlinedButtonTheme.style!.copyWith(
      backgroundColor: WidgetStateProperty.resolveWith<Color>((
        Set<WidgetState> states,
      ) {
        if (isSelected) {
          return primaryColor;
        }
        return Colors.white; // White background for unselected
      }),
      foregroundColor: WidgetStateProperty.resolveWith<Color>((
        Set<WidgetState> states,
      ) {
        if (isSelected) {
          return Colors.white;
        }
        return Colors.black; // Black text for unselected
      }),
      side: WidgetStateProperty.resolveWith<BorderSide>((
        Set<WidgetState> states,
      ) {
        if (isSelected) {
          return BorderSide(color: primaryColor, width: 1.5);
        }
        return BorderSide(
          color: Colors.grey[300]!,
          width: 1.5,
        ); // Light grey border for unselected
      }),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      ),
    );

    return OutlinedButton(
      onPressed: onTap,
      style: style,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? Colors.white : Colors.black, size: 18),
          const SizedBox(width: 8),
          Text(
            name,
            style: textTheme.bodyLarge?.copyWith(
              fontSize: 14,
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class NavbarMyCourse extends StatefulWidget {
  const NavbarMyCourse({super.key});

  @override
  State<NavbarMyCourse> createState() => _NavbarMyCourseState();
}

class _NavbarMyCourseState extends State<NavbarMyCourse> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedCategoryIndex =
      1; // "Science" is selected by default as per image

  final List<Map<String, dynamic>> _categoryChipsWithIcons = [
    {'name': 'Programming', 'icon': Icons.laptop_mac}, // Placeholder icon
    {'name': 'Science', 'icon': Icons.public}, // Placeholder icon
    {'name': 'Design', 'icon': Icons.palette}, // Placeholder icon
    {'name': 'Business', 'icon': Icons.business_center}, // Placeholder icon
    {'name': 'Art', 'icon': Icons.brush}, // Placeholder icon
  ];

  final List<Map<String, dynamic>> _myCourses = [
    {
      'image': 'https://picsum.photos/id/1045/100/80',
      'title': 'Complete 3D Animation Using Blender',
      'author': 'Jane Cooper',
      'members': 420,
      'num_courses': 43,
      'status': 'not_started', // or 'completed', 'in_progress'
      'progress': 0.0,
    },
    {
      'image': 'https://picsum.photos/id/237/100/80',
      'title': 'Fitness Training : Basic Workouts & Body Building',
      'author': 'Esther Howard',
      'members': 100,
      'num_courses': 16,
      'status': 'completed',
      'progress': 1.0, // 100%
    },
    {
      'image': 'https://picsum.photos/id/1014/100/80',
      'title': 'Advance Trading : Forex Trading/Stock Trading',
      'author': 'Courtney Henry',
      'members': 221,
      'num_courses': 12,
      'status': 'in_progress',
      'progress': 0.52, // 52%
    },
    {
      'image': 'https://picsum.photos/id/100/100/80',
      'title': 'Introduction to Digital Photography',
      'author': 'Emily White',
      'members': 350,
      'num_courses': 25,
      'status': 'in_progress',
      'progress': 0.70, // 70%
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
            size: 20,
          ), // Black icon, transparent background
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        scrolledUnderElevation: 0,
        title: Text(
          'My Course',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ), // Black icon, transparent background
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Column(
              children: [
                // Search Bar
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search Something',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        top: 8,
                        bottom: 8,
                      ),
                      child: Icon(Icons.search, color: Colors.grey[600]),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: IconButton(
                        icon: Icon(Icons.close, color: Colors.grey[600]),
                        onPressed: () {
                          _searchController.clear();
                          // Perform search clear logic
                        },
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    filled: true,
                    fillColor: Colors.white, // White background for the input
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0,
                    ),
                  ),
                  onChanged: (value) {
                    // Perform search as user types
                  },
                ),
                const SizedBox(height: 16),

                // Category Chips
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _categoryChipsWithIcons.length,
                    itemBuilder: (context, index) {
                      final chipData = _categoryChipsWithIcons[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: _CategoryChipWithIcon(
                          name: chipData['name']!,
                          icon: chipData['icon']!,
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
              ],
            ),
          ),

          // My Course List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 8.0,
              ),
              itemCount: _myCourses.length,
              itemBuilder: (context, index) {
                final course = _myCourses[index];
                return _buildMyCourseCard(
                  context,
                  course,
                  primaryColor,
                  textTheme,
                );
              },
              separatorBuilder:
                  (context, index) =>
                      const SizedBox(height: 16), // Spacing between cards
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMyCourseCard(
    BuildContext context,
    Map<String, dynamic> course,
    Color primaryColor,
    TextTheme textTheme,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              width: 0.5,
              color: Colors.grey.withValues(alpha: 0.5),
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(16.0),
            onTap: () {
              // Handle card tap
              print('Course tapped: ${course['title']}');
              // Add your navigation or action logic here
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          course['image']!,
                          height: 64,
                          width: 64,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                            Row(
                              children: [
                                Icon(
                                  Icons.people_alt,
                                  color: Colors.grey[600],
                                  size: 18,
                                ),
                                const SizedBox(width: 4),
                                // Wrap with Flexible or Expanded to prevent overflow
                                Flexible(
                                  child: Text(
                                    '${course['members']} Members',
                                    style: textTheme.bodySmall?.copyWith(
                                      color: Colors.grey[600],
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Icon(
                                  Icons.play_circle_outline,
                                  color: Colors.grey[600],
                                  size: 18,
                                ),
                                const SizedBox(width: 4),
                                // Wrap with Flexible or Expanded to prevent overflow
                                Flexible(
                                  child: Text(
                                    '${course['num_courses']} Courses',
                                    style: textTheme.bodySmall?.copyWith(
                                      color: Colors.grey[600],
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            if (course['status'] == 'not_started')
                              Align(
                                alignment: Alignment.centerLeft,
                                child: TextButton(
                                  onPressed: () {
                                    // Handle start course button tap
                                    print(
                                      'Start course tapped: ${course['title']}',
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: Size.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: Text(
                                    'Start Course',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            else if (course['status'] == 'completed')
                              Row(
                                children: [
                                  Text(
                                    'Complete',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  // Explicitly constrain width if overflow still occurs, or ensure enough space
                                  Text(
                                    '${(course['progress'] * 100).toInt()}%',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    // Removed softWrap: false and overflow: TextOverflow.visible, let Expanded handle it
                                  ),
                                ],
                              ),
                            if (course['status'] == 'in_progress')
                              Row(
                                children: [
                                  Text(
                                    'Course is in progress',
                                    style: textTheme.bodySmall?.copyWith(
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '${(course['progress'] * 100).toInt()}%',
                                    style: textTheme.bodySmall?.copyWith(
                                      color: Colors.grey[600],
                                    ),
                                    // Removed softWrap: false and overflow: TextOverflow.visible
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Progress Indicator (replacing the slider)
                  if (course['status'] == 'in_progress' ||
                      course['status'] == 'completed')
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: LinearProgressIndicator(
                        value: course['progress'],
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                        minHeight: 6.0,
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
