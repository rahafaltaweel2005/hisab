import 'package:flutter/material.dart';

import '../../../../../core/constant/color_const.dart';

class HiasbTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? title;
  final String hint;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final ValueChanged<String>? onChange;

  const HiasbTextField({
    super.key,
    required this.controller,
    this.title,
    required this.hint,
    required this.prefixIcon,
    this.suffixIcon,
    required this.obscureText,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: ColorConst.textDark,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 12),
        ],

        TextField(
          controller: controller,
          obscureText: obscureText,
          onChanged: onChange,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: ColorConst.textDark,
          ),
          decoration: InputDecoration(
            hintText: hint,

            hintStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: ColorConst.neutral.withValues(alpha: 0.55),
            ),

            prefixIcon: prefixIcon,

            suffixIcon: suffixIcon,

            filled: true,
            fillColor: Color(0xCBE4E9F4),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: ColorConst.border, width: 1),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: ColorConst.primary,
                width: 1.5,
              ),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: ColorConst.error, width: 1.2),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: ColorConst.error, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
