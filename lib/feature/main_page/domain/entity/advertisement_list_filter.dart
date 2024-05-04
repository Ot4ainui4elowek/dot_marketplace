import 'package:dot_marketplace/feature/locality/domain/entity/locality.dart';

class AdvertisementListFilter {
  final List<Locality> availableLocalityList;
  final double? minPrice;
  final double? maxPrice;
  final int page;
  final int limit;

  const AdvertisementListFilter({
    required this.availableLocalityList,
    this.minPrice,
    this.maxPrice,
    required this.page,
    required this.limit,
  }) : assert(page >= 0 && limit > 0);
}
