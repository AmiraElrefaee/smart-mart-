import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/use_case/register_use_case.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUseCase) : super(RegisterInitial());
  final RegisterUseCase registerUseCase ;

  Future<void> register
      (String fname, String lname, String mail, String pass, String copass)
  async{
 emit(RegisterLoading());
try{
  final response = await registerUseCase(fname, lname, mail, pass, copass);
  emit(RegisterSuccess(response));
}
catch(error){
  emit(RegisterFailure(error.toString()));
}
  }

}
