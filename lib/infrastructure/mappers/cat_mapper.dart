import 'package:prueba_gatos/infrastructure/models/the_cat_api/cat_api_response.dart';
import '../../domain/entities/cat.dart';

class CatMapper {
  static Cat catApiToEntity(CatApiResponse catResponse, String imageUrl) => Cat(
        origin: catResponse.origin,
        affectionLevel: catResponse.affectionLevel,
        intelligence: catResponse.intelligence,
        imageUrl: imageUrl,
        breedName: catResponse.name,
      );
}
