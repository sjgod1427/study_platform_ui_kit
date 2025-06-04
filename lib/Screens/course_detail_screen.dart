import 'package:flutter/material.dart';

// Course Progress Model
class CourseProgress {
  final int totalLessons;
  final int completedLessons;
  final List<bool> lessonCompletionStatus;

  CourseProgress({
    required this.totalLessons,
    required this.completedLessons,
    required this.lessonCompletionStatus,
  });

  double get progressPercentage => completedLessons / totalLessons;
  int get progressPoints => (progressPercentage * 100).round();

  // Check if milestone is achieved
  bool isMilestoneAchieved(double milestone) => progressPercentage >= milestone;
}

// Updated CourseDetailScreen with functional progress
class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  int _selectedContentIndex = 0;
  bool _isPlaying = false;

  // Course progress state
  late CourseProgress _courseProgress;

  @override
  void initState() {
    super.initState();
    // Initialize with sample course data - 20 lessons, 5 completed
    _courseProgress = CourseProgress(
      totalLessons: 20,
      completedLessons: 5,
      lessonCompletionStatus: List.generate(
        20,
        (index) => index < 5,
      ), // First 5 lessons completed
    );
  }

  // Method to mark a lesson as complete
  void _markLessonComplete(int lessonIndex) {
    if (lessonIndex < _courseProgress.lessonCompletionStatus.length &&
        !_courseProgress.lessonCompletionStatus[lessonIndex]) {
      setState(() {
        _courseProgress.lessonCompletionStatus[lessonIndex] = true;
        _courseProgress = CourseProgress(
          totalLessons: _courseProgress.totalLessons,
          completedLessons:
              _courseProgress.lessonCompletionStatus
                  .where((completed) => completed)
                  .length,
          lessonCompletionStatus: _courseProgress.lessonCompletionStatus,
        );
      });
    }
  }

  // Method to simulate course progress (for demo purposes)
  void _simulateProgress() {
    final nextIncompleteLesson = _courseProgress.lessonCompletionStatus
        .indexWhere((completed) => !completed);
    if (nextIncompleteLesson != -1) {
      _markLessonComplete(nextIncompleteLesson);
    }
  }

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
              'https://picsum.photos/id/1062/600/400',
              fit: BoxFit.cover,
            ),
          ),

          // Play/Pause Button
          Positioned(
            top: MediaQuery.of(context).padding.top + 80,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
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

                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              actions: [
                Container(
                  margin: const EdgeInsets.all(8),

                  child: IconButton(
                    icon: const Icon(Icons.more_horiz, color: Colors.white),
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
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30.0),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Course Info Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'English Beginner Level',
                            style: textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Learn essential English skills, including grammar, vocabulary, and practical conversation basics.',
                            style: textTheme.bodyLarge?.copyWith(
                              color: Colors.grey[700],
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Custom Tab Chips
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        children: [
                          _CourseDetailChip(
                            label: 'Overview',
                            isSelected: _selectedContentIndex == 0,
                            onTap:
                                () => setState(() => _selectedContentIndex = 0),
                          ),
                          const SizedBox(width: 12),
                          _CourseDetailChip(
                            label: 'Course',
                            isSelected: _selectedContentIndex == 1,
                            onTap:
                                () => setState(() => _selectedContentIndex = 1),
                          ),
                          const SizedBox(width: 12),
                          _CourseDetailChip(
                            label: 'Achievements',
                            isSelected: _selectedContentIndex == 2,
                            onTap:
                                () => setState(() => _selectedContentIndex = 2),
                          ),
                          const SizedBox(width: 12),
                          _CourseDetailChip(
                            label: 'Resources',
                            isSelected: _selectedContentIndex == 3,
                            onTap:
                                () => setState(() => _selectedContentIndex = 3),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Content based on selected tab
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildContentBasedOnTab(
                            context,
                            primaryColor,
                            textTheme,
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentBasedOnTab(
    BuildContext context,
    Color primaryColor,
    TextTheme textTheme,
  ) {
    switch (_selectedContentIndex) {
      case 0: // Overview tab
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Functional Course Progress Section
            Text(
              'Course Progress',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            _FunctionalCourseProgressBar(
              courseProgress: _courseProgress,
              primaryColor: primaryColor,
              textTheme: textTheme,
            ),

            // Demo button to simulate progress
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton.icon(
                onPressed:
                    _courseProgress.completedLessons <
                            _courseProgress.totalLessons
                        ? _simulateProgress
                        : null,
                icon: const Icon(Icons.play_lesson),
                label: Text(
                  _courseProgress.completedLessons <
                          _courseProgress.totalLessons
                      ? 'Complete Next Lesson'
                      : 'Course Completed!',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Course Overview Section
            Text(
              'Course Overview',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Master essential English skills through engaging lessons on grammar, vocabulary, and everyday conversations. Build confidence with interactive exercises, listening practice, and speaking drills tailored for beginners.',
              style: textTheme.bodyLarge?.copyWith(
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),

            // Mentors Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Mentors',
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See All',
                    style: textTheme.bodyLarge?.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildMentorsList(context, textTheme),
          ],
        );
      case 1: // Course tab
        return _buildCourseList(context, primaryColor, textTheme);
      case 2: // Achievements tab
        return _buildAchievements(context, primaryColor, textTheme);
      case 3: // Resources tab
        return _buildResources(context, textTheme);
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildCourseList(
    BuildContext context,
    Color primaryColor,
    TextTheme textTheme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Course Lessons',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _courseProgress.totalLessons,
          itemBuilder: (context, index) {
            final isCompleted = _courseProgress.lessonCompletionStatus[index];
            final isNext =
                !isCompleted &&
                (index == 0 ||
                    _courseProgress.lessonCompletionStatus[index - 1]);

            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                tileColor: Colors.white,
                leading: CircleAvatar(
                  backgroundColor:
                      isCompleted
                          ? primaryColor
                          : isNext
                          ? primaryColor.withOpacity(0.2)
                          : Colors.grey[300],
                  child:
                      isCompleted
                          ? const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 18,
                          )
                          : Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: isNext ? primaryColor : Colors.grey[600],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                ),
                title: Text(
                  'Lesson ${index + 1}: ${_getLessonTitle(index)}',
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight:
                        isCompleted ? FontWeight.bold : FontWeight.normal,
                    color: isCompleted ? Colors.black : Colors.grey[700],
                  ),
                ),
                subtitle: Text(
                  isCompleted
                      ? 'Completed'
                      : isNext
                      ? 'Ready to start'
                      : 'Locked',
                  style: textTheme.bodySmall?.copyWith(
                    color:
                        isCompleted
                            ? primaryColor
                            : isNext
                            ? Colors.orange
                            : Colors.grey[500],
                  ),
                ),
                trailing:
                    isNext
                        ? IconButton(
                          icon: Icon(
                            Icons.play_circle_fill,
                            color: primaryColor,
                          ),
                          onPressed: () => _markLessonComplete(index),
                        )
                        : null,
                onTap: isNext ? () => _markLessonComplete(index) : null,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildAchievements(
    BuildContext context,
    Color primaryColor,
    TextTheme textTheme,
  ) {
    final achievements = [
      {
        'title': 'First Steps',
        'description': 'Complete your first lesson',
        'achieved': _courseProgress.completedLessons >= 1,
      },
      {
        'title': 'Getting Started',
        'description': 'Complete 5 lessons',
        'achieved': _courseProgress.completedLessons >= 5,
      },
      {
        'title': 'Quarter Way',
        'description': 'Complete 25% of the course',
        'achieved': _courseProgress.progressPercentage >= 0.25,
      },
      {
        'title': 'Halfway Hero',
        'description': 'Complete 50% of the course',
        'achieved': _courseProgress.progressPercentage >= 0.50,
      },
      {
        'title': 'Almost There',
        'description': 'Complete 75% of the course',
        'achieved': _courseProgress.progressPercentage >= 0.75,
      },
      {
        'title': 'Course Master',
        'description': 'Complete the entire course',
        'achieved': _courseProgress.progressPercentage >= 1.0,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Course Achievements',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        ...achievements.map(
          (achievement) => Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color:
                    achievement['achieved'] as bool
                        ? primaryColor.withOpacity(0.3)
                        : Colors.grey[300]!,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  achievement['achieved'] as bool
                      ? Icons.emoji_events
                      : Icons.emoji_events_outlined,
                  color:
                      achievement['achieved'] as bool
                          ? primaryColor
                          : Colors.grey[400],
                  size: 32,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        achievement['title'] as String,
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color:
                              achievement['achieved'] as bool
                                  ? Colors.black
                                  : Colors.grey[600],
                        ),
                      ),
                      Text(
                        achievement['description'] as String,
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                if (achievement['achieved'] as bool)
                  Icon(Icons.check_circle, color: primaryColor),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResources(BuildContext context, TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Course Resources',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Access supplementary materials, downloadable PDFs, links to external tools, and other helpful resources for this course.',
          style: textTheme.bodyLarge?.copyWith(
            color: Colors.grey[700],
            height: 1.5,
          ),
        ),
      ],
    );
  }

  String _getLessonTitle(int index) {
    final lessons = [
      'Basic Greetings',
      'Introducing Yourself',
      'Common Phrases',
      'Numbers & Time',
      'Family & Friends',
      'Daily Activities',
      'Food & Drinks',
      'Shopping Basics',
      'Directions',
      'Weather Talk',
      'Hobbies',
      'Past Tense',
      'Future Plans',
      'Comparisons',
      'Asking Questions',
      'Phone Conversations',
      'Email Writing',
      'Job Interview',
      'Travel English',
      'Final Review',
    ];
    return lessons[index % lessons.length];
  }

  Widget _buildMentorsList(BuildContext context, TextTheme textTheme) {
    final List<Map<String, String>> mentors = [
      {'name': 'Ximia Ed', 'image': 'https://picsum.photos/id/1004/200/200'},
      {'name': 'Lee Youna', 'image': 'https://picsum.photos/id/1011/200/200'},
      {'name': 'Joshua K', 'image': 'https://picsum.photos/id/1005/200/200'},
      {'name': 'Jesselyn', 'image': 'https://picsum.photos/id/1009/200/200'},
      {'name': 'Kevin', 'image': 'https://picsum.photos/id/1027/200/200'},
    ];

    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mentors.length,
        itemBuilder: (context, index) {
          final mentor = mentors[index];
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundImage: NetworkImage(mentor['image']!),
                ),
                const SizedBox(height: 8),
                Text(
                  mentor['name']!,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Functional Course Progress Bar Widget
class _FunctionalCourseProgressBar extends StatelessWidget {
  final CourseProgress courseProgress;
  final Color primaryColor;
  final TextTheme textTheme;

  const _FunctionalCourseProgressBar({
    required this.courseProgress,
    required this.primaryColor,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with progress info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Course Progress',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                '${courseProgress.progressPoints}%',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '${courseProgress.completedLessons} of ${courseProgress.totalLessons} lessons completed',
            style: textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(height: 24),

          // Progress bar with milestones
          LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                height: 80,
                child: Stack(
                  children: [
                    // Base progress bar
                    Positioned(
                      top: 20,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),

                    // Filled progress bar
                    Positioned(
                      top: 20,
                      left: 0,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeInOut,
                        height: 8,
                        width:
                            constraints.maxWidth *
                            courseProgress.progressPercentage,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),

                    // Milestone points
                    _buildProgressPoint(
                      constraints.maxWidth,
                      0.25,
                      '25\nPoints',
                      courseProgress.isMilestoneAchieved(0.25),
                    ),
                    _buildProgressPoint(
                      constraints.maxWidth,
                      0.50,
                      '50\nPoints',
                      courseProgress.isMilestoneAchieved(0.50),
                    ),
                    _buildProgressPoint(
                      constraints.maxWidth,
                      0.75,
                      '75\nPoints',
                      courseProgress.isMilestoneAchieved(0.75),
                    ),
                    _buildProgressPoint(
                      constraints.maxWidth,
                      1.0,
                      '100\nPoints',
                      courseProgress.isMilestoneAchieved(1.0),
                    ),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 16),

          // Dynamic motivational message
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: primaryColor.withOpacity(0.1),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(_getMotivationIcon(), color: primaryColor, size: 24),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _getMotivationMessage(),
                    style: textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[700],
                      height: 1.4,
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

  Widget _buildProgressPoint(
    double maxWidth,
    double positionFactor,
    String label,
    bool isAchieved,
  ) {
    const double pointAreaWidth = 60.0;
    const double circleDiameter = 20.0;

    final double leftPosition =
        (positionFactor * maxWidth) - (pointAreaWidth / 2);
    final double clampedLeft = leftPosition.clamp(
      0.0,
      maxWidth - pointAreaWidth,
    );

    return Positioned(
      left: clampedLeft,
      top: 12,
      child: SizedBox(
        width: pointAreaWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              width: circleDiameter,
              height: circleDiameter,
              decoration: BoxDecoration(
                color: isAchieved ? primaryColor : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isAchieved ? primaryColor : Colors.grey[400]!,
                  width: 2.5,
                ),
                boxShadow:
                    isAchieved
                        ? [
                          BoxShadow(
                            color: primaryColor.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          ),
                        ]
                        : null,
              ),
              child:
                  isAchieved
                      ? const Icon(Icons.check, color: Colors.white, size: 12)
                      : null,
            ),
            const SizedBox(height: 6),
            Text(
              label,
              textAlign: TextAlign.center,
              style: textTheme.bodySmall?.copyWith(
                color: isAchieved ? primaryColor : Colors.grey[600],
                fontWeight: isAchieved ? FontWeight.bold : FontWeight.normal,
                fontSize: 10,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getMotivationIcon() {
    if (courseProgress.progressPercentage >= 1.0) return Icons.celebration;
    if (courseProgress.progressPercentage >= 0.75) return Icons.star;
    if (courseProgress.progressPercentage >= 0.5) return Icons.trending_up;
    if (courseProgress.progressPercentage >= 0.25)
      return Icons.lightbulb_outline;
    return Icons.play_circle_outline;
  }

  String _getMotivationMessage() {
    if (courseProgress.progressPercentage >= 1.0) {
      return 'Congratulations! 🎉 You\'ve completed the entire course. You\'re now ready for the next level!';
    } else if (courseProgress.progressPercentage >= 0.75) {
      return 'Outstanding progress! 🌟 You\'re almost at the finish line. Keep pushing forward!';
    } else if (courseProgress.progressPercentage >= 0.5) {
      return 'Great job! 📈 You\'re halfway through. Your consistency is paying off!';
    } else if (courseProgress.progressPercentage >= 0.25) {
      return 'Awesome progress! 💡 You\'re one step closer to mastering English—keep up the great work!';
    } else {
      return 'Welcome to your English journey! ▶️ Every expert was once a beginner. Let\'s get started!';
    }
  }
}

// Course Detail Chip Widget (unchanged)
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

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(25.0),
          border: Border.all(
            color: isSelected ? primaryColor : Colors.grey[300]!,
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: textTheme.bodyLarge?.copyWith(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
