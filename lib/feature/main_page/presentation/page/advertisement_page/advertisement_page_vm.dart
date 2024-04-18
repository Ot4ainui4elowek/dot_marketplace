import 'package:dot_marketplace/core/presentation/UI/text_fields/controllers/app_text_editing_controller.dart';
import 'package:dot_marketplace/feature/locality/domain/entity/locality.dart';
import 'package:dot_marketplace/feature/main_page/domain/bloc/advertisement_service.dart';
import 'package:dot_marketplace/feature/main_page/domain/entity/advertisement_list_filter.dart';
import 'package:dot_marketplace/feature/main_page/domain/repository/advertisement_repository.dart';
import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

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

  void showBottomSheet(
      {required BuildContext context,
      required Widget bottomSheet,
      bool? isScrollControlled}) {
    showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        isScrollControlled: true,
        builder: (context) => bottomSheet);
  }

  num isValidPrice(String price) => int.tryParse(price) ?? 0;

  final Rv<List<Locality>> curentLocalityList = <Locality>[].rv;

  void addLocality(Locality locality) {
    if (!curentLocalityList.value.contains(locality)) {
      curentLocalityList.add(locality);
    }
  }

  void delleteLocality(Locality locality) {
    final index = curentLocalityList.value.indexOf(locality);
    if (index != -1) {
      curentLocalityList.removeAt(index);
    }
  }

  Future<void> getAdvertisementPage({int page = 0}) async {
    advertisementService.add(AdvertisementLoadingEvent());

    final result = await _advertisementRepository.getList(
      filter: AdvertisementListFilter(
        availableLocalityList: curentLocalityList.value,
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
        availableLocalityList: curentLocalityList.value,
        page: page,
        limit: 10,
      ),
    );
    myAdvertisementService.add(AdvertisementFetchEvent(result: result));
  }
}
