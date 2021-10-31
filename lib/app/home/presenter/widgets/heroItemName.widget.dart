import 'package:flutter/material.dart';

class HeroItemName extends StatelessWidget {
  final String name;
  final TextStyle style;

  HeroItemName({this.name, this.style});

  @override
  Widget build(BuildContext context) {
    String _firstName = '', _lastName = '';
    final List<String> _namePartitions = name.split(" ");
    _firstName = _namePartitions[0].toUpperCase();
    if (_namePartitions.length > 1) {
      _namePartitions.forEach((text) {
        if (_namePartitions[0] != text)
          _lastName = _lastName + '' + text.toUpperCase() + ' ';
      });
      _lastName = '\n$_lastName';
    }

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: _firstName, style: style),
          if (_namePartitions.length > 1)
            TextSpan(text: _lastName, style: style),
        ],
      ),
    );
  }
}
