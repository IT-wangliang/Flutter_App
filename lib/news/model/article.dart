class Article {
  String title;
  String description;
  String ctime;
  String picUrl;
  String url;

  Article.fromJson(json) {
    title = json['title'];
    description = json['description'];
    ctime = json['ctime'];
    picUrl = json['picUrl'];
    url = json['url'];
  }
}
