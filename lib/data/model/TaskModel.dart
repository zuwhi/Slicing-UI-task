class TaskModel {
  int? id;
  String? title, desc, limit, category, created_at, update_at;

  TaskModel(
      {this.id,
      this.title,
      this.desc,
      this.limit,
      this.category,
      this.created_at,
      this.update_at});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      desc: json['desc'],
      limit: json['limit'],
      created_at: json['created_at'],
      update_at: json['update_at'],
    );
  }
}
