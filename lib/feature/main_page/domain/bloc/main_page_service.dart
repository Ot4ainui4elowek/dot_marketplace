import 'package:dot_marketplace/core/domain/use_case_result/use_case_result.dart';
import 'package:dot_marketplace/feature/main_page/domain/entity/adverisement_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class AdvertisementService extends Bloc<AdvertisementEvent, AdvertisemetState> {
  AdvertisementService() : super(InitialState()) {
    on<AdvertisementLoadingEvent>((event, emit) {
      emit(IsLoadingState());
    });
    on<AdvertisementFetchEvent>((event, emit) {
      switch (event.result) {
        case GoodUseCaseResult<List<AdvertisementListItem>>(:final data):
          if (data.isEmpty) {
            emit(IsEmptyState());
            break;
          }
          emit(IsSuucessState(advertice: data));
          break;
        case BadUseCaseResult<List<AdvertisementListItem>>():
          // TODO отобразить ошибку
          emit(IsErrorState());
          break;
      }
    });
  }
}
