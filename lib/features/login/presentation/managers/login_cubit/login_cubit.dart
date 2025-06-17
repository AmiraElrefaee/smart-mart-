import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../const.dart';
import '../../../../../core/network/token_storage.dart';
import '../../../domain/entity/login_entity.dart';
import '../../../domain/use_case/login_use_case.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginInitial());
  final LoginUseCase loginUseCase;
  Map<String, dynamic>? _decodedToken;
  Map<String, dynamic>? get decodedToken => _decodedToken;
  Future<void>login({required String mail ,required String pass} )async{

      emit(LoginLoading());
      try {
        final user = await loginUseCase(mail, pass);
         _decodedToken = JwtDecoder.decode(user.token);
        // ApiConstants.firstName =_decodedToken!['firstName'];
        // await TokenStorage.saveTokens(user.token, user.refreshToken);
        String userId = decodedToken!['_id']; // هنا طلعنا ال id
        print('the token info : $decodedToken');
        // String a=user.token;
        emit(LoginSuccess(_decodedToken!));

      } catch (e) {
        print(e.toString());
        emit(LoginFailure(e.toString()));
      }

  }
}
