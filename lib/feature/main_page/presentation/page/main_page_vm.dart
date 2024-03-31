import 'package:dot_marketplace/core/presentation/UI/text_fields/controllers/app_text_editing_controller.dart';
import 'package:dot_marketplace/feature/locality/domain/entity/locality.dart';
import 'package:dot_marketplace/feature/main_page/domain/repository/advertisement_repository.dart';
import 'package:dot_marketplace/core/domain/use_case_result/use_case_result.dart';
import 'package:dot_marketplace/feature/main_page/domain/entity/adverisement_list_item.dart';
import 'package:dot_marketplace/feature/main_page/domain/entity/advertisement_list_filter.dart';
import 'package:dot_marketplace/feature/main_page/presentation/widget/locality_list_item.dart';
import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

class MainPageViewModel {
  final AdvertisementRepository _advertisementRepository;

  final advertisementList = <AdvertisementListItem>[].rv;
  final favoriteAdvertisementList = <AdvertisementListItem>[].rv;
  final myAdverList = <AdvertisementListItem>[].rv;
  final curentBottomSheetWidget = 0.rv;

  MainPageViewModel({
    required AdvertisementRepository advertisementRepository,
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

  Future<void> isValidPrice() async {
    try {
      advertisementList.clear();
      getAdvertisementPage(
          page: 0,
          maxPrice: maxPrice.text.isEmpty ? 0 : int.parse(maxPrice.text),
          minPrice: minPrice.text.isEmpty ? 0 : int.parse(minPrice.text));
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> getAdvertisementPage(
      {required int page, int minPrice = 0, int? maxPrice}) async {
    final result = await _advertisementRepository.getList(
      filter: AdvertisementListFilter(
        availableLocalityList: [],
        page: page,
        limit: 10,
      ),
      minPrice: minPrice,
      maxPrice: maxPrice,
    );

    switch (result) {
      case GoodUseCaseResult<List<AdvertisementListItem>>(:final data):
        advertisementList.addAll(data);
        break;
      case BadUseCaseResult<List<AdvertisementListItem>>():
        // TODO отобразить ошибку
        advertisementList.clear();
        break;
    }
  }

  Future<void> getMyAdvertisementPage(int page) async {
    final result = await _advertisementRepository.getMyAdvertList(
      AdvertisementListFilter(
        availableLocalityList: [],
        page: page,
        limit: 10,
      ),
    );

    switch (result) {
      case GoodUseCaseResult<List<AdvertisementListItem>>(:final data):
        myAdverList.addAll(data);
        break;
      case BadUseCaseResult<List<AdvertisementListItem>>():
        // TODO отобразить ошибку
        myAdverList.clear();
        break;
    }
  }

  Future<void> getFavoriteList(final int page) async {
    final result = await _advertisementRepository.getFavoriteList(
      AdvertisementListFilter(
        availableLocalityList: [],
        page: page,
        limit: 10,
      ),
    );

    switch (result) {
      case GoodUseCaseResult<List<AdvertisementListItem>>(:final data):
        favoriteAdvertisementList.addAll(data);
        break;
      case BadUseCaseResult<List<AdvertisementListItem>>():
        // TODO отобразить ошибку
        favoriteAdvertisementList.clear();
        break;
    }
  }

  void onFilterTap(BuildContext context, Widget bottomSheet) {
    showModalBottomSheet(
      context: context,
      builder: (context) => bottomSheet,
    );
  }
}
