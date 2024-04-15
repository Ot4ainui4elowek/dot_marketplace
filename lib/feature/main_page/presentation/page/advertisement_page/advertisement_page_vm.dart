import 'package:dot_marketplace/core/presentation/UI/sheets/app_bottom_sheet.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/controllers/app_text_editing_controller.dart';
import 'package:dot_marketplace/feature/main_page/domain/bloc/advertisement_service.dart';
import 'package:dot_marketplace/feature/main_page/domain/entity/advertisement_list_filter.dart';
import 'package:dot_marketplace/feature/main_page/domain/repository/advertisement_repository.dart';
import 'package:flutter/material.dart';

class AdvertisementPageViewModel {
  AdvertisementPageViewModel({
    required advertisementRepository,
  }) : _advertisementRepository = advertisementRepository;
  final AdvertisementService advertisementService = AdvertisementService();
  final AdvertisementService myAdvertisementService = AdvertisementService();
  final AdvertisementRepository _advertisementRepository;
  final minPrice = AppTextEditingController();
  final maxPrice = AppTextEditingController();
  final searchTextField = AppTextEditingController();

  void onFilterTap(BuildContext context, Widget bottomSheet) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (context) => AppBottomSheet(
        widget: bottomSheet,
      ),
    );
  }

  num isValidPrice(String price) => int.tryParse(price) ?? 0;

  Future<void> getAdvertisementPage({int page = 0}) async {
    advertisementService.add(AdvertisementLoadingEvent());
    final result = await _advertisementRepository.getList(
      filter: AdvertisementListFilter(
        availableLocalityList: [],
        page: page,
        limit: 10,
      ),
      minPrice: isValidPrice(minPrice.text),
      maxPrice: isValidPrice(maxPrice.text),
    );
    advertisementService.add(AdvertisementFetchEvent(result: result));
  }

  Future<void> getMyAdvertisementPage({int page = 0}) async {
    myAdvertisementService.add(AdvertisementLoadingEvent());
    final result = await _advertisementRepository.getMyAdvertList(
      AdvertisementListFilter(
        availableLocalityList: [],
        page: page,
        limit: 10,
      ),
    );
    myAdvertisementService.add(AdvertisementFetchEvent(result: result));
  }
}
