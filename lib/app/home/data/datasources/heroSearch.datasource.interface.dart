import '../models/superhero.model.dart';

abstract class IHeroSearchDatasource {
  Future<List<SuperHeroModel>> searchText(String textSearch);
}
