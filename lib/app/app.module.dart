import 'app.widget.dart';
import 'home/data/repositories/heroSearch.repository.implementation.dart';
import 'home/domain/usecases/heroSearchByText.usecase.dart';
import 'home/data/datasources/heroSearch.datasource.dart';
import 'home/presenter/pages/home.page.dart';
import 'home/presenter/stores/search_store.dart';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $HeroSearchByTextImplementation,
        $HeroSearchRepositoryImplementation,
        $HeroSearchDatasource,
        Bind((i) => Dio()),
        $SearchStore,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, __) => HomePage()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
