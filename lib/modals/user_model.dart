class UserModel {
  String? userName;
  String? email;
  String? userId;

  UserModel({this.userName, this.email, this.userId});

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    email = json['email'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_name'] = userName;
    data['email'] = email;
    data['user_id'] = userId;
    return data;
  }
}
