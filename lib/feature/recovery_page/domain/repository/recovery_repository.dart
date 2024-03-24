import 'package:dot_marketplace/core/data/remote_response.dart';
import 'package:dot_marketplace/core/domain/app_error/app_error.dart';
import 'package:dot_marketplace/core/domain/use_case_result/use_case_result.dart';
import 'package:dot_marketplace/feature/recovery_page/data/model/recovery_code_credentials.dart';
import 'package:dot_marketplace/feature/recovery_page/data/model/recovery_new_password_credentials.dart';
import 'package:dot_marketplace/feature/recovery_page/data/model/recovery_phone_creditionals.dart';
import 'package:dot_marketplace/feature/recovery_page/data/source/recovery_data.dart';
import 'package:dot_marketplace/feature/recovery_page/domain/entity/recovery_code_creditinals.dart';
import 'package:dot_marketplace/feature/recovery_page/domain/entity/recovery_password_creditinals.dart';
import 'package:dot_marketplace/feature/recovery_page/domain/entity/recovery_phone_creditinals.dart';
import 'package:dot_marketplace/util/rest_api_error_list_ext.dart';

class RecoveryRepository {
  final RecoveryDataSource _recoveryDataSource;

  RecoveryRepository(this._recoveryDataSource);

  Future<UseCaseResult<RecoveryCodeCredentials>> confirmCode({
    required final String code,
  }) async {
    final sourceResult = await _recoveryDataSource.confirmCode(code: code);

    return switch (sourceResult) {
      DataRemoteResponse<RecoveryCodeCredentialsModel>(:final data) =>
        UseCaseResult.good(RecoveryCodeCredentials.fromModel(data)),
      VoidRemoteResponse<RecoveryCodeCredentialsModel>() =>
        const UseCaseResult.bad([SelfValidationError('unexpected void')]),
      ErrorRemoteResponse<RecoveryCodeCredentialsModel>(:final errorList) =>
        UseCaseResult.bad(errorList.asAppErrors.toList()),
    };
  }

  Future<UseCaseResult<RecoveryPasswordCredentials>> newPassword({
    required final String password,
  }) async {
    final sourceResult =
        await _recoveryDataSource.newPassword(password: password);

    return switch (sourceResult) {
      DataRemoteResponse<RecoveryNewPasswordCredentialsModel>(:final data) =>
        UseCaseResult.good(RecoveryPasswordCredentials.fromModel(data)),
      VoidRemoteResponse<RecoveryNewPasswordCredentialsModel>() =>
        const UseCaseResult.bad([SelfValidationError('unexpected void')]),
      ErrorRemoteResponse<RecoveryNewPasswordCredentialsModel>(
        :final errorList
      ) =>
        UseCaseResult.bad(errorList.asAppErrors.toList()),
    };
  }

  Future<UseCaseResult<RecoveryPhoneCredentials>> sendCode(
      {required String number}) async {
    final sourceResult = await _recoveryDataSource.sendCode(number: number);

    return switch (sourceResult) {
      DataRemoteResponse<RecoveryPhoneCredentialsModel>(:final data) =>
        UseCaseResult.good(RecoveryPhoneCredentials.fromModel(data)),
      VoidRemoteResponse<RecoveryPhoneCredentialsModel>() =>
        const UseCaseResult.bad([SelfValidationError('unexpected void')]),
      ErrorRemoteResponse<RecoveryPhoneCredentialsModel>(:final errorList) =>
        UseCaseResult.bad(errorList.asAppErrors.toList()),
    };
  }
}
