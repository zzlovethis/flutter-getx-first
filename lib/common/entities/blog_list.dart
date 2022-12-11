class BlogList{
  int? id;
  String? title;
  String? category;


  BlogList(this.id, this.title, this.category);

  BlogList.fromJson(Map<String, dynamic> element) {
    id = element["id"];

    title = element["title"];

    category = element["category"];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': (id==0)?null:id,
      'title': title,
      'category':category,
    };
  }
}