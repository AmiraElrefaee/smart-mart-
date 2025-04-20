import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';  // استيراد الحزمة الخاصة بمسار التخزين

import '../../const.dart';

class ApiService {
  late Dio dio;
  late CookieJar cookieJar;

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
    ));


  }
}

// إنشاء PersistCookieJar
Future<CookieJar> createPersistCookieJar() async {
  final dir = await getApplicationDocumentsDirectory();  // الحصول على مسار المستندات
  return PersistCookieJar(storage: FileStorage('${dir.path}/.cookies/'));  // استخدام المسار لحفظ الكوكيز
}
