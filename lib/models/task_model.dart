class TaskModel {
  String id;
  String title;
  String category;
  String location;
  String description;
  int date;
  bool isDone;

  TaskModel({
    this.id = "",
    required this.title,
    required this.description,
    required this.category,
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
            isDone: json['isDone']);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "date": date,
      "location": location,
      "category": category,
      "isDone": isDone,
    };
  }
}
