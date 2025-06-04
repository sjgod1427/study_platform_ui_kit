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
        title: Row(
          children: [
            Icon(Icons.book, color: primaryColor), // SkillUp logo icon
            const SizedBox(width: 8),
            Text(
              'SkillUp',
              style: textTheme.titleLarge?.copyWith(
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
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Creating an account can make you learn and grow quickly.',
              style: textTheme.bodyLarge?.copyWith(color: Colors.grey[700]),
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
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your full name',
                prefixIcon: Icon(Icons.person_outline, color: Colors.grey[600]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide:
                      BorderSide.none, // No border for the input field itself
                ),
                filled: true,
                fillColor: Colors.grey[100], // Light grey background
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 16.0,
                ),
              ),
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 20),
            Text(
              'Email',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.mail_outline, color: Colors.grey[600]),
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
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            Text(
              'Password',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                hintText: 'Enter your password',
                prefixIcon: Icon(Icons.lock_outline, color: Colors.grey[600]),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey[600],
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
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
              keyboardType: TextInputType.visiblePassword,
            ),
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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle Sign Up logic
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Text(
                  'Sign Up',
                  style: textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                'or',
                style: textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // Handle Google Sign Up
                    },
                    icon: Icon(FontAwesomeIcons.google, color: Colors.black),
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
                    icon: Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.blue[800],
                    ),
                    label: Text(
                      'Facebook',
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
