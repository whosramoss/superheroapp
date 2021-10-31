import 'dart:developer';

import '../../../../app/home/presenter/widgets/heroList.widget.dart';
import '../../../../app/home/presenter/widgets/loadingList.widget.dart';
import '../../../../app/home/presenter/widgets/zeroList.widget.dart';
import '../../../../app/home/presenter/states/search_state.dart';
import '../../../../app/home/presenter/stores/search_store.dart';
import '../../../../app/home/domain/errors/erros.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../app.theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, SearchStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeSuperHeroApp.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 300,
            color: ThemeSuperHeroApp.kColorDarkGrey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Super Heros",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ThemeSuperHeroApp.kColorLightGrey1,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Get all SuperHeroes and Villians\ndata from all universes",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ThemeSuperHeroApp.kColorLightGrey2,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 3),
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: TextField(
                    onChanged: controller.setSearchText,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                      hintText: "Search  ...",
                    ),
                  ),
                ),
                SizedBox(height: 30)
              ],
            ),
          ),
          Expanded(
            child: _buildList(),
          )
        ],
      ),
    );
  }

  Widget _buildList() {
    return Observer(
      builder: (_) {
        var state = controller.state;

        if (state is ErrorState) {
          if (state.error is EmptyList) {
            return ZeroList(
              text: "No heros found",
              iconData: Icons.warning_rounded,
            );
          } else if (state.error is ErrorSearch) {
            return ZeroList(
              text: "Something Wrong with API",
              iconData: Icons.warning_rounded,
            );
          } else {
            return ZeroList(
              text: "Internal Error",
              iconData: Icons.warning_rounded,
            );
          }
        }

        if (state is StartState) {
          return ZeroList(
            text: "What hero do you want\nto search for?",
            iconData: Icons.search,
          );
        } else if (state is LoadingState) {
          return LoadingList();
        } else if (state is SuccessState) {
          return HeroList(list: state.list);
        } else {
          return Container();
        }
      },
    );
  }
}
