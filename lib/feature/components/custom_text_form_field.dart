import 'package:flutter/material.dart';
import 'package:grow_mood/theme/base_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String title;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const CustomTextFormField({
    super.key,
    required this.title,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
          ),
          const SizedBox(
            height: 6,
          ),
          TextFormField(
            cursorColor: BaseColors.primary,
            obscureText: widget.obscureText && _isObscured,
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: widget.hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  8,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  8,
                ),
                borderSide: const BorderSide(
                  color: BaseColors.primary,
                ),
              ),
              suffixIcon: widget.obscureText
                  ? IconButton(
                      splashColor: Colors.transparent,
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                      icon: Icon(
                        _isObscured ? Icons.visibility_off : Icons.visibility,
                      ),
                    )
                  : const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
