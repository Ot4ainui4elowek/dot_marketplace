import 'package:dot_marketplace/core/presentation/UI/text_fields/controllers/app_text_editing_controller.dart';
import 'package:dot_marketplace/theme/app_light_colors.dart';
import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

class AppTextField extends StatelessWidget {
  final String labelText;
  final AppTextEditingController controller;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final bool obscureText;

  const AppTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Obs(
        rvList: [controller.errorText],
        builder: (context) {
          return TextField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppLightColors.onSurfaceVariant,
                  ),
              floatingLabelStyle:
                  Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppLightColors.primary,
                      ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              prefixIconColor: AppLightColors.outline,
              suffixIconColor: AppLightColors.outline,
              errorText: controller.errorText(),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppLightColors.outline,
                ),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
          );
        });
  }
}
