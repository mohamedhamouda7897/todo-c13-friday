class TaskModel {
  String id;
  String title;
  String category;
  String location;
  String description;
  int date;
  bool isDone;
  String userId;

  TaskModel({
    this.id = "",
    required this.title,
    required this.description,
    required this.category,
    required this.userId,
    this.location = "",
    required this.date,
    this.isDone = false,
  });

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            title: json['title'],
            description: json['description'],
            date: json['date'],
            location: json['location'],
            category: json['category'],
            userId: json['userId'],
            isDone: json['isDone']);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "date": date,
      "location": location,
      "category": category,
      "userId": userId,
      "isDone": isDone,
    };
  }
}
