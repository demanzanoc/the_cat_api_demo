import '../entities/cat.dart';

abstract class CatsRepository {
  Future<List<Cat>> getCats();
}
