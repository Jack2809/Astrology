
class HouseModel {
  final int id;
  final String name ;
  final String title;
  final String icon;
  final String description;
  final String mainContent;

  HouseModel({required this.id,required this.name, required this.title,
    required this.icon,required this.description,required this.mainContent});

  factory HouseModel.fromJson(Map<String,dynamic>json){
    return HouseModel(
        id: json['id'] as int,
        name: json['name'] as String,
        title: json['title'] as String,
        icon: json['icon'] as String,
        description: json['decription'] as String,
        mainContent: json['mainContent'] as String,
    );
  }

  HouseModel.general({required this.id,required this.name,
    required this.icon}):title='',description = '',mainContent='';

  factory HouseModel.fromGeneralJson(Map<String,dynamic> json){
    return HouseModel.general(
      id: json['id'] as int,
      name: json['name'] as String,
      icon: json['icon'] as String,
    );

  }

}