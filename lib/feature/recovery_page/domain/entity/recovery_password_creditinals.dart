import 'package:dot_marketplace/feature/recovery_page/data/model/recovery_new_password_credentials.dart';

class RecoveryPasswordCredentials {
  final String password;

  const RecoveryPasswordCredentials(this.password);

  factory RecoveryPasswordCredentials.fromModel(
          RecoveryNewPasswordCredentialsModel model) =>
      RecoveryPasswordCredentials(model.password);
}
