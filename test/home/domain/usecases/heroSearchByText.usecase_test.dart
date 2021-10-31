import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:superheroapi/app/home/domain/entities/superhero.dart';
import 'package:superheroapi/app/home/domain/errors/erros.dart';
import 'package:superheroapi/app/home/domain/repositories/search.repository.interface.dart';
import 'package:superheroapi/app/home/domain/usecases/heroSearchByText.usecase.dart';

class SearchRepositoryMock extends Mock implements IHeroSearchRepository {}

void main() {
  final repository = SearchRepositoryMock();
  final usecase = HeroSearchByTextImplementation(repository);

  test('Return Heros List', () async {
    when(repository.getHeros("batman")).thenAnswer(
      (_) async => right(<SuperHero>[SuperHero()]),
    );

    var result = await usecase("batman");
    expect(result | null, isA<List<SuperHero>>());
  });

  test('Return [InvalidSearchText] (case: search text is invalid)', () async {
    var result = await usecase(null);
    expect(result.fold(id, id), isA<InvalidSearchText>());
  });

  test('Return [EmptyList] (case: data is empty)', () async {
    when(repository.getHeros("batman"))
        .thenAnswer((_) async => right(<SuperHero>[]));

    var result = await usecase("batman");
    expect(result.fold(id, id), isA<EmptyList>());
  });
}
