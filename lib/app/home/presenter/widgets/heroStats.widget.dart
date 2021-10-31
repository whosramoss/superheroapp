import '../../../../app/app.theme.dart';
import '../../../../app/home/data/models/superhero.model.dart';
import 'package:flutter/material.dart';

class HeroStats extends StatelessWidget {
  final SuperHeroModel item;
  const HeroStats({Key key, this.item}) : super(key: key);

  String checkData(String data) {
    return data.isNotEmpty && data != '' && data != 'null' && data != null
        ? data
        : 'N/A';
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      height: _size.height * 1.5,
      child: Column(
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard('Full name', item.fullname),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard('Occupation', item.occupation),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard('Gender', item.gender),
                _buildStatCard('Race', item.race),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard('Durability', item.durability),
                _buildStatCard('Power', item.power),
                _buildStatCard('Combat', item.combat),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard('Intelligence', item.intelligence),
                _buildStatCard('Strength', item.strength),
                _buildStatCard('Speed', item.speed),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard('Height', item.height.join(' - ').toString()),
                _buildStatCard('Weight', item.weight.join(' - ').toString()),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard('Eye Color', item.eyecolor),
                _buildStatCard('Hair Color', item.haircolor),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard('Publisher', item.publisher),
                _buildStatCard('Alignment', item.alignment),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard('Alter egos', item.alteregos),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard('Place of birth', item.placeofbirth),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard('Aliases', item.aliases.join(' - ').toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildStatCard(String title, String text) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: ThemeSuperHeroApp.appColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FittedBox(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              checkData(text),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
