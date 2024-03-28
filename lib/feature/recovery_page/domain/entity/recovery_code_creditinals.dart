import 'package:dot_marketplace/feature/recovery_page/data/model/recovery_code_credentials.dart';

class RecoveryCodeCredentials {
  final bool isConfirmed;

  const RecoveryCodeCredentials(this.isConfirmed);

  factory RecoveryCodeCredentials.fromModel(
          RecoveryCodeVerificationResultModel model) =>
      RecoveryCodeCredentials(model.isSuccess);
}
