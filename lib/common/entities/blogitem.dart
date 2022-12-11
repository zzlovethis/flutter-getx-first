class BlogItem {
  int? id;
  int? idList;

  String? title;

  //String? image;
  String? blogName;
  String? author;
  String? category;
  String? content;
  String? status;
  bool? isFavorate;
  String? createdAt;

  BlogItem(
    this.id,
    this.idList,
    this.title,
    //this.image,
    this.category,
    this.blogName,
    this.author,
    this.content,
    this.status,
    this.isFavorate,
    this.createdAt);

  BlogItem.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    idList = element["idList"];
    title = element["title"];
    //image = ApiConstant.hostDlUrl + element["image"];
    //catId = element["catId"];
    blogName = element["blogName"];
    author = element["author"];
    isFavorate = element["isFavorate"];
    content = element["content"];
    status = element["status"];
    createdAt = element["created_at"];
    category = element["category"];
  }


  Map<String, dynamic> toMap() {
    return {
      'id': (id == 0) ? null : id,
      'idList':idList,
      'title': title,
      'blogName': blogName,
      'author': author,
      'isFavorate': isFavorate,
      'content': content,
      'category': category,
      'createdAt': createdAt,
      'status': status,
    };
  }
}
