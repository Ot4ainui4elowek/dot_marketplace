import 'package:dot_marketplace/feature/recovery_page/data/model/recovery_code_credentials.dart';

class RecoveryCodeCredentials {
  final bool isConfirmedNumber;

  const RecoveryCodeCredentials(this.isConfirmedNumber);

  factory RecoveryCodeCredentials.fromModel(
          RecoveryCodeVerificationResultModel model) =>
      RecoveryCodeCredentials(model.isSuccess);
}
