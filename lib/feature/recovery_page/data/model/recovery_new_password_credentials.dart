import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RecoveryNewPasswordCredentialsModel {
  final String password;

  RecoveryNewPasswordCredentialsModel(this.password);

  factory RecoveryNewPasswordCredentialsModel.fromModel(
          RecoveryNewPasswordCredentialsModel model) =>
      RecoveryNewPasswordCredentialsModel(model.password);
}
