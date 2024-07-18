import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:quran_app/core/failure.dart';
import 'package:quran_app/home/models/surah_model_entity.dart';
import '../../../core/network.dart';
import '../../../core/typedef.dart';

final individualSurahRepoProvider = Provider((ref) {
  final api = ref.watch(networkRepoProvider);
  return IndividualSurahRepo(api: api,ref: ref);
});

class IndividualSurahRepo {
  final NetworkRepo _api;
  final _name = "individualSurah_REPOSITORY";
  final Ref ref;

  IndividualSurahRepo({required this.ref ,required NetworkRepo api}) : _api = api;

  FutureEither<SurahModelDataEntity?> getSurahAyahs({ required int surah,required int skip, int limit = 15}) async {
    final result =
    await _api.getRequest(url: 'http://api.alquran.cloud/v1/surah/$surah?offset=$skip&limit=$limit',);

    return result.fold((Failure failure) {
      log('Failure: ${failure.message} ${failure.stackTrace}', name: _name);
      return Left(failure);
    }, (Response response) {
      try {
        if (response.statusCode == 200) {
          final responseData = response.data;
          final parsedResponseData = SurahModelEntity.fromJson(responseData);
          log(parsedResponseData.data.toString(), name: _name);
          return Right(parsedResponseData.data);
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