import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_gatos/infrastructure/datasources/cats/cat_api_datasource.dart';
import 'package:prueba_gatos/infrastructure/repositories/cats/cat_repository_impl.dart';

final catsRepositoryProvider =
    Provider((ref) => CatRepositoryImpl(CatApiDatasource()));
