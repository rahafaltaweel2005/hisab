import 'package:flutter/material.dart';

import '../constant/app_spacing.dart';

class HisabTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? title;
  final String hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final ValueChanged<String>? onChange;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const HisabTextField({
    super.key,
    required this.controller,
    this.title,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    required this.obscureText,
    this.onChange,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(title!, style: theme.textTheme.titleSmall),
          const SizedBox(height: AppSpacing.xs),
        ],
        TextFormField(
          controller: controller,
          obscureText: obscureText,
           onChanged: onChange,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,

          ),
        ),
      ],
    );
  }
}
