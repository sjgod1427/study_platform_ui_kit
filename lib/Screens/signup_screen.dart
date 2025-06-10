import 'package:canwa/Widgets/auth_fields.dart';
import 'package:canwa/Widgets/primary_text_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // For social icons

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _agreeToTerms = false;
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading:
            false, // No back button needed for a signup screen
        scrolledUnderElevation: 0,
        title: Row(
          children: [
            Icon(
              Icons.book,
              color: primaryColor,
              size: 16,
            ), // SkillUp logo icon
            const SizedBox(width: 8),
            Text(
              'SkillUp',
              style: textTheme.titleLarge?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign up for an account',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Creating an account can make you learn and grow quickly.',
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            const SizedBox(height: 24),
            Text(
              'Full Name',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            BasicTextField(type: BasicTextFieldType.fullName),
            const SizedBox(height: 20),
            Text(
              'Email',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            BasicTextField(type: BasicTextFieldType.email),
            const SizedBox(height: 20),
            Text(
              'Password',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            BasicTextField(type: BasicTextFieldType.password),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: _agreeToTerms,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _agreeToTerms = newValue ?? false;
                    });
                  },
                  activeColor: primaryColor,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _agreeToTerms = !_agreeToTerms;
                      });
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'I agree to the Skillup ',
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'Terms of Service',
                            style: textTheme.bodyMedium?.copyWith(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ' and ',
                            style: textTheme.bodyMedium?.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: textTheme.bodyMedium?.copyWith(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            PrimaryTextButton(text: "Sign Up"),
            const SizedBox(height: 24),
            Center(
              child: Text(
                'or',
                style: textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // Handle Google Sign Up
                    },
                    icon: Image.network(
                      'https://img.icons8.com/?size=100&id=17949&format=png',
                      height: 20,
                    ),

                    label: Text(
                      'Google',
                      style: textTheme.titleMedium?.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      side: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // Handle Facebook Sign Up
                    },
                    icon: Icon(FontAwesomeIcons.apple, color: Colors.black),
                    label: Text(
                      'Apple',
                      style: textTheme.titleMedium?.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      side: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: textTheme.bodyLarge?.copyWith(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Login',
                      style: textTheme.bodyLarge?.copyWith(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
