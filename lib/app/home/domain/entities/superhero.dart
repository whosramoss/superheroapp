class SuperHero {
  final String id;
  final String name;
  final String image;

  // [powerstats data]
  final String intelligence;
  final String strength;
  final String speed;
  final String durability;
  final String power;
  final String combat;

  // [biography data]
  final String fullname; // full-name;
  final String alteregos; //alter-egos;
  final List<dynamic> aliases;
  final String placeofbirth; //place-of-birth;
  final String firstappearance; // first-appearance;
  final String publisher;
  final String alignment;

  // [appearance data]
  final String gender;
  final String race;
  final List<dynamic> height;
  final List<dynamic> weight;
  final String eyecolor; //eye-color;
  final String haircolor; // hair-color;

  // [work data]
  final String occupation;
  final String base;

  // [connections data]
  final String groupaffiliation; //group-affiliation;
  final String relatives;

  const SuperHero({
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
}
