import 'package:flutter/material.dart';

import '../../../app.theme.dart';

class LoadingHeroItemImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [ThemeSuperHeroApp.kDefaultShadow],
      ),
      child: new Center(
        child: new CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(
            ThemeSuperHeroApp.kColorLightGrey,
          ),
          value: 2,
        ),
      ),
    );
  }
}
