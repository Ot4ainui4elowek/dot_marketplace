part of "advertisement_user_service.dart";

class AdvertisementUserEvent {}

class ChangeUserInfo extends AdvertisementUserEvent {
  ChangeUserInfo(this.user);
  final AdvertisementUserInfo user;
}
