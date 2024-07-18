import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_app/home/data/controller/individual_surah_controller.dart';
import 'package:quran_app/home/data/controller/quran_controller.dart';
import 'package:quran_app/home/data/repo/quran_repo.dart';
import 'package:quran_app/home/view/widgets/custom_drop_down.dart';

class HomeQuran extends ConsumerStatefulWidget {
  const HomeQuran({super.key});

  @override
  ConsumerState<HomeQuran> createState() => _HomeQuranState();
}

class _HomeQuranState extends ConsumerState<HomeQuran> {
  late final TextEditingController surahController;

  @override
  void initState() {
    super.initState();
    surahController = TextEditingController();
    _ayahsListScrollController.addListener(() {
      if (_ayahsListScrollController.position.pixels >=
          _ayahsListScrollController.position.maxScrollExtent * 0.9) {
        ref.read(ayahsControllerProvider.notifier).loadAyahs(surah: ref.watch(surahMenuItemStateProvider)!.id);
      }
    });
  }

  final _ayahsListScrollController = ScrollController();

  @override
  void dispose() {
    surahController.dispose();
    _ayahsListScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ayahsListState = ref.watch(ayahsControllerProvider);
    final ayahs = ayahsListState.ayahs;
    final menuItem = ref.watch(surahMenuItemStateProvider);

    if (menuItem != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        surahController.text = '${menuItem.id}. ${menuItem.label}';
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        toolbarHeight: 120,
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: DropdownMenuSample(
                menuItems: ref.watch(quranSurahsControllerProvider).value ?? [],
                selectedMenu: ref.watch(surahMenuItemStateProvider),
                hint: 'Select Surah',
                menuController: surahController,
                onSelected: (v) {
                  surahController.text = '${v?.id}. ${v?.label}';
                  ref.read(surahMenuItemStateProvider.notifier).update((surah)=>v);
                  if(v!= null) {
                    ref.invalidate(ayahsControllerProvider);
                    ref
                        .read(ayahsControllerProvider.notifier)
                        .loadAyahs(surah: v.id);
                  }
                }),
          ),
        ),
      ),
      body: Builder(
        builder: (context) {
          if(ayahs.isEmpty){
            if(ayahsListState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else if(ayahsListState.error != null){
            return  Center(
                child: Column(
                  children: [
                    IconButton(onPressed: (){
                      ref.invalidate(ayahsControllerProvider);
                    }, icon: const Icon(Icons.refresh_outlined)),
                    const Text('Something went wrong try again!')
                  ],
                ),
              );
            }
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 12),
            controller: _ayahsListScrollController,
            itemCount: ayahs.length + 1,
            itemBuilder: (context, index) {
              if (index == ayahs.length) {
                if (ayahsListState.loading) {
                  return const SizedBox(
                    height: 200,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }else if(ayahsListState.maxLoaded){
                 return TextButton(onPressed: (){
                    ref.invalidate(ayahsControllerProvider);
                    ref
                        .read(ayahsControllerProvider.notifier)
                        .loadAyahs(surah: (ref.watch(surahMenuItemStateProvider)?.id)!+1);
                  }, child: const Text('Move to Next Surah'));
                }
                return const SizedBox.shrink();
              }
              return ListTile(
                title: Text('${ayahs[index]?.text.toString()} (${ayahs[index]?.numberInSurah})' ?? '',textDirection: TextDirection.rtl,),
              );
            } );
        }
      ),);
  }
}

final surahMenuItemStateProvider = StateProvider<MenuItem?>((ref) => MenuItem(id: 1, label:' سُورَةُ ٱلْفَاتِحَةِ'));
