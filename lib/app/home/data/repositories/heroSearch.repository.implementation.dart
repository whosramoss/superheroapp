import 'dart:developer';

import '../../../../app/home/domain/errors/erros.dart';
import '../../domain/entities/superhero.dart';
import '../../domain/repositories/search.repository.interface.dart';
import '../datasources/heroSearch.datasource.interface.dart';
import '../models/superhero.model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'heroSearch.repository.implementation.g.dart';

@Injectable(singleton: false)
class HeroSearchRepositoryImplementation implements IHeroSearchRepository {
  final IHeroSearchDatasource datasource;

  HeroSearchRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, List<SuperHero>>> getHeros(String searchText) async {
    List<SuperHeroModel> list;

    try {
      list = await datasource.searchText(searchText);
      return right(list);
    } catch (e) {
      return list == null ? left(EmptyList()) : left(ErrorSearch());
    }
  }
}
