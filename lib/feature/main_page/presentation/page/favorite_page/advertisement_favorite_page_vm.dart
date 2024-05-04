import 'package:dot_marketplace/feature/main_page/domain/bloc/advertisement_service.dart';
import 'package:dot_marketplace/feature/main_page/domain/entity/advertisement_list_filter.dart';
import 'package:dot_marketplace/feature/main_page/domain/repository/advertisement_repository.dart';

class AdvertisementFavotitePageViewModel {
  AdvertisementFavotitePageViewModel({required advertisementRepository})
      : _advertisementRepository = advertisementRepository;
  final AdvertisementRepository _advertisementRepository;
  final service = AdvertisementService();
  Future<void> getFavoriteList({int page = 0}) async {
    service.add(AdvertisementLoadingEvent());
    final result = await _advertisementRepository.getFavoriteList(
      AdvertisementListFilter(
        availableLocalityList: [],
        page: page,
        limit: 10,
      ),
    );
    service.add(AdvertisementFetchEvent(result: result));
  }
}
