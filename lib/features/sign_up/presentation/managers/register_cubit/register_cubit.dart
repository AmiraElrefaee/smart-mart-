import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/use_case/register_use_case.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUseCase) : super(RegisterInitial());
  final RegisterUseCase registerUseCase ;

  Future<void> register
      ({ required String fname,
    required String lname,
    required String mail,
    required String pass,
    required String copass,
  required num phone
  })
  async{
 emit(RegisterLoading());
try{
  final response = await registerUseCase(fname, lname, mail, pass, copass,phone);
  print('📌 Decoded Response: $response');

  if (response["status"] == "success") {
    print('✅ Success! Emitting RegisterSuccess...');
    emit(RegisterSuccess());
  } else {
    print('❌ Registration failed: ${response["message"]}');
    emit(RegisterFailure(response["message"] ?? "Unknown error"));
  }
}
catch(error){

  print('⚠️ here cubit error: $error');
  emit(RegisterFailure(error.toString()));
}
  }

}
