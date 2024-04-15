import 'dart:ui';

import 'package:dot_marketplace/core/domain/intl/generated/l10n.dart';
import 'package:dot_marketplace/feature/sidebar/presentation/sidebar_widget_vm.dart';
import 'package:dot_marketplace/theme/app_light_colors.dart';
import 'package:flutter/material.dart';

class SideBarWidget extends StatelessWidget {
  const SideBarWidget({super.key, required this.vm});
  final SidebarWidgetViewModel vm;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 12, right: 16, left: 24, top: 28),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/image/sidebar_logo.png'),
                  const SizedBox(width: 8.5),
                  const Text(
                    'купи - и точка',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: AppLightColors.onPrimaryFixedVariant,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () => vm.onSettingsTap(context),
              icon: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.settings,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      S.of(context).settings,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'О приложении',
                    style: Theme.of(context).textTheme.labelLarge,
                  )
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  const Icon(
                    Icons.exit_to_app_sharp,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Выйти',
                    style: Theme.of(context).textTheme.labelLarge,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
