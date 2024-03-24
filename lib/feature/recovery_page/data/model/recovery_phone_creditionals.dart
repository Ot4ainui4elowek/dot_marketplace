import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RecoveryPhoneCredentialsModel {
  final String phone;

  const RecoveryPhoneCredentialsModel(this.phone);

  factory RecoveryPhoneCredentialsModel.fromModel(
          RecoveryPhoneCredentialsModel model) =>
      RecoveryPhoneCredentialsModel(model.phone);
}
