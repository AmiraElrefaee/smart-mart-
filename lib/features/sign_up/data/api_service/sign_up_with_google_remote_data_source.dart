import 'package:google_sign_in/google_sign_in.dart';
import 'package:smart_mart/features/sign_up/data/api_service/register_remote_data_source_dio.dart';

class GoogleAuthHandler {
  final RegisterRemoteDataSourceDio registerRemoteDataSource;

  GoogleAuthHandler(this.registerRemoteDataSource);

  Future<Map<String, dynamic>> signUpWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser != null) {
      final email = googleUser.email;
      final fullName = googleUser.displayName ?? '';
      final nameParts = fullName.split(' ');
      final firstName = nameParts.first;
      final lastName = nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';

      const fakePassword = 'GOOGLE_USER_SECRET_2024';

      // ❗ رجّع الـ response
      return await registerRemoteDataSource.registerUser(
        email,
        firstName,
        lastName,
        fakePassword,
        fakePassword,
        1284534308, // رقم بدون صفر كبادئة عشان مايتفسرش غلط
      );
    } else {
      throw Exception("فشل تسجيل الدخول بجوجل");
    }
  }
}
