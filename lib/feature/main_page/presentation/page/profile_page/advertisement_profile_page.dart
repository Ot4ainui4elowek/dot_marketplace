import 'package:dot_marketplace/core/domain/router/dot_marketplace_routes.dart';
import 'package:dot_marketplace/core/presentation/UI/app_bar/app_bar.dart';
import 'package:dot_marketplace/feature/edit_profile_page/domain/service/advertisement_user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AdvertisementProfilePage extends StatefulWidget {
  const AdvertisementProfilePage({super.key, required this.service});
  final AdvertisementUserService service;

  @override
  State<AdvertisementProfilePage> createState() =>
      _AdvertisementProfilePageState();
}

class _AdvertisementProfilePageState extends State<AdvertisementProfilePage> {
  AdvertisementUserService get service => widget.service;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: Text('Профиль'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          padding: const EdgeInsets.all(16),
        ),
        actions: [
          IconButton(
              onPressed: () =>
                  context.push(DotMarketplaceRoutes.editProfilePage),
              icon: Icon(Icons.edit)),
          const SizedBox(width: 8),
        ],
      ),
      body: BlocBuilder(
        bloc: service,
        builder: (context, state) {
          if (state is AdvertisementUserState) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        Image(
                          image: AssetImage('assets/image/logo.png'),
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${state.user.firtsName} ${state.user.lastName}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Divider(),
                  const SizedBox(height: 16),
                  Text(
                    'E-mail',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    state.user.email,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Телефон',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    state.user.phone,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('UPS'),
            );
          }
        },
      ),
    );
  }
}
