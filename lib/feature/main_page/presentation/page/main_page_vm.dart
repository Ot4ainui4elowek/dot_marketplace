import 'package:dot_marketplace/core/presentation/UI/text_fields/controllers/app_text_editing_controller.dart';
import 'package:dot_marketplace/feature/locality/domain/entity/locality.dart';
import 'package:dot_marketplace/feature/main_page/domain/bloc/advertisement_service.dart';
import 'package:dot_marketplace/feature/main_page/domain/repository/advertisement_repository.dart';
import 'package:dot_marketplace/feature/main_page/domain/entity/advertisement_list_filter.dart';
import 'package:dot_marketplace/feature/main_page/presentation/widget/locality_list_item.dart';
import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

class MainPageViewModel {
  final AdvertisementRepository _advertisementRepository;
  final AdvertisementService otherAdvertisementService;
  final AdvertisementService myAdvertisementService;
  final AdvertisementService favoriteAdvertisementService;

  final curentBottomSheetWidget = 0.rv;

  MainPageViewModel({
    required AdvertisementRepository advertisementRepository,
    required this.otherAdvertisementService,
    required this.myAdvertisementService,
    required this.favoriteAdvertisementService,
  }) : _advertisementRepository = advertisementRepository;

  final List<LocalityListItem> localityListItem =
      List<LocalityListItem>.generate(
    LocalityList.values.length,
    (
      index,
    ) =>
        LocalityListItem(
      locality: LocalityList.values[index],
    ),
  );

  final minPrice = AppTextEditingController();
  final maxPrice = AppTextEditingController();
  final firstname = AppTextEditingController(text: 'Георгий');
  final lastname = AppTextEditingController(text: 'Васильков');
  final email = AppTextEditingController(text: 'examples@yourdomain.com');
  final phone = AppTextEditingController(text: '+ 373 777 2 54 97');

  final searchTextField = AppTextEditingController();

  num isValidPrice(String price) => int.tryParse(price) ?? 0;

  Future<void> getAdvertisementPage({int page = 1}) async {
    otherAdvertisementService.add(AdvertisementLoadingEvent());
    final result = await _advertisementRepository.getList(
      filter: AdvertisementListFilter(
        availableLocalityList: [],
        page: page,
        limit: 10,
      ),
      minPrice: isValidPrice(minPrice.text),
      maxPrice: isValidPrice(maxPrice.text),
    );
    otherAdvertisementService.add(AdvertisementFetchEvent(result: result));
  }

  Future<void> getMyAdvertisementPage(int page) async {
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

  Future<void> getFavoriteList(final int page) async {
    favoriteAdvertisementService.add(AdvertisementLoadingEvent());
    final result = await _advertisementRepository.getFavoriteList(
      AdvertisementListFilter(
        availableLocalityList: [],
        page: page,
        limit: 10,
      ),
    );
    favoriteAdvertisementService.add(AdvertisementFetchEvent(result: result));
  }

  void onFilterTap(BuildContext context, Widget bottomSheet) {
    showModalBottomSheet(
      context: context,
      builder: (context) => bottomSheet,
    );
  }
}
