import 'package:cached_network_image/cached_network_image.dart';
import '../../../../app/app.theme.dart';
import '../../../../app/home/domain/entities/superhero.dart';
import '../../../../app/home/presenter/pages/hero.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'errorImage.widget.dart';
import 'loadingImage.widget.dart';

class HeroList extends StatelessWidget {
  final List<SuperHero> list;
  HeroList({this.list});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: list.length,
        staggeredTileBuilder: (int index) {
          return StaggeredTile.count(2, index.isEven ? 4 : 3);
        },
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 20.0,
        itemBuilder: (BuildContext context, int index) {
          var item = list[index];
          return GestureDetector(
            onTap: () => _showHeroDetails(context, item),
            child: Stack(
              fit: StackFit.expand,
              children: [
                _heroItemImage(item),
                _heroItemTitle(item),
              ],
            ),
          );
        },
      ),
    );
  }

  _showHeroDetails(BuildContext context, SuperHero item) {
    bool keyboardIsOpen = FocusScope.of(context).hasFocus;
    if (keyboardIsOpen) FocusScope.of(context).unfocus();

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext builderContext) => HeroPage(item: item),
    );
  }

  _heroItemImage(SuperHero item) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: item.image,
        progressIndicatorBuilder: (_, url, __) => LoadingHeroItemImage(),
        errorWidget: (context, url, error) => ErrorHeroItemImage(),
      ),
    );
  }

  _heroItemTitle(SuperHero item) {
    return Padding(
      padding: EdgeInsets.only(left: 0.0, bottom: 0.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: RotatedBox(
          quarterTurns: 3,
          child: Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: ThemeSuperHeroApp.kColorDarkGrey.withOpacity(0.75),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(8),
                topLeft: Radius.circular(8),
              ),
              border: Border.all(
                width: 3,
                color: ThemeSuperHeroApp.kColorDarkGrey,
                style: BorderStyle.solid,
              ),
            ),
            child: Text(
              item.name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: ThemeSuperHeroApp.backgroundColor,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
