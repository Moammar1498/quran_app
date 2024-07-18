import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:quran_app/core/failure.dart';
import 'package:quran_app/home/models/surahs_entity.dart';
import '../../../core/network.dart';
import '../../../core/typedef.dart';

final quranSurahsRepoProvider = Provider((ref) {
  final api = ref.watch(networkRepoProvider);
  return QuranSurahsRepo(api: api,ref: ref);
});

class QuranSurahsRepo {
  final NetworkRepo _api;
  final _name = "QuranSurahs_REPOSITORY";
  final Ref ref;

  QuranSurahsRepo({required this.ref ,required NetworkRepo api}) : _api = api;

  FutureEither<List<SurahsDataEntity?>?> getSurahItems() async {
    final result =
    await _api.getRequest(url: 'http://api.alquran.cloud/v1/surah',);

    return result.fold((Failure failure) {
      log('Failure: ${failure.message} ${failure.stackTrace}', name: _name);
      return Left(failure);
    }, (Response response) {
      try {
        if (response.statusCode == 200) {
          final responseData = response.data;
          final parsedResponseData = SurahsEntity.fromJson(responseData);
          log(parsedResponseData.data.toString(), name: _name);
          final List<SurahsDataEntity?>? surahs = parsedResponseData.data?.toList();
          log(surahs.toString(), name: _name);
            return Right(surahs);
        } else {
          log('${response.statusMessage}', name: _name);
          return Left(Failure(message: '${response.statusMessage}'));
        }
      } catch (e, stktrc) {
        log('Catch:  $stktrc', name: _name);
        return Left(Failure(
            message: 'Something went wrong!', stackTrace: stktrc));
      }
    });
  }
}