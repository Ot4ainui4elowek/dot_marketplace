import 'package:dot_marketplace/feature/recovery_page/data/model/recovery_phone_creditionals.dart';

class RecoveryPhoneCredentials {
  final String phone;

  const RecoveryPhoneCredentials(this.phone);

  factory RecoveryPhoneCredentials.fromModel(
          RecoveryPhoneCredentialsModel model) =>
      RecoveryPhoneCredentials(model.phone);
}
