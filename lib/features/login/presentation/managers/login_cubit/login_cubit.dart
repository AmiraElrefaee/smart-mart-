import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entity/login_entity.dart';
import '../../../domain/use_case/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginInitial());
  final LoginUseCase loginUseCase;
  Future<void>login({required String mail ,required String pass} )async{

      emit(LoginLoading());
      try {
        final user = await loginUseCase(mail, pass);
        // String a=user.token;
        emit(LoginSuccess(user));

      } catch (e) {
        print(e.toString());
        emit(LoginFailure(e.toString()));
      }

  }
}
