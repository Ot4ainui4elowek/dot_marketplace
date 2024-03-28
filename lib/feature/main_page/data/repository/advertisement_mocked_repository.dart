import 'dart:math';

import 'package:dot_marketplace/core/domain/app_error/app_error.dart';
import 'package:dot_marketplace/core/domain/use_case_result/use_case_result.dart';
import 'package:dot_marketplace/feature/locality/domain/entity/locality.dart';
import 'package:dot_marketplace/feature/main_page/domain/advertisement_repository.dart';
import 'package:dot_marketplace/feature/main_page/domain/entity/adverisement_list_item.dart';
import 'package:dot_marketplace/feature/main_page/domain/entity/advertisement_list_filter.dart';

class AdvertisementMockedRepository implements AdvertisementRepository {
  final _mockedAdvertisementList = List<AdvertisementListItem>.generate(
    12,
    (index) {
      final localityCount = LocalityList.values.length;
      final locality = LocalityList.values[index % localityCount];

      return AdvertisementListItem(
        id: '$index',
        title: 'Продажа велосипеда',
        description:
            'Почти новый горный велосипед, бренд XYZ, 2023 года выпуска. Использовался всего несколько раз. Отличное состояние, все компоненты работают идеально. Продается в связи с переездом в другой город.',
        creationDate: DateTime(2024, index, Random().nextInt(31)),
        cost: 1.0 * Random().nextInt(3000) + 2000,
        locality: locality,
        isFavorite: index.isEven,
      );
    },
  );

  @override
  Future<UseCaseResult<List<AdvertisementListItem>>> getList(
      AdvertisementListFilter filter) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      return UseCaseResult.good(_mockedAdvertisementList
          .where((element) {
            if (filter.availableLocalityList.isNotEmpty) {
              final localityResult =
                  filter.availableLocalityList.contains(element.locality);
              if (!localityResult) return false;
            }
            return true;
          })
          .skip(filter.page * filter.limit)
          .take(filter.limit)
          .toList());
    } catch (e) {
      return UseCaseResult.bad([SpecificError('getList error')]);
    }
  }

  // Future<UseCaseResult<List<AdvertisementListItem>>> getFavorites(
  //     AdvertisementListFilter filter) async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   try {
  //     return UseCaseResult.good(_mockedAdvertisementList
  //         .where((element) {
  //           return element.isFavorite;
  //         })
  //         .skip(filter.page * filter.limit)
  //         .take(filter.limit)
  //         .toList());
  //   } catch (e) {
  //     return UseCaseResult.bad([SpecificError('getList error')]);
  //   }
  // }

  @override
  Future<UseCaseResult<AdvertisementListItem>> add(
      AdvertisementCreationEntity advCreationEntity) async {
    throw UnimplementedError();
  }

  @override
  Future<UseCaseResult<void>> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
