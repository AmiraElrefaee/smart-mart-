import 'package:smart_mart/features/sign_up/domain/repo/register_repo.dart';

class RegisterUseCase{
final RegisterRepo registerRepo;

  RegisterUseCase(this.registerRepo);
  Future<Map<String, dynamic>>call
      (String fname, String lname, String mail, String pass, String copass){
  return registerRepo.register(fname, lname, mail, pass, copass);
  }
}