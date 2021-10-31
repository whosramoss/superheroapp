import 'dart:convert';
import '../../domain/entities/superhero.dart';

class SuperHeroModel extends SuperHero {
  String id, name, image;

  // [Powerstats Object]
  String intelligence, strength, speed, durability, power, combat;

  // [Biography Object]
  List<dynamic> aliases;
  String placeofbirth,
      firstappearance,
      publisher,
      alignment,
      fullname,
      alteregos;

  // [Appearance Object]
  String gender, race, eyecolor, haircolor;
  List<dynamic> height, weight;

  // [Work Object]
  String occupation, base;

  // [Connections Object]
  String groupaffiliation, relatives;

  SuperHeroModel({
    this.id,
    this.name,
    this.image,
    this.intelligence,
    this.strength,
    this.speed,
    this.durability,
    this.power,
    this.combat,
    this.fullname,
    this.alteregos,
    this.aliases,
    this.placeofbirth,
    this.firstappearance,
    this.publisher,
    this.alignment,
    this.gender,
    this.race,
    this.height,
    this.weight,
    this.eyecolor,
    this.haircolor,
    this.occupation,
    this.base,
    this.groupaffiliation,
    this.relatives,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'intelligence': intelligence,
      'strength': strength,
      'speed': speed,
      'durability': durability,
      'power': power,
      'combat': combat,
      'fullname': fullname,
      'alteregos': alteregos,
      'aliases': aliases,
      'placeofbirth': placeofbirth,
      'firstappearance': firstappearance,
      'publisher': publisher,
      'alignment': alignment,
      'gender': gender,
      'race': race,
      'height': height,
      'weight': weight,
      'eyecolor': eyecolor,
      'haircolor': haircolor,
      'occupation': occupation,
      'base': base,
      'groupaffiliation': groupaffiliation,
      'relatives': relatives,
    };
  }

  SuperHeroModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image']['url'];
    // --
    intelligence = json['powerstats']['intelligence'];
    strength = json['powerstats']['strength'];
    speed = json['powerstats']['speed'];
    durability = json['powerstats']['durability'];
    power = json['powerstats']['power'];
    combat = json['powerstats']['combat'];
    // --
    fullname = json['biography']['full-name'];
    alteregos = json['biography']['alter-egos'];
    aliases = json['biography']['aliases'];
    placeofbirth = json['biography']['place-of-birth'];
    firstappearance = json['biography']['first-appearance'];
    publisher = json['biography']['publisher'];
    alignment = json['biography']['alignment'];
    // --
    gender = json['appearance']['gender'];
    race = json['appearance']['race'];
    height = json['appearance']['height'];
    weight = json['appearance']['weight'];
    eyecolor = json['appearance']['eye-color'];
    haircolor = json['appearance']['hair-color'];
    // --
    occupation = json['work']['occupation'];
    base = json['work']['base'];
    // --
    groupaffiliation = json['connections']['group-affiliation'];
    relatives = json['connections']['relatives'];
  }
}
