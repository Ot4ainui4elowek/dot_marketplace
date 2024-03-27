import 'package:dot_marketplace/feature/main_page/domain/advertisement_repository.dart';
import 'package:dot_marketplace/core/domain/use_case_result/use_case_result.dart';
import 'package:dot_marketplace/feature/main_page/domain/entity/adverisement_list_item.dart';
import 'package:dot_marketplace/feature/main_page/domain/entity/advertisement_list_filter.dart';
import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

class MainPageViewModel {
  final AdvertisementRepository _advertisementRepository;

  final advertisementList = <AdvertisementListItem>[].rv;

  MainPageViewModel({
    required AdvertisementRepository advertisementRepository,
  }) : _advertisementRepository = advertisementRepository;

  Future<void> getAdvertisementPage(final int page) async {
    final result = await _advertisementRepository.getList(
      AdvertisementListFilter(
        availableLocalityList: [],
        page: page,
        limit: 10,
      ),
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

  void onFilterTap(BuildContext context, Widget bottomSheet) {
    showModalBottomSheet(
      context: context,
      builder: (context) => bottomSheet,
    );
  }
}
