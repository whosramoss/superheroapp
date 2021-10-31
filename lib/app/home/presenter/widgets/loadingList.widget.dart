import '../../../../app/app.theme.dart';
import 'package:flutter/material.dart';

class LoadingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(
              ThemeSuperHeroApp.accentColor,
            ),
            value: 4,
          ),
          SizedBox(height: 20),
          Text(
            'Loading Heros',
            style: TextStyle(
              fontWeight: FontWeight.w300,
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
