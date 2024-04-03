import 'package:dot_marketplace/core/presentation/UI/preloader/preloader.dart';
import 'package:dot_marketplace/feature/main_page/domain/bloc/advertisement_service.dart';
import 'package:dot_marketplace/feature/main_page/presentation/page/favorite_page/advertisement_favorite_page_vm.dart';
import 'package:dot_marketplace/feature/main_page/presentation/widget/advertise_list_item.dart';
import 'package:dot_marketplace/theme/app_light_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdvertisementFavoritePage extends StatefulWidget {
  const AdvertisementFavoritePage({super.key, required this.vm});
  final AdvertisementFavotitePageViewModel vm;

  @override
  State<AdvertisementFavoritePage> createState() =>
      _AdvertisementFavoritePageState();
}

class _AdvertisementFavoritePageState extends State<AdvertisementFavoritePage> {
  AdvertisementFavotitePageViewModel get vm => widget.vm;

  @override
  void initState() {
    super.initState();
    vm.getFavoriteList();
  }

  @override
  void didUpdateWidget(covariant AdvertisementFavoritePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.vm != widget.vm) {
      vm.getFavoriteList();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget get _favoriteIsempty => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.add,
                size: 70,
                color: AppLightColors.outlineVariant,
              ),
              const SizedBox(height: 16),
              Text(
                'У вас пока нет объявлений',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Text(
                'Не упустите возможность! \nСоздайте и опубликуйте своё объявление прямо сейчас, чтобы предложить товары или услуги широкой аудитории.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Избранное',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        titleTextStyle: Theme.of(context).textTheme.headlineMedium,
        forceMaterialTransparency: true,
      ),
      body: BlocBuilder<AdvertisementService, AdvertisemetState>(
          bloc: vm.service,
          builder: (context, state) {
            if (state is AdvertisementIsSuccessState) {
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) => AdvertisementListItemWidget(
                    advertisementListItem: state.advertice[index]),
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: state.advertice.length,
              );
            } else if (state is AdvertisementIsLoadingState) {
              return const Center(
                child: Preloader(),
              );
            } else if (state is AdvertisementIsEmptyState) {
              return Center(
                child: _favoriteIsempty,
              );
            } else if (state is AdvertisementIsErrorState) {
              return Center(
                child: Text('Ошибка'),
              );
            } else {
              return Center(
                child: Text('Что-то пошло не так'),
              );
            }
          }),
    );
  }
}
