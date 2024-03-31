part of 'main_page_service.dart';

class AdvertisemetState {}

class InitialState extends AdvertisemetState {}

class IsSuucessState extends AdvertisemetState {
  final List<AdvertisementListItem> advertice;
  IsSuucessState({required this.advertice});
}

class IsLoadingState extends AdvertisemetState {}

class IsErrorState extends AdvertisemetState {}

class IsEmptyState extends AdvertisemetState {}
