import '../../../../app/home/domain/errors/erros.dart';
import '../entities/superhero.dart';
import 'package:dartz/dartz.dart';

abstract class IHeroSearchRepository {
  Future<Either<Failure, List<SuperHero>>> getHeros(String searchText);
}
