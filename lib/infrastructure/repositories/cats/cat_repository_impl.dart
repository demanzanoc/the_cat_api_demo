import 'package:prueba_gatos/domain/datasources/cats/cats_datasource.dart';
import 'package:prueba_gatos/domain/entities/cats/cat.dart';
import 'package:prueba_gatos/domain/repositories/cats/cats_repository.dart';

class CatRepositoryImpl extends CatsRepository {
  final CatsDatasource datasource;

  CatRepositoryImpl(this.datasource);

  @override
  Future<List<Cat>> getCats() => datasource.getCats();
}
