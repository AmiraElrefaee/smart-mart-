// core/network/api_service.dart
import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smart_mart/core/network/token_storage.dart';

import '../../const.dart';


class ApiService {
  late Dio dio;
  late CookieJar cookieJar;
  ApiService._();
  // ApiService() {
  //   _initialize();
  // }
  static Future<ApiService> create() async {
    final instance = ApiService._();
    await instance._initialize();
    return instance;
  }

  Future<void> _initialize() async {
    dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

    cookieJar = await createPersistCookieJar();
    dio.interceptors.add(CookieManager(cookieJar));

    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      logPrint: (object) {
        print('🛰️ $object');
      },
    ));


    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await TokenStorage.getAccessToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },


        onError: (e, handler) async {
          if (e.response?.statusCode == 401) {
            final refreshToken = await TokenStorage.getRefreshToken();
            if (refreshToken != null) {
              try {
                final refreshResponse = await dio.post('/sessions/refresh');
                final newAccessToken = refreshResponse.data['data']['accessToken'];
                await TokenStorage.saveTokens(newAccessToken, refreshToken);

                // إعادة تنفيذ الريكوست القديم بالتوكن الجديد
                final requestOptions = e.requestOptions;
                requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
                final clonedResponse = await dio.fetch(requestOptions);
                return handler.resolve(clonedResponse);
              } catch (e) {
                print('🔴 فشل تجديد التوكن: $e');
              }
            }
          } else {
            print(e.response?.statusCode);
          }

          return handler.next(e);
        },
      ),

    );
  }
}

Future<CookieJar> createPersistCookieJar() async {
  final dir = await getApplicationDocumentsDirectory();
  return PersistCookieJar(storage: FileStorage('${dir.path}/.cookies/'));
}
