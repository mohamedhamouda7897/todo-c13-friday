import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_c13_friday/firebase/firebase_manager.dart';
import 'package:todo_c13_friday/models/task_model.dart';
import 'package:todo_c13_friday/screens/home/tabs/home_tab/event_item.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
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
              "John Safwat",
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
              Container(
                height: 70,
              )
            ],
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot<TaskModel>>(
        stream: FirebaseManager.getEvents(),
        builder: (context, snapshot) {
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
