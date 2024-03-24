import 'package:dot_marketplace/core/data/remote_response.dart';
import 'package:dot_marketplace/core/domain/app_error/app_error.dart';
import 'package:dot_marketplace/core/domain/use_case_result/use_case_result.dart';
import 'package:dot_marketplace/feature/recovery_page/data/model/recovery_code_credentials.dart';
import 'package:dot_marketplace/feature/recovery_page/data/source/recovery_data.dart';
import 'package:dot_marketplace/feature/recovery_page/domain/entity/recovery_creditinals.dart';
import 'package:dot_marketplace/util/rest_api_error_list_ext.dart';

class RecoveryRepository {
  final RecoveryDataSource _recoveryDataSource;

  RecoveryRepository(this._recoveryDataSource);

  Future<UseCaseResult<RecoveryCredentials>> confirmCode({
    required final String code,
  }) async {
    final sourceResult = await _recoveryDataSource.confirmCode(code: code);

    return switch (sourceResult) {
      DataRemoteResponse<RecoveryCodeCredentialsModel>(:final data) =>
        UseCaseResult.good(RecoveryCredentials.fromModel(data)),
      VoidRemoteResponse<RecoveryCodeCredentialsModel>() =>
        const UseCaseResult.bad([SelfValidationError('unexpected void')]),
      ErrorRemoteResponse<RecoveryCodeCredentialsModel>(:final errorList) =>
        UseCaseResult.bad(errorList.asAppErrors.toList()),
    };
  }

  Future<UseCaseResult<RecoveryCredentials>> newPassword({
    required final String code,
  }) async {
    final sourceResult = await _recoveryDataSource.confirmCode(code: code);

    return switch (sourceResult) {
      DataRemoteResponse<RecoveryCodeCredentialsModel>(:final data) =>
        UseCaseResult.good(RecoveryCredentials.fromModel(data)),
      VoidRemoteResponse<RecoveryCodeCredentialsModel>() =>
        const UseCaseResult.bad([SelfValidationError('unexpected void')]),
      ErrorRemoteResponse<RecoveryCodeCredentialsModel>(:final errorList) =>
        UseCaseResult.bad(errorList.asAppErrors.toList()),
    };
  }
}
