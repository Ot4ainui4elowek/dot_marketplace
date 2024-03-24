import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RecoveryCodeCredentialsModel {
  final bool isSuccess;

  const RecoveryCodeCredentialsModel(this.isSuccess);

  factory RecoveryCodeCredentialsModel.fromModel(
          RecoveryCodeCredentialsModel model) =>
      RecoveryCodeCredentialsModel(model.isSuccess);
}
