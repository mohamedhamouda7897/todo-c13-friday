import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c13_friday/firebase/firebase_manager.dart';
import 'package:todo_c13_friday/models/task_model.dart';
import 'package:todo_c13_friday/providers/AuthProvider.dart';
import 'package:todo_c13_friday/screens/home/tabs/home_tab/event_item.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<String> eventCategories = [
    "All",
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

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 0,
        leading: SizedBox(),
        backgroundColor: Theme.of(context).primaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Back ✨",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 14, color: Colors.white),
            ),
            Text(
              "${authProvider.userModel?.name}",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.white,
                    fontSize: 24,
                  ),
            ),
          ],
        ),
        actions: [
          Icon(
            Icons.sunny,
            color: Colors.white,
          ),
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Text(
              "EN",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
          ),
        ],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24))),
        bottom: AppBar(
          centerTitle: false,
          leadingWidth: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24))),
          toolbarHeight: 120,
          leading: SizedBox(),
          backgroundColor: Theme.of(context).primaryColor,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.pin_drop,
                    color: Colors.white,
                  ),
                  Text(
                    "Cairo , Egypt",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                  )
                ],
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                height: 40,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    width: 16,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        selectedCategory = index;
                        setState(() {});
                      },
                      child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: selectedCategory == index
                                ? Colors.white
                                : Colors.transparent,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(
                              18,
                            ),
                          ),
                          child: Text(
                            eventCategories[index],
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: selectedCategory == index
                                        ? Colors.black
                                        : Colors.white),
                          )),
                    );
                  },
                  itemCount: eventCategories.length,
                ),
              )
            ],
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot<TaskModel>>(
        stream: FirebaseManager.getEvents(eventCategories[selectedCategory]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
                child: Text("Something went wrong , please try again"));
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.separated(
              separatorBuilder: (context, i) => SizedBox(
                height: 24,
              ),
              itemBuilder: (context, index) {
                return EventItem(
                  model: snapshot.data!.docs[index].data(),
                );
              },
              itemCount: snapshot.data?.docs.length ?? 0,
            ),
          );
        },
      ),
    );
  }
}

// SafeArea(
// child: Column(
// children: [
// Container(
// padding: EdgeInsets.symmetric(horizontal: 16),
// color: Theme.of(context).primaryColor,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [

// Row(
// children: [

// SizedBox(
// width: 8,
// ),
// Container(
// margin: EdgeInsets.all(8),
// padding: EdgeInsets.symmetric(horizontal: 4),
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(8)),
// child: Text(
// "EN",
// style: Theme.of(context)
//     .textTheme
//     .titleMedium!
//     .copyWith(color: Theme.of(context).primaryColor),
// ),
// ),
// ],
// )
// ],
// ),
// )
// ],
// ),
// );
