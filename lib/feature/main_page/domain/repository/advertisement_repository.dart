import 'package:dot_marketplace/core/domain/use_case_result/use_case_result.dart';
import 'package:dot_marketplace/feature/main_page/domain/entity/adverisement_list_item.dart';
import 'package:dot_marketplace/feature/main_page/domain/entity/advertisement_list_filter.dart';

abstract class AdvertisementRepository {
  Future<UseCaseResult<List<AdvertisementListItem>>> getList(
      {required AdvertisementListFilter filter,
      required num minPrice,
      required num maxPrice});

  Future<UseCaseResult<AdvertisementListItem>> add(
      AdvertisementCreationEntity advCreationEntity);

  Future<UseCaseResult<List<AdvertisementListItem>>> getFavoriteList(
      AdvertisementListFilter filter);
  Future<UseCaseResult<List<AdvertisementListItem>>> getMyAdvertList(
      AdvertisementListFilter filter);
  // Future<UseCaseResult<List<AdvertisementListItem>>> getFavorites(
  //     AdvertisementListFilter filter);
  Future<UseCaseResult<void>> delete(final String id);
}
