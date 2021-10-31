import '../../domain/entities/superhero.dart';
import '../../../../app/home/domain/errors/erros.dart';

abstract class SearchState {}

class StartState implements SearchState {
  const StartState();
}

class LoadingState implements SearchState {
  const LoadingState();
}

class ErrorState implements SearchState {
  final Failure error;
  const ErrorState(this.error);
}

class SuccessState implements SearchState {
  final List<SuperHero> list;
  const SuccessState(this.list);
}
