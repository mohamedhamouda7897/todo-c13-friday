import 'package:flutter/material.dart';

class CreateEventProvider extends ChangeNotifier {
  List<String> eventCategories = [
    "birthday",
    "book_club",
    "sport",
    "eating",
    "exhibtion",
    "gaming",
    "meeting",
    "workshop",
    "holiday",
  ];

  int selectedCategory = 0;
  DateTime selectedDate = DateTime.now();

  String get selectedCategoryName => eventCategories[selectedCategory];

  changeDate(DateTime date) {
    selectedDate = date;

    notifyListeners();
  }

  changeCategory(int index) {
    selectedCategory = index;
    notifyListeners();
  }
}
