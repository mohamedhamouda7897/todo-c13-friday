import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_c13_friday/models/task_model.dart';

class FirebaseManager {
  static CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }

  static Future<void> addEvent(TaskModel model) {
    var collection = getTasksCollection();
    var docRef = collection.doc();
    model.id = docRef.id;
    return docRef.set(model);
  }

  static Stream<QuerySnapshot<TaskModel>> getEvents() {
    var collection = getTasksCollection();
    return collection.orderBy("date").snapshots();
  }

  static Future<void> deleteTask(String id) {
    var collection = getTasksCollection();
    return collection.doc(id).delete();
  }

  static Future<void> updateTask(TaskModel model) {
    var collection = getTasksCollection();
    return collection.doc(model.id).update(model.toJson());
  }
}
