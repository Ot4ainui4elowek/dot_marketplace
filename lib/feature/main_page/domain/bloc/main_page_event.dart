part of 'main_page_service.dart';

class AdvertisementEvent {}

class AdvertisementFetchEvent extends AdvertisementEvent {
  final UseCaseResult<List<AdvertisementListItem>> result;
  AdvertisementFetchEvent({required this.result});
}

class AdvertisementLoadingEvent extends AdvertisementEvent {}
