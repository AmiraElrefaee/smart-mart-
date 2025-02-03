import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entity/login_entity.dart';
import '../../../domain/use_case/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginInitial());
  final LoginUseCase loginUseCase;
  Future<void>login(String mail , String pass )async{
    void login(String email, String password) async {
      emit(LoginLoading());
      try {
        final user = await loginUseCase(email, password);
        emit(LoginSuccess(user));

      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    }
  }
}
