part of 'main_page_service.dart';

class MainPageState {}

class InitialState extends MainPageState {}

class IsSuucessState extends MainPageState {
  final List<AdvertisementListItem> advertice;
  IsSuucessState({required this.advertice});
}

class IsLoadingState extends MainPageState {}

class IsErrorState extends MainPageState {}

class EmptyState extends MainPageState {}
