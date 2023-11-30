class UserModel {
  String? userName;
  String? email;
  String? userId;
  String? avatarUrl;

  UserModel({this.userName, this.email, this.userId, this.avatarUrl});

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    email = json['email'];
    userId = json['user_id'];
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_name'] = userName;
    data['email'] = email;
    data['user_id'] = userId;
    data['avatar_url'] = avatarUrl;
    return data;
  }
}
