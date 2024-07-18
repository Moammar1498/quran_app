
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:quran_app/core/typedef.dart';

import 'failure.dart';


/// watch apiProvider to make sure to have the latest access token passed.

final networkRepoProvider = StateProvider((_ref) {
  final dio = Dio();
  return NetworkRepo(ref: _ref, dio: dio);
});

///contains the common methods for get, post, put and delete apis.
///pass the [url] from endpoint using [endpoints] class.
///Every method has an optional parameter [require Auth]
///set [require Auth] to false if the access token is not required or empty.

class NetworkRepo {
  final Dio dio;
  final Ref ref;

  NetworkRepo(
      {required this.ref, required this.dio});

  FutureEither<Response> getRequest(
      {required String url,}) async {
    final Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    try {
      final response = await dio.request(url,
          options: Options(method: 'GET'));
      log('RESPONSE: ${response.data}', name: 'GET');
      return Right(response);
    } on DioException catch (e) {
      log('RESPONSE : ${e.message}', name: 'GET');
      return Left(
        Failure(
            message: e.response?.data['message'] ?? 'Something went wrong!',
            stackTrace: e.stackTrace),
      );
    }
  }
}
