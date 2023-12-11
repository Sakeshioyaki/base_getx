class NoteModel {
  String? title;
  String? dateModify;
  String? dateCreate;
  String? content;
  String? type;

  NoteModel({
    this.title,
    this.dateModify,
    this.dateCreate,
    this.content,
    this.type,
  });

  NoteModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    dateModify = json['date_modify'];
    dateCreate = json['date_create'];
    content = json['content'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['date_modify'] = dateModify;
    data['date_create'] = dateCreate;
    data['content'] = content;
    data['type'] = type;
    return data;
  }
}
