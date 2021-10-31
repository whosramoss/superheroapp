import 'dart:developer';
import 'endpoints.dart';
import '../models/superhero.model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'heroSearch.datasource.interface.dart';

part 'heroSearch.datasource.g.dart';

@Injectable(singleton: false)
class HeroSearchDatasource implements IHeroSearchDatasource {
  final Dio dio;
  HeroSearchDatasource(this.dio);

  @override
  Future<List<SuperHeroModel>> searchText(String textSearch) async {
    String text = textSearch.trim().replaceAll(' ', '+');
    var result = await this.dio.get(
          "${SuperHeroEndpoints.url}${SuperHeroEndpoints.key}/search/$text",
        );
    if (result.statusCode == 200) {
      List<SuperHeroModel> _list = <SuperHeroModel>[];
      for (var item in result.data['results'] as List) {
        _list.add(SuperHeroModel.fromJson(item));
      }
      return _list;
    } else {
      throw Exception();
    }
  }
}
