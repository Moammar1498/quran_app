// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surah_model_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurahModelEntity _$SurahModelEntityFromJson(Map<String, dynamic> json) =>
    SurahModelEntity(
      (json['code'] as num?)?.toInt(),
      json['status'] as String?,
      json['data'] == null
          ? null
          : SurahModelDataEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SurahModelEntityToJson(SurahModelEntity instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };

SurahModelDataEntity _$SurahModelDataEntityFromJson(
        Map<String, dynamic> json) =>
    SurahModelDataEntity(
      (json['number'] as num?)?.toInt(),
      json['name'] as String?,
      json['englishName'] as String?,
      json['englishNameTranslation'] as String?,
      json['revelationType'] as String?,
      (json['numberOfAyahs'] as num?)?.toInt(),
      (json['ayahs'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : SurahModelDataAyahsEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['edition'] == null
          ? null
          : SurahModelDataEditionEntity.fromJson(
              json['edition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SurahModelDataEntityToJson(
        SurahModelDataEntity instance) =>
    <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'englishName': instance.englishName,
      'englishNameTranslation': instance.englishNameTranslation,
      'revelationType': instance.revelationType,
      'numberOfAyahs': instance.numberOfAyahs,
      'ayahs': instance.ayahs,
      'edition': instance.edition,
    };

SurahModelDataAyahsEntity _$SurahModelDataAyahsEntityFromJson(
        Map<String, dynamic> json) =>
    SurahModelDataAyahsEntity(
      (json['number'] as num?)?.toInt(),
      json['text'] as String?,
      (json['numberInSurah'] as num?)?.toInt(),
      (json['juz'] as num?)?.toInt(),
      (json['manzil'] as num?)?.toInt(),
      (json['page'] as num?)?.toInt(),
      (json['ruku'] as num?)?.toInt(),
      (json['hizbQuarter'] as num?)?.toInt(),
      json['sajda'] as bool?,
    );

Map<String, dynamic> _$SurahModelDataAyahsEntityToJson(
        SurahModelDataAyahsEntity instance) =>
    <String, dynamic>{
      'number': instance.number,
      'text': instance.text,
      'numberInSurah': instance.numberInSurah,
      'juz': instance.juz,
      'manzil': instance.manzil,
      'page': instance.page,
      'ruku': instance.ruku,
      'hizbQuarter': instance.hizbQuarter,
      'sajda': instance.sajda,
    };

SurahModelDataEditionEntity _$SurahModelDataEditionEntityFromJson(
        Map<String, dynamic> json) =>
    SurahModelDataEditionEntity(
      json['identifier'] as String?,
      json['language'] as String?,
      json['name'] as String?,
      json['englishName'] as String?,
      json['format'] as String?,
      json['type'] as String?,
      json['direction'] as String?,
    );

Map<String, dynamic> _$SurahModelDataEditionEntityToJson(
        SurahModelDataEditionEntity instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'language': instance.language,
      'name': instance.name,
      'englishName': instance.englishName,
      'format': instance.format,
      'type': instance.type,
      'direction': instance.direction,
    };
