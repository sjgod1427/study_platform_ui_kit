import 'package:flutter/material.dart';

enum BasicTextFieldType { email, password, fullName }

class BasicTextField extends StatefulWidget {
  final BasicTextFieldType type;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? hintText;

  const BasicTextField({
    Key? key,
    required this.type,
    this.controller,
    this.onChanged,
    this.hintText,
  }) : super(key: key);

  @override
  State<BasicTextField> createState() => _BasicTextFieldState();
}

class _BasicTextFieldState extends State<BasicTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    IconData prefixIcon;
    TextInputType keyboardType;
    bool obscureText = false;

    switch (widget.type) {
      case BasicTextFieldType.email:
        prefixIcon = Icons.mail_outline;
        keyboardType = TextInputType.emailAddress;
        break;
      case BasicTextFieldType.password:
        prefixIcon = Icons.lock_outline;
        keyboardType = TextInputType.visiblePassword;
        obscureText = !_isPasswordVisible;
        break;
      case BasicTextFieldType.fullName:
        prefixIcon = Icons.person_outline;
        keyboardType = TextInputType.name;
        break;
    }

    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText ?? _getDefaultHintText(),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 20, right: 8),
          child: Icon(prefixIcon, color: Colors.grey[600]),
        ),
        suffixIcon:
            widget.type == BasicTextFieldType.password
                ? Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
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
                )
                : null,
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
    );
  }

  String _getDefaultHintText() {
    switch (widget.type) {
      case BasicTextFieldType.email:
        return 'Enter your email';
      case BasicTextFieldType.password:
        return 'Enter your password';
      case BasicTextFieldType.fullName:
        return 'Enter your full name';
    }
  }
}
