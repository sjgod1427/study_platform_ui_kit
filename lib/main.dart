import 'package:canwa/Screens/add_question_screen.dart';
import 'package:canwa/Screens/continue_learning_screen.dart';
import 'package:canwa/Screens/course_reminders_screen.dart'; // Import the new screen
import 'package:canwa/Screens/create_new_password_screen.dart';
import 'package:canwa/Screens/edit_profile_screen.dart';
import 'package:canwa/Screens/faq_screen.dart';
import 'package:canwa/Screens/forgot_password_screen.dart';
import 'package:canwa/Screens/home_screen.dart';
import 'package:canwa/Screens/home_screen_2.dart';
import 'package:canwa/Screens/language_screen.dart';
import 'package:canwa/Screens/learning_interests_screen.dart';
import 'package:canwa/Screens/learning_screen.dart';
import 'package:canwa/Screens/login_screen.dart';
import 'package:canwa/Screens/my_course_screen.dart';
import 'package:canwa/Screens/notification_screen.dart';
import 'package:canwa/Screens/onboarding_screen.dart';
import 'package:canwa/Screens/profile_mentor_screen.dart';
import 'package:canwa/Screens/profile_screen.dart';
import 'package:canwa/Screens/recommendation_screen.dart';
import 'package:canwa/Screens/replay_question_screen.dart';
import 'package:canwa/Screens/review_screen.dart';
import 'package:canwa/Screens/search_screen.dart';
import 'package:canwa/Screens/signup_screen.dart';
import 'package:canwa/Screens/verification_code_screen.dart';
import 'package:canwa/Screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:pixel_preview/pixel_preview.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF7356FF); // User's chosen primary color

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SkillUp Home', // Updated title
      theme: ThemeData(
        primaryColor: primaryColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          brightness: ThemeData.light().brightness,
          onPrimary: Colors.white,
          surface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Color(0xFF000000),
          ), // Set icon color to black
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: primaryColor),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor:
                Colors
                    .black, // Changed to black for social buttons as per image
            side: BorderSide(color: Colors.grey[300]!), // Light grey border
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
          ),
        ),
        textTheme:
            GoogleFonts.plusJakartaSansTextTheme(), // Apply user's text theme
      ),
      home: const PixelPreview(
        presets: ScreenPresets(),
        child: FaqScreen(), // Point to the new CourseRemindersScreen
      ),
    );
  }
}
