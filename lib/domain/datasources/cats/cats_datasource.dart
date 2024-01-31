import 'package:prueba_gatos/domain/entities/cats/cat.dart';

abstract class CatsDatasource {
  Future<List<Cat>> getCats();
}
