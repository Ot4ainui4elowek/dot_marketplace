import 'package:dot_marketplace/core/data/model/rest_api_error_model.dart';
import 'package:dot_marketplace/core/data/remote_response.dart';
import 'package:dot_marketplace/feature/recovery_page/data/model/recovery_code_credentials.dart';
import 'package:dot_marketplace/feature/recovery_page/data/model/recovery_new_password_credentials.dart';
import 'package:dot_marketplace/feature/recovery_page/data/source/recovery_data.dart';

class RecoveryMockedDataSource implements RecoveryDataSource {
  @override
  Future<RemoteResponse<RecoveryCodeCredentialsModel>> confirmCode(
      {required final String code}) async {
    await Future.delayed(const Duration(seconds: 5));
    if (code == '6666') {
      return DataRemoteResponse(data: const RecoveryCodeCredentialsModel(true));
    } else {
      return ErrorRemoteResponse(
        title: 'code confirmation failed',
        detail: 'wrong code',
        errorList: [
          RestApiValidationErrorModel(
            fieldName: 'code',
            errorList: [
              (code: 'code is wrong', params: null),
            ],
          ),
        ],
      );
    }
  }

  @override
  Future<RemoteResponse<RecoveryNewPasswordCredentialsModel>> newPassword(
      {required String password}) async {
    await Future.delayed(const Duration(seconds: 5));
    if (password.length > 10) {
      return DataRemoteResponse(
          data: RecoveryNewPasswordCredentialsModel(password));
    } else {
      return ErrorRemoteResponse(
        title: 'password change error',
        detail: 'wrong password',
        errorList: [
          RestApiValidationErrorModel(
            fieldName: 'code',
            errorList: [
              (code: 'password is wrong', params: null),
            ],
          ),
        ],
      );
    }
  }
}
