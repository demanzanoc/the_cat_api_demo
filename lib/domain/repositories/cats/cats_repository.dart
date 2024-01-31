import '../../entities/cats/cat.dart';

abstract class CatsRepository {
  Future<List<Cat>> getCats();
}
