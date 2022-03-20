
class HoroscopeModel {
  final List<HoroscopeItem> routine;
  final List<HoroscopeItem> thinking;
  final List<HoroscopeItem> creativity;
  final List<HoroscopeItem> spirituality;
  final List<HoroscopeItem> socialLife;
  final List<HoroscopeItem> sexAndLove;
  final List<HoroscopeItem> self;

  HoroscopeModel({required this.routine,required this.thinking,required this.creativity,required this.spirituality
  ,required this.socialLife,required this.sexAndLove,required this.self});

  factory HoroscopeModel.fromJson(Map<String,dynamic>json){
    return HoroscopeModel(
      routine: json['routine'].map<HoroscopeItem>((json) =>HoroscopeItem.fromJson(json)).toList(),
      thinking: json['thinking'].map<HoroscopeItem>((json) =>HoroscopeItem.fromJson(json)).toList(),
      creativity: json['creativity'].map<HoroscopeItem>((json) =>HoroscopeItem.fromJson(json)).toList(),
      spirituality: json['spirituality'].map<HoroscopeItem>((json) =>HoroscopeItem.fromJson(json)).toList(),
      socialLife: json['social life'].map<HoroscopeItem>((json) =>HoroscopeItem.fromJson(json)).toList(),
      sexAndLove: json['sex & love'].map<HoroscopeItem>((json) =>HoroscopeItem.fromJson(json)).toList(),
      self: json['self'].map<HoroscopeItem>((json) =>HoroscopeItem.fromJson(json)).toList(),
    );
  }

}

class HoroscopeItem{
  final String lifeAttributeName;
  final String content;

  HoroscopeItem({required this.lifeAttributeName,required this.content});

  factory HoroscopeItem.fromJson(Map<String,dynamic> json){
    return HoroscopeItem(
        lifeAttributeName: json['lifeAttributeName'],
        content: json['content'],
    );
  }
}