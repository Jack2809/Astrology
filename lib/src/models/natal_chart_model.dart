
class NatalChartModel{
  final String imageLink;
  // final List<PlanetInformation> planetList;

  NatalChartModel({required this.imageLink});

  factory NatalChartModel.fromJson(Map<String,dynamic>json){
    return NatalChartModel(
        imageLink: json['imgLink'],
        // planetList:  json['items'].forEach((key,value){
        //   new List<PlanetInformation>.from(value.map((x) => PlanetInformation.fromJson(x)));
        // }).toList(),
    );
  }

  // new List<PlanetInformation>.from(json['items'].forEach((key,value){
  // PlanetInformation.fromJson(value);
  // })).toList(),

  //new List<PlanetInformation>.from(json['items'].map((x) => PlanetInformation.fromJson(x))),

}





class PlanetInformation {
  final String planetName;
  final String planetIcon;
  final String zodiacName;
  final String zodiacIcon;
  final String houseName;
  final String content;

  PlanetInformation({required this.planetName,required this.planetIcon,required this.zodiacName,
  required this.zodiacIcon,required this.houseName,required this.content});

  factory PlanetInformation.fromJson(Map<String,dynamic> json){
    return PlanetInformation(
        planetName: json['planetName'],
        planetIcon: json['planetIcon'],
        zodiacName: json['zodiacName'],
        zodiacIcon: json['zodiacIcon'],
        houseName: json['houseName'],
        content: json['content'],
    );

  }

}