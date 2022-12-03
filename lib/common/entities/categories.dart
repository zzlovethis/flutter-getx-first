/// 新闻分类 response
/// 数据单独放置，不进行状态化，在每个页面的state中进行状态化。
class CategoryResponseEntity {
  String code;
  String title;

  CategoryResponseEntity({
    required this.code,
    required this.title,
  });

  factory CategoryResponseEntity.fromJson(Map<String, dynamic> json) =>
      CategoryResponseEntity(
        code: json["code"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "title": title,
      };
}
