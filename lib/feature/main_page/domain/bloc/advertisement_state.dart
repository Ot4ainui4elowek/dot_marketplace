part of 'advertisement_service.dart';

class AdvertisemetState {}

class InitialState extends AdvertisemetState {}

class AdvertisementIsSuccessState extends AdvertisemetState {
  final List<AdvertisementListItem> advertice;
  AdvertisementIsSuccessState({required this.advertice});
}

class AdvertisementIsLoadingState extends AdvertisemetState {}

class AdvertisementIsErrorState extends AdvertisemetState {}

class AdvertisementIsEmptyState extends AdvertisemetState {}
