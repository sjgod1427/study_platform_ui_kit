import 'package:flutter/material.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  int _selectedContentIndex = 0; // 0: About, 1: Lessons, 2: Mentor, 3: Reviews
  bool _isPlaying = false; // State for play/pause button

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.35,
            child: Image.network(
              'https://picsum.photos/id/600/600/400',
              fit: BoxFit.cover,
            ),
          ),

          // Play/Pause Button - Fixed positioning
          Positioned(
            top: 80, // Center vertically in the image area
            left: 170, // Center horizontally
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.9),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  color: primaryColor,
                  size: 36,
                ),
                onPressed: () {
                  setState(() {
                    _isPlaying = !_isPlaying;
                  });
                },
              ),
            ),
          ),

          // Custom App Bar Overlay
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              title: Text(
                'Detail',
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              actions: [
                Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.3),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.more_vert, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),

          // Content Section
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.35 - 30,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 24.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Course Info Section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Graphic Design',
                                style: textTheme.bodyMedium?.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '4.9 • (12,990)',
                                    style: textTheme.bodySmall?.copyWith(
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.red[400],
                                    size: 20,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Expert Wireframing for Mobile Design',
                            style: textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.person_outline,
                                color: Colors.grey[600],
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '1,721 enrolled',
                                style: textTheme.bodyMedium?.copyWith(
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(width: 16),
                              Icon(
                                Icons.schedule,
                                color: Colors.grey[600],
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '72 hours',
                                style: textTheme.bodyMedium?.copyWith(
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),

                          // Mentor Info Section
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 24,
                                backgroundImage: NetworkImage(
                                  'https://picsum.photos/id/1005/200/200',
                                ),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Janny Andrea',
                                    style: textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'Best Mentor OnLearning',
                                    style: textTheme.bodySmall?.copyWith(
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: primaryColor,
                                  side: BorderSide(color: primaryColor),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                ),
                                child: Text(
                                  'View Profile',
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),

                          // Custom Tab Chips
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _CourseDetailChip(
                                label: 'About',
                                isSelected: _selectedContentIndex == 0,
                                onTap: () {
                                  setState(() {
                                    _selectedContentIndex = 0;
                                  });
                                },
                              ),
                              _CourseDetailChip(
                                label: 'Lessons',
                                isSelected: _selectedContentIndex == 1,
                                onTap: () {
                                  setState(() {
                                    _selectedContentIndex = 1;
                                  });
                                },
                              ),
                              _CourseDetailChip(
                                label: 'Mentor',
                                isSelected: _selectedContentIndex == 2,
                                onTap: () {
                                  setState(() {
                                    _selectedContentIndex = 2;
                                  });
                                },
                              ),
                              _CourseDetailChip(
                                label: 'Reviews',
                                isSelected: _selectedContentIndex == 3,
                                onTap: () {
                                  setState(() {
                                    _selectedContentIndex = 3;
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),

                          // Content Area
                          Text(
                            _getContentTitle(),
                            style: textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            _getContentDescription(),
                            style: textTheme.bodyLarge?.copyWith(
                              color: Colors.grey[700],
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Bottom Bar
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 16.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.1),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: const Offset(0, -5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Price (tax excluded)',
                              style: textTheme.bodySmall?.copyWith(
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '\$499',
                              style: textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            child: Text(
                              'Buy Course',
                              style: textTheme.titleMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getContentTitle() {
    switch (_selectedContentIndex) {
      case 0:
        return 'About Course';
      case 1:
        return 'Course Lessons';
      case 2:
        return 'About Mentor';
      case 3:
        return 'Student Reviews';
      default:
        return 'About Course';
    }
  }

  String _getContentDescription() {
    switch (_selectedContentIndex) {
      case 0:
        return 'Embark on a fascinating journey into the realm of optics with our comprehensive course that delves into both wave and geometric optics. This program is designed to provide a deep understanding of light phenomena, from reflection and refraction to diffraction and interference. Through interactive lessons, practical experiments, and real-world applications, you will develop a strong foundation in optical principles. Whether you are a student, an aspiring physicist, or simply curious about the science of light, this course offers a captivating exploration of the fundamental concepts that govern our visual world.';
      case 1:
        return 'This section will list all the lessons included in the course. Each lesson will have a title, duration, and potentially a progress indicator. You can click on a lesson to start or resume.';
      case 2:
        return 'Learn more about Janny Andrea, an industry expert with years of experience in Graphic Design and Mobile UI/UX. Janny is passionate about teaching and has helped thousands of students achieve their design goals.';
      case 3:
        return 'Read what other students are saying about this course. Get insights into their learning experience, course quality, and instructor effectiveness. Reviews help you make an informed decision.';
      default:
        return 'Embark on a fascinating journey into the realm of optics with our comprehensive course that delves into both wave and geometric optics. This program is designed to provide a deep understanding of light phenomena, from reflection and refraction to diffraction and interference. Through interactive lessons, practical experiments, and real-world applications, you will develop a strong foundation in optical principles. Whether you are a student, an aspiring physicist, or simply curious about the science of light, this course offers a captivating exploration of the fundamental concepts that govern our visual world.';
    }
  }
}

// Custom chip for CourseDetailScreen
class _CourseDetailChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _CourseDetailChip({
    required this.label,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
          decoration: BoxDecoration(
            color: isSelected ? primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(25.0),
            border: Border.all(
              color:
                  isSelected
                      ? primaryColor
                      : primaryColor.withValues(alpha: 0.5),
              width: 1.5,
            ),
          ),
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodySmall?.copyWith(
              color: isSelected ? Colors.white : primaryColor,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
