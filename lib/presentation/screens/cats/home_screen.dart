import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_gatos/presentation/providers/cats/cats_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(catsProvider.notifier).getCats();
  }

  @override
  Widget build(BuildContext context) {
    final cats = ref.watch(catsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Catbreeds')),
      ),
      body: ListView.builder(
        itemCount: cats.length,
        itemBuilder: (context, index) {
          return Text(cats[index].origin);
        },
      ),
    );
  }
}
