class BlogItem {

  int? id;
  int? idList;

  String? title;

  String? imageUrl;
  String? blogName;
  String? author;

  String? category;
  String? content;
  String? status;

  String? isFavorate;
  String? createdAt;
  int? favorateNum;

  BlogItem({this.id,
    this.idList,
    this.title,
    this.imageUrl,
    this.category,
    this.blogName,
    this.author,
    this.content,
    this.status,
    this.isFavorate,
    this.createdAt,
      this.favorateNum});

  BlogItem.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    idList = element["idList"];
    title = element["title"];
    imageUrl = element["imageUrl"];
    //image = ApiConstant.hostDlUrl + element["image"];
    //catId = element["catId"];
    blogName = element["blogName"];
    author = element["author"];
    isFavorate = element["isFavorate"];
    content = element["content"];
    status = element["status"];
    createdAt = element["created_at"];
    favorateNum = element["favorateNum"];
    category = element["category"];
  }


  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idList'] = idList;
    data['title'] = title;
    data['blogName'] = blogName;
    data['author'] = author;
    data['isFavorate'] = isFavorate;
    data['content'] = content;
    data['category'] = category;
    data['createdAt'] = createdAt;
    data['status'] = status;
    data['favorateNum'] = favorateNum;
    data['imageUrl'] = imageUrl;
    return data;

      //'id': (id == 0) ? null : id,
      // 'idList':idList,
      // 'title': title,
      // 'blogName': blogName,
      // 'author': author,
      // 'isFavorate': isFavorate,
      // 'content': content,
      // 'category': category,
      // 'createdAt': createdAt,
      // 'status': status,
      // 'favorateNum':favorateNum,
      // 'imageUrl':imageUrl,
  }
}
