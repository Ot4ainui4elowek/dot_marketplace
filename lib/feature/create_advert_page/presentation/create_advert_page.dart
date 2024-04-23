import 'package:dot_marketplace/core/presentation/UI/app_bar/app_bar.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/controllers/app_text_editing_controller.dart';
import 'package:flutter/material.dart';

class CreateAdvertPage extends StatefulWidget {
  const CreateAdvertPage({super.key});

  @override
  State<CreateAdvertPage> createState() => _CreateAdvertPageState();
}

class _CreateAdvertPageState extends State<CreateAdvertPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: BackButton(
          color: Theme.of(context).colorScheme.onSurface,
        ),
        context: context,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.check))],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            TextField(
              controller: AppTextEditingController(),
              style: Theme.of(context).textTheme.headlineMedium,
              decoration: InputDecoration(
                hintText: 'Название',
                hintStyle: Theme.of(context).textTheme.headlineMedium,
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
