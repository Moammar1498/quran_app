// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surahs_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurahsEntity _$SurahsEntityFromJson(Map<String, dynamic> json) => SurahsEntity(
      (json['code'] as num?)?.toInt(),
      json['status'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : SurahsDataEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SurahsEntityToJson(SurahsEntity instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };

SurahsDataEntity _$SurahsDataEntityFromJson(Map<String, dynamic> json) =>
    SurahsDataEntity(
      (json['number'] as num?)?.toInt(),
      json['name'] as String?,
      json['englishName'] as String?,
      json['englishNameTranslation'] as String?,
      (json['numberOfAyahs'] as num?)?.toInt(),
      json['revelationType'] as String?,
    );

Map<String, dynamic> _$SurahsDataEntityToJson(SurahsDataEntity instance) =>
    <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'englishName': instance.englishName,
      'englishNameTranslation': instance.englishNameTranslation,
      'numberOfAyahs': instance.numberOfAyahs,
      'revelationType': instance.revelationType,
    };
