///博客标题清单，包括标题，分类，来源--公众号，点赞数，图片，发布时间
class BlogList{
  int? id;
  String? title;
  String? category;
  String? blogName;//公众号
  int? favorateNum;
  String? imageUrl;
  String? createdDateTime;
  String? content;


  BlogList({this.id, this.title, this.category,this.blogName,this.favorateNum,this.imageUrl,this.createdDateTime,this.content});

  BlogList.fromJson(Map<String, dynamic> element) {
    id = element['id'];

    title = element['title'];

    category = element["category"];

     blogName = element["blogName"];

    favorateNum = element["favorateNum"];

    imageUrl = element["imageUrl"];

    createdDateTime = element["createdDateTime"];

    content = element["content"];

  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['category'] = this.category;
    data['blogName'] = this.blogName;
    data['favorateNum'] = this.favorateNum;
    data['imageUrl'] = this.imageUrl;
    data['createdDateTime'] = this.createdDateTime;
    data['content'] = this.content;
    return data;
  }
}

