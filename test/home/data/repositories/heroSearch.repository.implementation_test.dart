import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:superheroapi/app/home/data/datasources/heroSearch.datasource.interface.dart';
import 'package:superheroapi/app/home/data/models/superhero.model.dart';
import 'package:superheroapi/app/home/data/repositories/heroSearch.repository.implementation.dart';
import 'package:superheroapi/app/home/domain/errors/erros.dart';

class HeroSearchDatasourceMock extends Mock implements IHeroSearchDatasource {}

main() {
  final datasource = HeroSearchDatasourceMock();
  final repository = HeroSearchRepositoryImplementation(datasource);

  test('Return List<SuperHeroModel>', () async {
    when(datasource.searchText("batman")).thenAnswer(
      (_) async => <SuperHeroModel>[SuperHeroModel()],
    );

    var result = await repository.getHeros("batman");
    expect(result | null, isA<List<SuperHeroModel>>());
  });

  test('Return [EmptyList] (case: get "null" from  datasource (api))',
      () async {
    when(datasource.searchText("batman")).thenThrow(
      (_) async => null,
    );

    var result = await repository.getHeros("batman");
    expect(result.fold(id, id), isA<EmptyList>());
  });
}
