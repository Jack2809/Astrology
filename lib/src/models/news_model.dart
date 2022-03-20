
class NewsModel {
  final int id ;
  final String title;
  final String description;
  final String generateDate;
  final String content;
  final String tag;
  final String htmlContent;
  final String banner;

  NewsModel({required this.id,required this.title,required this.description,
  required this.generateDate, required this.content,required this.tag,required this.htmlContent,required this.banner});

  factory NewsModel.fromJson(Map<String,dynamic>json){
    return NewsModel(
        id: json['id'] as int,
        title: json['title'],
        description:json['description'],
        generateDate:json['generatDate'],
        content:json['content'],
        tag:json['tag'],
        htmlContent:json['htmlContent'],
      banner: json['banner']
    );
  }
}