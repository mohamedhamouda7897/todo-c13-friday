import 'package:flutter/material.dart';

abstract class BaseConnector {
  showLoading({String? message});

  showError({String? message});

  showSuccess();
}

class BaseViewModel<T extends BaseConnector> extends ChangeNotifier {
  T? connector;
}

abstract class BaseView<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> implements BaseConnector {
  late VM viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = initMyViewModel();
  }

  VM initMyViewModel();

  @override
  showError({String? message}) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Something went wrong"),
        content: Text(message ?? ""),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"))
        ],
      ),
    );
  }

  @override
  showLoading({String? message}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        title: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  @override
  showSuccess() {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Successfully"),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"))
        ],
      ),
    );
  }
}
