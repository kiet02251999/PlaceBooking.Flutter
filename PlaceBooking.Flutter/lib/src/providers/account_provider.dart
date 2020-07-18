import 'package:flutter/material.dart';

//

class AccountProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  Future<bool> loading() async {
    try {
      _isLoading = true;
      await Future.delayed(Duration(seconds: 2));
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }
}
