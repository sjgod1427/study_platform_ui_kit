import 'package:canwa/Screens/continue_learning_screen.dart';
import 'package:canwa/Screens/course_reminders_screen.dart'; // Import the new screen
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
        child:
            ContinueLearningScreen(), // Point to the new CourseRemindersScreen
      ),
    );
  }
}
