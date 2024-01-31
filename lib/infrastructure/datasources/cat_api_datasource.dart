import 'package:dio/dio.dart';
import 'package:prueba_gatos/domain/datasources/cats_datasource.dart';
import 'package:prueba_gatos/domain/entities/cat.dart';
import 'package:prueba_gatos/infrastructure/models/the_cat_api/cat_api_response.dart';
import '../mappers/cat_mapper.dart';

class CatApiDatasource implements CatsDatasource {
  final String errorMessage = 'Error getting data. Code:';
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.thecatapi.com/v1',
      queryParameters: {'x-api-key': 'bda53789-d59e-46cd-9bc4-2936630fde39'},
    ),
  );

  @override
  Future<List<Cat>> getCats() async {
    try {
      final response = await dio.get('/breeds');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final catsResponse =
        data.map((json) => CatApiResponse.fromJson(json)).toList();
        final Future<List<Cat>> cats = _getCatsFromApi(catsResponse);
        return cats;
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (exception) {
      throw Exception(exception);
    }
  }

  Future<List<Cat>> _getCatsFromApi(List<CatApiResponse> catsResponse) async {
    final List<Future<Cat>> catFutures = catsResponse.map((catResponse) async {
      return CatMapper.catApiToEntity(
          catResponse, await _getUrlImage(catResponse.referenceImageId));
    }).toList();
    final List<Cat> cats = await Future.wait(catFutures);
    return cats;
  }

  Future<String> _getUrlImage(String referenceImageId) async {
    const urlImageNotFound =
        'https://t3.ftcdn.net/jpg/02/61/08/76/360_F_261087622_8eRI0TAwDAyabS1b0Uifx1wKqHzA41r3.jpg';
    try {
      if (referenceImageId.isEmpty) return urlImageNotFound;
      final response = await dio.get('/images/$referenceImageId');
      if (response.statusCode == 200) {
        return response.data["url"];
      } else {
        throw Exception('$errorMessage ${response.statusCode}');
      }
    } catch (exception) {
      throw Exception(exception);
    }
  }
}
