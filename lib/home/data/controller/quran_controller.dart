import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_app/home/data/repo/quran_repo.dart';
import 'package:quran_app/home/view/widgets/custom_drop_down.dart';

final quranSurahsControllerProvider = AutoDisposeFutureProvider((ref) async {
  final repo = ref.watch(quranSurahsRepoProvider);
  return await QuranSurahsController(repo: repo, ref: ref).getQuranSurahs();
});

class QuranSurahsController {
  final QuranSurahsRepo _repo;
  final Ref ref;

  QuranSurahsController({required QuranSurahsRepo repo, required this.ref})
      : _repo = repo;

  Future<List<MenuItem>> getQuranSurahs() async {
    /*AppUtils.showLoadingNoTimer(
      text: 'please wait assigning lead to the dealer.',
    );*/
    final result = await _repo.getSurahItems();

    return result.fold((error) {
      //AppUtils.cancelLoading();
      return [];
    }, (quranSurahsResponseData) {
      // AppUtils.cancelLoading();
      if (quranSurahsResponseData != null) {
        return quranSurahsResponseData
            .where((surah) => surah != null) // Filter out null surahs
            .map(
              (surah) => MenuItem(id: surah!.number!, label: surah.name!),
        )
            .toList();
      } else {
        return [];
      }
    });
  }
}
