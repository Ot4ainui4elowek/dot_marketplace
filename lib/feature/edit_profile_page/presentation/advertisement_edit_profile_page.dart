import 'package:dot_marketplace/core/presentation/UI/app_bar/app_bar.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/app_text_field.dart';
import 'package:dot_marketplace/feature/edit_profile_page/presentation/advertisement_edit_profile_page_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdvertisementEditProfilePage extends StatefulWidget {
  const AdvertisementEditProfilePage({super.key, required this.vm});
  final AadvertisementEditProfilePageViewModel vm;

  @override
  State<AdvertisementEditProfilePage> createState() =>
      AdvertisementEditProfilePageState();
}

class AdvertisementEditProfilePageState
    extends State<AdvertisementEditProfilePage> {
  AadvertisementEditProfilePageViewModel get vm => widget.vm;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: const Text('Редкатирование профиля'),
        actions: [
          IconButton(
              onPressed: () => vm.applyChanges(context),
              icon: const Icon(Icons.check)),
          const SizedBox(width: 8),
        ],
      ),
      body: BlocBuilder(
        bloc: vm.service,
        builder: (context, state) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 24),
              const Image(
                image: AssetImage('assets/image/logo.png'),
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 8),
              AppTextField(labelText: 'Имя', controller: vm.firstname),
              const SizedBox(height: 20),
              AppTextField(labelText: 'Фамили', controller: vm.lastname),
              const SizedBox(height: 20),
              AppTextField(labelText: 'Email', controller: vm.email),
              const SizedBox(height: 20),
              AppTextField(labelText: 'Телефон', controller: vm.phone),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
