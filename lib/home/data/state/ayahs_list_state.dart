import 'package:quran_app/home/models/surah_model_entity.dart';

class AyahListState {
  final List<SurahModelDataAyahsEntity?> ayahs;
  final bool loading;
  final bool maxLoaded;
  final String? error;

  AyahListState({
    required this.ayahs,
    required this.loading,
    required this.maxLoaded,
    this.error
  });

  AyahListState.initial({
    this.loading = false,
    this.maxLoaded = false,
    this.error
  }): ayahs = [];

  AyahListState copyWith({
    List<SurahModelDataAyahsEntity?>? ayahs,
    bool? loading,
    bool? maxLoaded,
    String? error,
  }) {
    return AyahListState(
      ayahs: ayahs ?? this.ayahs,
      loading: loading ?? this.loading,
      maxLoaded: maxLoaded ?? this.maxLoaded,
      error: error ?? this.error,
    );
  }
}