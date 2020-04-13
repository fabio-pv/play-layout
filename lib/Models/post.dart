/// userId : 1
/// id : 1
/// title : "sunt aut facere repellat provident occaecati excepturi optio reprehenderit"
/// body : "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto"

class Post {
  int userId;
  int id;
  String title;
  String body;

  static Post fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Post postBean = Post();
    postBean.userId = map['userId'];
    postBean.id = map['id'];
    postBean.title = map['title'];
    postBean.body = map['body'];
    return postBean;
  }

  Map toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}