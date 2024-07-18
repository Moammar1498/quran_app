import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_app/home/data/repo/individual_surah_repo.dart';
import 'package:quran_app/home/data/state/ayahs_list_state.dart';
import 'package:quran_app/home/view/home_quran.dart';
import 'package:quran_app/home/view/widgets/custom_drop_down.dart';

final ayahsControllerProvider =
    StateNotifierProvider<AyahListController, AyahListState>((ref) {
  final repository = ref.watch(individualSurahRepoProvider);
  return AyahListController(ref: ref, repository: repository);
});

class AyahListController extends StateNotifier<AyahListState> {
  final IndividualSurahRepo _repository;
  final Ref ref;

  AyahListController({
    required IndividualSurahRepo repository,
    required this.ref,
  })  : _repository = repository,
        super(AyahListState.initial());

  void loadAyahs({required int surah}) async {
    if (state.maxLoaded) {
      return;
    }

    if (state.loading) {
      return;
    }

    state = state.copyWith(loading: true);
    final result =
        await _repository.getSurahAyahs(surah: surah, skip: state.ayahs.length);

    result.fold((failure) {
      state = state.copyWith(loading: false, error: 'Something went wrong!');
    }, (ayahsData) {
      if (ayahsData != null) {
        ref.read(surahMenuItemStateProvider.notifier).update((cb) => MenuItem(
            id: ayahsData.number!,
            label: ayahsData.name!));
        final ayahs = ayahsData.ayahs ?? [];
        state =
            state.copyWith(ayahs: [...state.ayahs, ...ayahs], loading: false);

        if (state.ayahs.length== ayahsData.numberOfAyahs) {
          state = state.copyWith(maxLoaded: true, loading: false);
        }
      } else {
        state = state.copyWith(loading: false);
      }
    });
  }
}
