import 'package:dot_marketplace/feature/recovery_page/data/model/recovery_code_credentials.dart';

class RecoveryCredentials {
  final bool isConfirmedNumber;

  const RecoveryCredentials(this.isConfirmedNumber);

  factory RecoveryCredentials.fromModel(RecoveryCodeCredentialsModel model) =>
      RecoveryCredentials(model.isSuccess);
}
