import 'package:json_annotation/json_annotation.dart';

part 'surah_model_entity.g.dart';

@JsonSerializable()
class SurahModelEntity {
  int? code;
  String? status;
  SurahModelDataEntity? data;

  SurahModelEntity(this.code, this.status, this.data);

  factory SurahModelEntity.fromJson(Map<String, dynamic> json) =>
      _$SurahModelEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SurahModelEntityToJson(this);
}

@JsonSerializable()
class SurahModelDataEntity {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  int? numberOfAyahs;
  List<SurahModelDataAyahsEntity?>? ayahs;
  SurahModelDataEditionEntity? edition;

  SurahModelDataEntity(
      this.number,
      this.name,
      this.englishName,
      this.englishNameTranslation,
      this.revelationType,
      this.numberOfAyahs,
      this.ayahs,
      this.edition);

  factory SurahModelDataEntity.fromJson(Map<String, dynamic> json) =>
      _$SurahModelDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SurahModelDataEntityToJson(this);
}

@JsonSerializable()
class SurahModelDataAyahsEntity {
  int? number;
  String? text;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  bool? sajda;

  SurahModelDataAyahsEntity(
      this.number,
      this.text,
      this.numberInSurah,
      this.juz,
      this.manzil,
      this.page,
      this.ruku,
      this.hizbQuarter,
      this.sajda);

  factory SurahModelDataAyahsEntity.fromJson(Map<String, dynamic> json) =>
      _$SurahModelDataAyahsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SurahModelDataAyahsEntityToJson(this);
}

@JsonSerializable()
class SurahModelDataEditionEntity {
  String? identifier;
  String? language;
  String? name;
  String? englishName;
  String? format;
  String? type;
  String? direction;

  SurahModelDataEditionEntity(this.identifier, this.language, this.name,
      this.englishName, this.format, this.type, this.direction);

  factory SurahModelDataEditionEntity.fromJson(Map<String, dynamic> json) =>
      _$SurahModelDataEditionEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SurahModelDataEditionEntityToJson(this);
}
