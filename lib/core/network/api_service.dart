import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';  // استيراد الحزمة الخاصة بمسار التخزين

import '../../const.dart';
import '../../features/login/presentation/managers/refresh_token_cubit/refresh_token_cubit.dart';
import '../../features/login/presentation/managers/refresh_token_cubit/refresh_token_state.dart';

class ApiService {
  late Dio dio;
  late CookieJar cookieJar;
  // final RefreshTokenCubit refreshTokenCubit;
  ApiService() {
    _initialize();
  }

  // دالة لتهيئة Dio و CookieJar
  Future<void> _initialize() async {
    dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

    // انتظار إنشاء PersistCookieJar قبل المتابعة
    cookieJar = await createPersistCookieJar();
    dio.interceptors.add(CookieManager(cookieJar));
    // إضافة CookieManager لإدارة الكوكيز
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        logPrint: (object) {
          print('🛰️ $object');
        },
      ),
    );
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // مثلاً تجيبي التوكن من Hive أو SharedPreferences
        final token = 'your-token-here';
        options.headers['Authorization'] = 'Bearer $token';
        return handler.next(options);
      },
        // onError: (DioError e, handler) async {
        //   if (e.response?.statusCode == 401) {
        //     // 1. تطلبي من الكيوبت إنه يعمل refresh للتوكن
        //     await refreshTokenCubit.refreshAccessToken();
        //
        //     // 2. تجيبي التوكن الجديد من الكيوبت بدل ما تدوري عليه في Hive
        //     final currentState = refreshTokenCubit.state;
        //     final newToken = currentState is RefreshTokenSuccess
        //         ? currentState.newAccessToken
        //         : null;
        //
        //     if (newToken != null) {
        //       // 3. تعدلي على الريكوست القديم وتحطي فيه التوكن الجديد
        //       final requestOptions = e.requestOptions;
        //       requestOptions.headers['Authorization'] = 'Bearer $newToken';
        //
        //       // 4. تعيدي إرسال الريكوست بالتوكن الجديد
        //       final clonedRequest = await dio.fetch(requestOptions);
        //       return handler.resolve(clonedRequest);
        //     } else {
        //       // لو معرفتش تجيبي التوكن لأي سبب، كمل عادي بالخطأ
        //       return handler.next(e);
        //     }
        //   } else {
        //     // لو الخطأ مش 401 كمل عادي
        //     return handler.next(e);
        //   }
        // }



    ));


  }
}

// إنشاء PersistCookieJar
Future<CookieJar> createPersistCookieJar() async {
  final dir = await getApplicationDocumentsDirectory();  // الحصول على مسار المستندات
  return PersistCookieJar(storage: FileStorage('${dir.path}/.cookies/'));  // استخدام المسار لحفظ الكوكيز
}
