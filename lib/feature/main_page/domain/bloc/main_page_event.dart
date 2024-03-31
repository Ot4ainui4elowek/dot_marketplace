part of 'main_page_service.dart';

class MainPageEvent {}

class FetchAdvertsEvent extends MainPageEvent {
  final UseCaseResult<List<AdvertisementListItem>> result;
  FetchAdvertsEvent({required this.result});
}

class LoadingEvent extends MainPageEvent {}
