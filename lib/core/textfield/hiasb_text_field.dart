import 'package:flutter/material.dart';

import '../../../../../core/constant/color_const.dart';
import '../constant/app_spacing.dart';

class HiasbTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? title;
  final String hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final ValueChanged<String>? onChange;

  const HiasbTextField({
    super.key,
    required this.controller,
    this.title,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    required this.obscureText,
    this.onChange,
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
        TextField(
          controller: controller,
          obscureText: obscureText,
          onChanged: onChange,
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
