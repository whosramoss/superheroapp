import 'package:cached_network_image/cached_network_image.dart';
import '../../../../app/app.theme.dart';
import '../../../../app/home/data/models/superhero.model.dart';
import '../../../../app/home/presenter/widgets/heroItemName.widget.dart';
import '../../../../app/home/presenter/widgets/heroStats.widget.dart';
import 'package:flutter/material.dart';

class HeroPage extends StatelessWidget {
  final SuperHeroModel item;

  const HeroPage({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            child: CachedNetworkImage(
              fit: BoxFit.fitHeight,
              imageUrl: item.image,
              progressIndicatorBuilder: (_, url, __) => Container(
                color: ThemeSuperHeroApp.accentColor,
              ),
              errorWidget: (context, url, error) => Container(
                color: ThemeSuperHeroApp.accentColor,
              ),
            ),
          ),
          Container(
            color: ThemeSuperHeroApp.accentColor.withOpacity(0.8),
          ),
          Positioned(
            top: 60,
            right: 20,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white, size: 40),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 120),
                HeroItemName(
                  name: item.name,
                  style: ThemeSuperHeroApp.nameBigStyle,
                ),
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: HeroStats(item: item),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
