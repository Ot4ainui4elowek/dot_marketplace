import 'package:dot_marketplace/core/domain/use_case_result/use_case_result.dart';
import 'package:dot_marketplace/feature/login_page/domain/entity/auth_credentials.dart';
import 'package:dot_marketplace/feature/login_page/domain/repository/auth_repository.dart';

class SignInUseCase {
  final AuthRepository _authRepo;

  SignInUseCase(this._authRepo);

  Future<UseCaseResult<AuthCredentials>> call({
    required final String phone,
    required final String password,
  }) {
    return _authRepo.signIn(phone: phone, password: password);
  }
}
