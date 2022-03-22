
class UserModel{
  final int id;
  final String name;
  final String email;
  final String phoneNumber;
  final String avatarLink;
  final List<Profile> profileList;

  UserModel({required this.id,required this.name,required this.email,required this.phoneNumber,
  required this.avatarLink,required this.profileList});

  
  factory UserModel.fromJson(Map<String,dynamic>json){
    return UserModel(
        id: json['id'] as int,
        name: json['userName'] as String,
        email: json['email']as String,
        phoneNumber: json['phoneNumber'] as String,
      avatarLink: json['avatarLink'] as String,
      profileList: new List<Profile>.from(json['profiles'].map((x) => Profile.fromJson(x))),
    );
  }
}

class Profile{
  final int id;
  final String name;
  final String birthDate;
  final String birthPlace;
  final String profilePhoto;
  final double longitude;
  final double latitude;
  late final int userId;
  final bool gender;

  Profile({required this.id,required this.name,required this.birthDate,
    required this.birthPlace,required this.profilePhoto,required this.longitude,required this.latitude,
    required this.userId,required this.gender});
  void setUserId(int userID){
    this.userId=userID;
  }
  factory Profile.fromJson(Map<String,dynamic>json){
    return Profile(
        id: json['id'] as int,
        name: json['name'] as String,
        birthDate: json['birthDate'] as String,
        birthPlace: json['birthPlace'] as String,
        profilePhoto: json['profilePhoto'] as String,
        longitude: json['longitude'].toDouble(),
        latitude: json['latitude'].toDouble(),
        userId: json['userId'] as int,
        gender: json['gender'] as bool,

    );
  }
}