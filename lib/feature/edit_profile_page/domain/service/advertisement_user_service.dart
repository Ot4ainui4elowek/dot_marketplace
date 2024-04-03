import 'package:dot_marketplace/feature/edit_profile_page/domain/entity/advertisement_user_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advertisement_user_event.dart';
part 'advertisement_user_state.dart';

class AdvertisementUserService
    extends Bloc<AdvertisementUserEvent, AdvertisementUserState> {
  AdvertisementUserService()
      : super(const AdvertisementUserState(
            user: AdvertisementUserInfo(
                email: 'some-mail@mail.ru',
                firtsName: 'Женя',
                lastName: 'Перекупович',
                phone: '+373 777 77 7'))) {
    on<ChangeUserInfo>((event, emit) {
      emit(AdvertisementUserState(user: event.user));
    });
  }
}
