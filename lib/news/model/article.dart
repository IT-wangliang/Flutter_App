class Article {
  String title;
  String source;
  int behotTime;
  String imgUrl;
  String itemId;

  Article.fromJson(json) {
    title = json['title'];
    source = json['source'];
    behotTime = json['behot_time'];
    imgUrl = json['image_url'];
    itemId = json['item_id'];
  }
}
