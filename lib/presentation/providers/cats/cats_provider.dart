import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_gatos/domain/entities/cat.dart';
import 'package:prueba_gatos/presentation/providers/cats/cats_repository_provider.dart';

final catsProvider = StateNotifierProvider<CatsNotifier, List<Cat>>((ref) {
  final fetchCats = ref.watch(catsRepositoryProvider).getCats;
  return CatsNotifier(fetchCats: fetchCats);
});

typedef CatCallback = Future<List<Cat>> Function();

class CatsNotifier extends StateNotifier<List<Cat>> {
  CatCallback fetchCats;

  CatsNotifier({required this.fetchCats}) : super([]);

  Future<void> getCats() async {
    final List<Cat> cats = await fetchCats();
    state = [...state, ...cats];
  }
}
