import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView(
              controller: _pageController,
              children: const [
                OnboardingPage(
                  imagePath: 'https://picsum.photos/400/600',
                  title: 'Transform your skills, transform your future',
                  description:
                      'Learn easily with SkillUp, you can access many course and mentors',
                ),
                // Add more pages if needed for a multi-page onboarding
                OnboardingPage(
                  imagePath: 'https://picsum.photos/400/601',
                  title: 'Learn from the best, anywhere, anytime',
                  description:
                      'Access a wide range of courses taught by industry experts.',
                ),
                OnboardingPage(
                  imagePath: 'https://picsum.photos/400/602',
                  title: 'Connect with mentors and build your network',
                  description:
                      'Engage with a supportive community and accelerate your learning.',
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 20.0,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                    3, // Number of onboarding pages
                    (index) => buildDot(index, context),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Transform your skills,\ntransform your future',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Learn easily with SkillUp, you can access many course and mentors',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.grey[700]),
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentPage < 2) {
                        // Assuming 3 pages
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      } else {
                        // Navigate to next screen after onboarding
                        // For now, we'll just print a message
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text(
                      _currentPage < 2 ? 'Continue' : 'Get Started',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20), // For bottom safe area
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 8,
      width: _currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        color:
            _currentPage == index
                ? Theme.of(context).primaryColor
                : Theme.of(context).primaryColor.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.network(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
      ],
    );
  }
}
