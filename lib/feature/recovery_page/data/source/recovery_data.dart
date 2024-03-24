import 'package:dot_marketplace/core/data/remote_response.dart';
import 'package:dot_marketplace/feature/recovery_page/data/model/recovery_code_credentials.dart';
import 'package:dot_marketplace/feature/recovery_page/data/model/recovery_new_password_credentials.dart';

abstract interface class RecoveryDataSource {
  Future<RemoteResponse<RecoveryCodeCredentialsModel>> confirmCode({
    required final String code,
  });
  Future<RemoteResponse<RecoveryNewPasswordCredentialsModel>> newPassword({
    required final String password,
  });
}
