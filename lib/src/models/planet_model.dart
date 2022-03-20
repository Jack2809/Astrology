
class PlanetModel {
  final int id;
  final String name;
  final String title;
  final String icon;
  final String description;
  final String mainContent;

  PlanetModel({required this.id, required this.name, required this.title,
    required this.icon, required this.description, required this.mainContent});

  factory PlanetModel.fromJson(Map<String, dynamic>json){
    return PlanetModel(
      id: json['id'] as int,
      name: json['name'] as String,
      title: json['title'] as String,
      icon: json['icon'] as String,
      description: json['decription'] as String,
      mainContent: json['mainContent'] as String,
    );
  }

  PlanetModel.general({required this.id, required this.name,
    required this.icon})
      :title='',
        description='',
        mainContent='';

  factory PlanetModel.fromGeneralJson(Map<String, dynamic> json){
    return PlanetModel.general(
      id: json['id'] as int,
      name: json['name'] as String,
      icon: json['icon'] as String,
    );
  }

}