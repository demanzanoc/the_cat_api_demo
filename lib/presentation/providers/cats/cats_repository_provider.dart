import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_gatos/infrastructure/datasources/cat_api_datasource.dart';
import 'package:prueba_gatos/infrastructure/repositories/cat_repository_impl.dart';

final catsRepositoryProvider =
    Provider((ref) => CatRepositoryImpl(CatApiDatasource()));
