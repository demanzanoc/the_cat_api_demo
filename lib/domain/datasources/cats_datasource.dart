import 'package:prueba_gatos/domain/entities/cat.dart';

abstract class CatsDatasource {
  Future<List<Cat>> getCats();
}
