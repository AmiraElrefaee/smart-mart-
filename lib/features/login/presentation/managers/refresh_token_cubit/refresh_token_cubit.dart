import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repo/refresh_token-repo.dart';
import 'refresh_token_state.dart';


class RefreshTokenCubit extends Cubit<RefreshTokenState> {
  final RefreshTokenRepository repository;

  RefreshTokenCubit(this.repository) : super(RefreshTokenInitial());

  Future<void> refreshAccessToken() async {
    emit(RefreshTokenLoading());
    try {
      final token = await repository.refreshToken();
      emit(RefreshTokenSuccess(token.token));
    } catch (e) {
      emit(RefreshTokenFailure(e.toString()));
    }
  }
}
