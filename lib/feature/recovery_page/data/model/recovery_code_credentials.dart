import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RecoveryCodeVerificationResultModel {
  final bool isSuccess;

  const RecoveryCodeVerificationResultModel(this.isSuccess);

  factory RecoveryCodeVerificationResultModel.fromModel(
          RecoveryCodeVerificationResultModel model) =>
      RecoveryCodeVerificationResultModel(model.isSuccess);
}
