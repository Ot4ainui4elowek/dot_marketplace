import 'package:dot_marketplace/theme/app_light_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends AppBar {
  @override
  final Widget? title;
  @override
  final List<Widget> actions;

  @override
  final Widget? leading;

  @override
  final PreferredSizeWidget? bottom;

  CustomAppBar({
    super.key,
    required BuildContext context,
    this.title,
    this.actions = const [],
    this.leading,
    this.bottom,
  }) : super(
          title: title,
          bottom: bottom,
          leadingWidth: leading != null
              ? null
              : context.canPop()
                  ? null
                  : 0,
          leading: leading ??
              (context.canPop()
                  ? IconButton(
                      onPressed: context.pop,
                      icon: const Icon(Icons.arrow_back_outlined))
                  : const SizedBox.shrink()),
          titleTextStyle: Theme.of(context).textTheme.titleLarge,
          actions: actions,
          iconTheme: const IconThemeData(
            color: AppLightColors.outline,
          ),
        );
}
