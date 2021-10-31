import 'package:flutter/material.dart';

import '../../../app.theme.dart';

class ErrorHeroItemImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [ThemeSuperHeroApp.kDefaultShadow],
      ),
      child: new Center(
        child: Icon(
          Icons.error,
          color: ThemeSuperHeroApp.kColorLightGrey2,
          size: 40,
        ),
      ),
    );
  }
}
