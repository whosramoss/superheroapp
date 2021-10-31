import 'dart:developer';

import 'package:async/async.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../app/home/presenter/states/search_state.dart';
import '../../domain/usecases/heroSearchByText.usecase.dart';

part 'search_store.g.dart';

@Injectable()
class SearchStore = _SearchStoreBase with _$SearchStore;

abstract class _SearchStoreBase with Store {
  final HeroSearchByText searchByText;
  CancelableOperation cancellableOperation;

  _SearchStoreBase(this.searchByText) {
    reaction((_) => searchText, (text) async {
      stateReaction(text, cancellableOperation);
    }, delay: 500);
  }

  Future stateReaction(String text,
      [CancelableOperation cancellableOperation]) async {
    await cancellableOperation?.cancel();
    cancellableOperation = CancelableOperation<SearchState>.fromFuture(
      doHeroSearch(text),
    );
    if (text.isEmpty) {
      setState(StartState());
      return;
    }
    setState(LoadingState());
    setState(await cancellableOperation.valueOrCancellation(LoadingState()));
  }

  Future<SearchState> doHeroSearch(String text) async {
    var result = await searchByText(text);
    return result.fold((l) {
      return ErrorState(l);
    }, (r) {
      return SuccessState(r);
    });
  }

  @observable
  String searchText = "";

  @observable
  SearchState state = StartState();

  @action
  setSearchText(String value) => searchText = value;

  @action
  setState(SearchState value) => state = value;
}
