import 'dart:developer';

import '../entities/superhero.dart';
import '../../../../app/home/domain/errors/erros.dart';
import '../repositories/search.repository.interface.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'heroSearchByText.usecase.g.dart';

mixin HeroSearchByText {
  Future<Either<Failure, List<SuperHero>>> call(String textSearch);
}

@Injectable(singleton: false)
class HeroSearchByTextImplementation implements HeroSearchByText {
  final IHeroSearchRepository repository;
  HeroSearchByTextImplementation(this.repository);

  @override
  Future<Either<Failure, List<SuperHero>>> call(String textSearch) async {
    var option = optionOf(textSearch);

    return option.fold(() => Left(InvalidSearchText()), (text) async {
      var result = await repository.getHeros(text);
      return result.fold((l) {
        return left(l);
      }, (r) {
        return r.isEmpty ? left(EmptyList()) : right(r);
      });
    });
  }
}
