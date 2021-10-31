import '../../../../app/app.theme.dart';
import 'package:flutter/material.dart';

class ZeroList extends StatelessWidget {
  final String text;
  final IconData iconData;
  ZeroList({this.text, this.iconData});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 40,
            color: ThemeSuperHeroApp.accentColor,
          ),
          SizedBox(height: 20),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: ThemeSuperHeroApp.accentColor,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
