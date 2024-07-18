import 'package:json_annotation/json_annotation.dart';

part 'surahs_entity.g.dart';

@JsonSerializable()
class SurahsEntity {
  int? code;
  String? status;
  List<SurahsDataEntity?>? data;

  SurahsEntity(this.code, this.status, this.data);

  factory SurahsEntity.fromJson(Map<String, dynamic> json) =>
      _$SurahsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SurahsEntityToJson(this);
}

@JsonSerializable()
class SurahsDataEntity {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  int? numberOfAyahs;
  String? revelationType;

  SurahsDataEntity(this.number, this.name, this.englishName,
      this.englishNameTranslation, this.numberOfAyahs, this.revelationType);

  factory SurahsDataEntity.fromJson(Map<String, dynamic> json) =>
      _$SurahsDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SurahsDataEntityToJson(this);
}
